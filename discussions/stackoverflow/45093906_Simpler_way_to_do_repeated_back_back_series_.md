# Simpler way to do repeated \`back back series\`

**Link:**
<https://stackoverflow.com/questions/45093906/simpler-way-to-do-repeated-back-back-series>

**Asked:** 2017-07-14 03:05:04 UTC

------------------------------------------------------------------------

Sometimes, I tend to do `next next a` (repeatedly) to get at a
particular element. This works well when you need 2 or less traversals.
However, it gets cumbersome pretty soon. A loop is too much overhead for
this simple case.

Fortunately you can do `at series pos` in some cases if you know the
position.

When it comes to removing the redundancy for the reverse function, a.k.a
`back`, this doesn\'t work as well tho.

Preferably, I want to do something like `at`, but relative to the
current position in the series

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by Graham Chiu

`skip` allows you to move forwards or backwards from the current
position in the series.

    >> series: [ 1 2 3 4 5 6]
    == [1 2 3 4 5 6]

    >> series: skip series 2
    == [3 4 5 6]

    >> series: skip series 3
    == [6]

    >> series: skip series -3
    == [3 4 5 6]

------------------------------------------------------------------------

## Comments on question
