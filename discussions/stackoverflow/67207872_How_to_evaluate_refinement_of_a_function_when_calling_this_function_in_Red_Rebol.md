# How to evaluate refinement of a function when calling this function in Red/Rebol

**Link:**
<https://stackoverflow.com/questions/67207872/how-to-evaluate-refinement-of-a-function-when-calling-this-function-in-red-rebol>

**Asked:** 2021-04-22 06:27:36 UTC

------------------------------------------------------------------------

    >> f: func [x /a][either a [x + 2] [x + 1]]
    == func [x /a][either a [x + 2] [x + 1]]

    >> b: /a
    == /a

    >> f/b 1
    *** Script Error: f has no refinement called b
    *** Where: f
    *** Stack: f  

    >> f/:b 1
    *** Script Error: f has no refinement called :b
    *** Where: f
    *** Stack: f  

You can see that the function `f` has a `refinement a`, and I bind `/a`
to `b`. When calling `f` with its refinement `/a` by `b`, it fails.

What is the correct way to pass a refinement which needs to be evaluated
before to its function? Or, is there a way to convert a `path!` to
`function!`?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by 9214

Refinements are limited, in a way that they can be passed only by being
listed literally in a function call. On the other hand, you can
construct such function call (a `path!` value followed by all the
arguments) whichever way you want:

    >> b: 'a
    == a
    >> do probe reduce [to path! reduce ['f b] 1]
    [f/a 1]
    == 3

Note that elements of the path in this case are `word!`s, not
`refinement!`s. In general, such use-case is covered by `apply`.
However, only Rebol has it natively, and with an awkward calling
convention:

    >> f: func [x /a][either a [x + 2] [x + 1]]
    >> b: yes
    == true
    >> apply :f [1 b]
    == 3
    >> apply :f [1 no]
    == 2  

You can easily write your own high-level version of it if that\'s what
you need.

*Comment by lyl:* Perfect solution! And another method under your point:
`b: "/a" do rejoin ["f" b " " 1]`. Thank you!

------------------------------------------------------------------------

### Answer (score: 0) --- by DocKimbel

You can now use dynamic refinements in Red to solve that simply:

    f: func [x /a][either a [x + 2] [x + 1]]

    >> f/:a 1
    == 3
    >> a: false
    == false
    >> f/:a 1
    == 2

You can also use new `apply` for that:

    >> apply :f [1 /a (2 < 3)]
    == 3
    >> apply :f [1 /a (find "hi" "o")]
    == 2

Notice that the value following the refinement is converted to a
`logic!` value in order to determine if the refinement is passed or not
to the function call.

See the related [blog
entry](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html){rel="nofollow noreferrer"}
for more info.

------------------------------------------------------------------------

## Comments on question
