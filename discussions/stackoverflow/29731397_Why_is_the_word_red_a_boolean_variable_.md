# Why is the word red a boolean variable?

**Link:**
<https://stackoverflow.com/questions/29731397/why-is-the-word-red-a-boolean-variable>

**Asked:** 2015-04-19 14:46:40 UTC

------------------------------------------------------------------------

    red>> red
    == true
    red>> type? red
    == logic!

Just curious to know why is `red` a boolean variable?

(perhaps unrelated) Side note: `rebol` in REBOL 2.7 console is of type
`object!`.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by Geeky I

This is no longer the case:

    red>> red
    == 255.0.0

    red>> Red
    == 255.0.0

------------------------------------------------------------------------

### Answer (score: 3) --- by johnk

It is defined in the `"Red base environment definitions"` file as

`Red: true ;-- ultimate Truth ;-) (pre-defines Red word)`

[https://github.com/red/red/blob/9c355efa76ac1b5c17a8cbf359c5d7ab05a6a013/environment/scalars.red#L13](https://github.com/red/red/blob/9c355efa76ac1b5c17a8cbf359c5d7ab05a6a013/environment/scalars.red#L13){rel="nofollow"}

This file contains other initial environment definitions such as:

    escape:      #"^["
    slash:       #"/"
    sp: space:   #" "
    ...

As \@kealist points out in the comment below, it serves a useful
purpose:

It stops the `Red []` header in scripts from causing an error.

In Rebol, the `rebol` word is bound to the `system` object so I expect
the Red will follow a similar approach.

*Comment by kealist:* It\'s there so not every script has an error
(undefined word: Red) from the header

------------------------------------------------------------------------

## Comments on question
