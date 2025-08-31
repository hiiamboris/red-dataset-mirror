# How can I construct a block! containing parens?

**Link:**
<https://stackoverflow.com/questions/43767108/how-can-i-construct-a-block-containing-parens>

**Asked:** 2017-05-03 18:04:37 UTC

------------------------------------------------------------------------

I have a block of words like `[x y]` and I want to make a block of
`[x: (x) y: (y)]`

This doesn\'t quite work:

    >> b: [x y]
    == [x y]
    >> collect [foreach w b [keep to-set-word w keep to-paren w]]
    == [x: x y: y]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

`keep` relies on a `append` action when collecting the argument value,
so a `paren!` argument will see each contained values appended, instead
of the whole paren series (same as for any other `any-block!` type). In
order to append the paren series as a single value, use `keep/only`
(which will then use `append/only` internally).

    >> b: [x y]
    == [x y]
    >> collect [foreach w b [keep to-set-word w keep/only to-paren w]]
    == [x: (x) y: (y)]

------------------------------------------------------------------------

## Comments on question
