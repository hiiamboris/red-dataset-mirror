# How to write strict-greater? (-lesser?, -greater-or-equal?, -lesser-or-equal?)

**Link:**
<https://stackoverflow.com/questions/29348666/how-to-write-strict-greater-lesser-greater-or-equal-lesser-or-equal>

**Asked:** 2015-03-30 14:19:51 UTC

------------------------------------------------------------------------

Rebol and Red have a notion of the ordinary `equal?` function (offered
infix simply as `=`) as being a sort of \"natural equality\". Hence it
is willing to compare `1 = 1.0` even though one is an integer and the
other a float\... and to compare strings and characters
case-insensitively by default.

The `strict-equal?` function is case-sensitive, demands things be the
same datatype, and is tied to `==` as infix. (There is also a
`strict-not-equal?` function as `!==`.)

However, the other comparison operators don\'t seem to have a strict
variant. How would one implement a `strict-greater?` or a
`strict-lesser-or-equal?`, etc. with the primitives in the box?

Behavior would be, for instance:

    >> strict-lesser? "A" "a"
    == true

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Rudolf W. Meijer

As [endo64](https://stackoverflow.com/users/333153/endo64) points out,
strings are the stumbling block but since their components, characters,
have the desired strict inequalities, the solution would seem to be to
compare strings character by character (\"lexicographically\", if you
wish). This goes for Rebol2, Rebol3 and Red alike.

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* In Rebol2 both lesser? \"a\" \"A\" and lesser?
\"A\" \"a\" returns false. lesser? #\"A\" #\"a\" == true for char!
values.
