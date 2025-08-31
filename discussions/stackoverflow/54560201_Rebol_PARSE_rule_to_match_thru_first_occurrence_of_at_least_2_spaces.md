# Rebol PARSE rule to match thru first occurrence of at least 2 spaces

**Link:**
<https://stackoverflow.com/questions/54560201/rebol-parse-rule-to-match-thru-first-occurrence-of-at-least-2-spaces>

**Asked:** 2019-02-06 18:24:30 UTC

------------------------------------------------------------------------

`rule: [while [not ["--"] skip] some "-"] parse "a-bc----d" [rule ??]`

prints

`??: "d"`

But I need a more efficient rule (e.g. using `to #"-"`)\...

EDIT:

`t: copy "" append/dup t "." 10000 append t "-..---..--" rule: [while [not ["--"] skip] some "-"] print [delta-time [loop 1000 [parse t [rule] ]]]`

=\> \~ 15.4 sec on my phone

`rule: [any ["--" break | skip] any "-"]`

=\> \~ 8.2 sec

`rule: [to "--" some "-"]` (@sqlab response)

=\> \~ 0.3 sec

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

What prevents you to use *to* as e.g.

    rule: [to "--" some "-"  x:]     

*Comment by giuliolunati:* Sqlab, if you have some time, please check
[that similar
case](https://stackoverflow.com/questions/54577826/rebol-parse-rule-to-match-to-first-occurrence-of-at-least-2-blanks)

------------------------------------------------------------------------

## Comments on question
