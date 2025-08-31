# Calling function defined in the different block (Red/Rebol)

**Link:**
<https://stackoverflow.com/questions/48038413/calling-function-defined-in-the-different-block-red-rebol>

**Asked:** 2017-12-30 22:28:09 UTC

------------------------------------------------------------------------

I am trying to figure out how to call a function defined like this:

    outer: [inner: [ f: func [p1 p2] [rejoin ["p1:" p1 "/p2:" p2]] ]]

    print outer/inner/f "aaa" "bbb"

> func

If I add `do` infront of the function call, I get

> \*\*\* Script Error: func is missing its spec argument

Could someone point out what the problem is?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by rebolek

What you wrote is `block!` of data. Data do not turn to code until they
are evaluated. You probably want to turn that `block!` into an
`object!`. Try this:

    >> outer: object [inner: object [ f: func [p1 p2] [rejoin ["p1:" p1 "/p2:" p2]] ]]
    == make object! [
        inner: make object! [
            f: func [p1 p2][rejoin ["p1:" p1 "/p2:" p2]]
        ]
    ]
    >> print outer/inner/f "aaa" "bbb"
    p1:aaa/p2:bbb

------------------------------------------------------------------------

### Answer (score: 3) --- by rgchris

In Rebol blocks are not evaluated by default (e.g. `do [...]` or
`if true [...]`). In your example, `outer/inner/f` is returning the
unevaluated word `'func`. If you wish for a function to be placed in
such a way, you\'ll need to choose a way to create it, such as:

    outer: compose/deep [inner: [f: (func [p1 p2][...])]]

Or:

    outer: [inner: [f: none]]
    outer/inner/f: func [p1 p2][...]

*Comment by Alex Seidlitz:* Thanks for providing an explanation and
alternative implementation, but in my case I think object is a more
natural way to express the intent.

*Comment by rgchris:* \@aseidlitz I suspected so---can never be sure
though with Rebol\... :)

------------------------------------------------------------------------

## Comments on question
