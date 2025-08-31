# Why does loop variable in repeat not work

**Link:**
<https://stackoverflow.com/questions/66743618/why-does-loop-variable-in-repeat-not-work>

**Asked:** 2021-03-22 09:45:36 UTC

------------------------------------------------------------------------

Loop variable of repeat can be used in its block like this:

    >> b: func [x] [x + i]
    == func [x][x + i]
    >> repeat i 2 [print reduce append copy [b] [3]]
    4
    5

You can see that the variable \"i\" is used by the function \"b\".

However,in the following example, the loop variable \"idx\" is not seen
by the function. Error message is given:

    *** Script Error: idx has no value


    Red []
    map: function [a-func a-block][
    result: [] args: [] clear result
    either parse a-block [some block!][
      repeat idx length? a-block/1 [
        clear args
        foreach x a-block [append args to-block x/:idx]
        append result reduce append copy [a-func] args
        ]
       return result 
      ]
      [
       repeat idx length? a-block [
         append result to-block a-func a-block/:idx
         ]
       ]
    ]

    map func [x y] [x + y - idx] [[1 2] [3 4]]

Why is the second code wrong? And how to make it working?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by 9214

> Loop variable of repeat can be used in its block like this

Unfortunately, this is conceptually wrong. Loop \"variable\" is not used
*in* the block, it is \"globally visible\" both to function\'s body
block and to `repeat`.

    >> repeat index 5 []
    >> index
    == 5

Diagrammatically, that\'s `lambda → <idx in global context> ← repeat`,
not `lambda → repeat → <idx in repeat's "scope">` as you probably think.

> However,in the following example, the loop variable \"idx\" is not
> seen by the function.

This is because you are using `function` constructor, which makes `idx`
word local to its context, like so:

    >> function [][repeat index 3 []]
    == func [/local index][repeat index 3 []]

By contrast, `func` (used in your first example) doesn\'t do that.

    >> func [][repeat index 3 []]
    == func [][repeat index 3 []]

That is, in this code:

    map func [x y] [x + y - idx] [[1 2] [3 4]]

`idx` within the anonymous function that you map over the block and
`idx` in `map` implementation are two completely different
\"variables\", bound to different contexts: one to the global (in which
it has no value, hence the error message), and another to a local (where
it is set to `none` by default).

The mechanics of Red\'s \"scoping\" model (or rather complete absence
thereof) is a bit of an advanced topic, though I can elaborate on it if
needed.

Suffice to say that it does not rely on traditional lexical scoping
(like in most of the Lisp dialects), nor does it have variables in the
strict sense of the term. Rather, it relies on symbolic values (aka
words) that carry with them a binding to namespaces (aka contexts),
which can be changed at will during the runtime (see `bind` in the
example below) --- a bit like f-expressions in
[Kernel](https://web.cs.wpi.edu/%7Ejshutt/kernel.html){rel="nofollow noreferrer"}
and older Lisps, or perhaps anaphoric macro, of which `collect` (see
below also) is a prime example: note that it \"captures\" `keep` word,
which from then on refers to its internal context, where it is defined
as an ad-hoc alias for `append`. Check out `source collect` output to
see what I mean.

------------------------------------------------------------------------

Here\'s a sketch of `map` (yours technically is more like `zip`, but
anyway) to give you a hint at the potential solution.

    map: function [
        function [function!]
        series   [series!]
    ][
        spec:  spec-of :function ; ideally needs to be cleaned up
        step:  length? spec
        index: 1
        
        bind body-of :function 'index
        
        collect [
            foreach :spec series [
                keep/only do compose [(:function) (:spec)]
                index: index + step
            ]
        ]
    ]

Example:

    >> map func [x] [reduce [index x]][a b c d]
    == [[1 a] [2 b] [3 c] [4 d]]
    >> map func [x y] [reduce [index x + y - index]][9 2 1 4]
    == [[1 10] [3 2]]

------------------------------------------------------------------------

## Comments on question
