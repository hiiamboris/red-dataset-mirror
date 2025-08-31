# How to construct a function with a default argument

**Link:**
<https://stackoverflow.com/questions/67075118/how-to-construct-a-function-with-a-default-argument>

**Asked:** 2021-04-13 12:42:55 UTC

------------------------------------------------------------------------

To make a function with default argument, I tried this:

    f: function [a b] [either unset? :b [a + 1] [a + b]]
    f 5
    f 3 5

then I receive this message
`*** Script Error: f is missing its b argument`.\
So, what shall I do?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Maciej Łoziński

You can use a *refinement*. See:
[http://helpin.red/Functions.html](http://helpin.red/Functions.html){rel="nofollow noreferrer"}

For example:

    >> increase: function [a /add b] [either none? b [a + 1] [a + b]]
    == func [a /add b][either none? b [a + 1] [a + b]]
    >> increase 3
    == 4
    >> increase/add 3 5
    == 8

*Comment by lyl:* Thank you. Yes, refinement is a solution. But I think
this deviates from the original idea of default argument in function.

*Comment by Maciej Łoziński:* I\'m afraid it\'s not possible in Red. You
can also try to use block as an argument, and block can have as many
elements as you want. But that\'s just a workaround.

------------------------------------------------------------------------

### Answer (score: 2) --- by 9214

There\'s a trick to implement variable-arity functions that some of the
built-ins use, most notably `help`:

    >> ? help
    ...
    ARGUMENTS:
         'word        [any-type!]

Specify your argument as quoted and belonging to `any-type!` typeset.
Or, alternatively, list the allowed types and include `unset!` in it.

    >> foo: func [a 'b [unset! integer!]][a + do pick [1 b] unset? :b]
    == func [a 'b [unset! integer!]][a + do pick [1 b] unset? :b]
    >> foo 5
    == 6
    >> foo 3 5
    == 8

This, however, comes at a certain price:

-   Optional arguments must come in succession after the mandatory ones.
-   All such function calls within a script now need to be wrapped in
    parentheses, because otherwise there\'s no way for the interpreter
    to guess where your variadic expression ends.
-   You lose the benefits of type-checking, since `any-type!` accepts
    any argument; `'` in front of the argument also enforces
    [specific](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#literal-arguments-and-get-arguments){rel="nofollow noreferrer"}
    semantics, which makes such variadic functions even more cumbersome.
-   Your code becomes unidiomatic: the conventional way to address the
    need for optional arguments is via refinements. Variadic functions
    are usually implemented with a single `block!` argument, which might
    even be dialected.

Such an approach is justified only for user-facing polymorphic
functions, intended to be used from command-line prompt (such as `help`)
or any other kind of interface that provides clear-cut boundaries for
typed expressions (e.g. end of the line, special terminating symbol),
and even then the number of optional arguments is kept at minimum.

*Comment by lyl:* Very detail description on this item! Thank you! And
also very interesting trick \-- `pick [1 b] unset? :b` , I just find
that `index` of `pick` can be `logic!`, but where to find how to use it?

*Comment by 9214:* \@lyl it\'s a form of the ternary operator.
Expression picks 1st or 2nd value depending on its logical value. Same
as in `either`, except that branches are not evaluated.

------------------------------------------------------------------------

## Comments on question
