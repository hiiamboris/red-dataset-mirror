# Access word value inside object

**Link:**
<https://stackoverflow.com/questions/31295997/access-word-value-inside-object>

**Asked:** 2015-07-08 14:41:33 UTC

------------------------------------------------------------------------

In the interpreter:

    >>  qurl: "1234"
    == "1234"

    >> R: make object! [probe qurl qq: qurl probe qq]
    "1234"
    "1234"
    == make object! [
        qq: "1234"
    ]

This behaves like I\'d expect. All \"variables\" or \"words\" are global
by default.

Using a script:

    REBOL []

    qurl: "1234"

    Q: make object! [
        probe join "[Q before qq] qurl: " qurl
        qq: qurl
        probe join "[Q] qq: " qq
        qurl: qurl
        probe join "[Q after qurl] qurl: " qurl
    ]
    probe join "[main before Q] qurl: " qurl
    Q
    probe join "[main after Q] qurl: " qurl

returns:

    "[Q before qq] qurl: none"
    "[Q] qq: none"
    "[Q after qurl] qurl: none"
    "[main before Q] qurl: 1234"
    "[main after Q] qurl: 1234"

I\'d expect that all `probe` inside the `Q` `object!` would return
`"1234"`, but none does it.

Why is that?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by rgchris

When Rebol creates an object, it collects the (set-)words from the spec
first and uses them to create the new object. The words of the new
object are initially assigned to `none`. The spec is then bound to the
new object and evaluated.

In your first example, you haven\'t included `qurl:` in your spec, thus
is not part of your object. Instead you get the \'global\' `qurl`. In
your second example, `qurl` *is* part of your object and is initiated
with `none`.

Your options to access the value associated with the \'global\' `qurl`
in your second example are:

1\. Compose the block so that when the block is evaluated, it accesses
the value directly:

    Q: make object! compose [
        qq: (qurl)
        qurl: (qurl)
    ]

2\. Access the word from a \'global\' context:

    Q: make object! [
        qq: system/words/qurl ; Rebol 2
        qq: system/contexts/user/qurl ; Rebol 3
    ]

*Comment by Luis:* In the example 1., the parenthesis are a kind of
evaluation?

*Comment by rgchris:* \@luis Yes---`compose` is an indispensable
function that allows you to preprocess a block in a controlled way.
It\'s similar to `reduce` except that only paren! values within a block
are reduced.

------------------------------------------------------------------------

## Comments on question
