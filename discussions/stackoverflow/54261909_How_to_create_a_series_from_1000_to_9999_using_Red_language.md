# How to create a series from 1000 to 9999 using Red language

**Link:**
<https://stackoverflow.com/questions/54261909/how-to-create-a-series-from-1000-to-9999-using-red-language>

**Asked:** 2019-01-18 21:52:21 UTC

------------------------------------------------------------------------

Using [Red
language](https://www.red-lang.org/){rel="nofollow noreferrer"}, I want
to choose a random number from 1000 to 9999. Having looked at the docs
for
[random](http://www.red-by-example.org/#random){rel="nofollow noreferrer"}
I would like for `random` to choose a number from a series ranging from
1000 to 9999.

I know that I can do `999 + (random 9000)` but that does not read well
in my opinion.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by 9214

There is a well-established method for computing a random number between
two inclusive boundaries:

    (random(0,1)  * (max - min + 1)) + min

Porting it to Red should be straightforward, and wrapping it into a
dedicated function would alleviate the \"readability\" concern. For
instance:

    >> between: func [lower upper][-1 + lower + random upper - lower + 1]
    == func [lower upper][-1 + lower + random upper - lower + 1]
    >> round average collect [loop 1'000'000 [keep between -10 10]]
    == 0.0

`-1` above compensates for the fact that `random` range starts from `1`,
not `0`.

A poka-yoke `between` would ensure that lower bound is indeed *lower*
than upper bound, by picking min/max values out of two given boundaries.
I leave this as an excercise for the reader.

Another approach, where you literally pick a random number out of a
series, would be:

    >> thru: make op! func [lower upper][collect [until [keep lower greater? lower: lower + 1 upper]]]
    == make op! [[lower upper]]
    >> -10 thru 10
    == [-10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10]
    >> random/only -10 thru 10
    == 5

------------------------------------------------------------------------

### Answer (score: 3) --- by giuliolunati

You could define your own function, e.g.

`random2: function [a b] [a - 1 + random b - a + 1]`

then `random2 1000 9999`

------------------------------------------------------------------------

## Comments on question
