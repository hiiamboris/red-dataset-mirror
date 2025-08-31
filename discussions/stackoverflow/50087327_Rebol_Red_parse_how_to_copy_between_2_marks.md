# Rebol/Red parse: how to copy between 2 marks

**Link:**
<https://stackoverflow.com/questions/50087327/rebol-red-parse-how-to-copy-between-2-marks>

**Asked:** 2018-04-29 13:52:33 UTC

------------------------------------------------------------------------

I want to be able to parse between 2 marks in parse rule. For a
contrieved example:

    src: {a b c d e f}

    rule: [
        to "b" mark1: thru "e" mark2: 
        to mark1 copy text to mark2
    ]

This doesn\'t work, text contains \"\[\" instead of what I\'d like to
get:

    b c d e

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by HostileFork says dont trust SE

You\'re trying to implement a \"DO desire\" of copying using PARSE.
PARSE\'s COPY is looking for patterns, not treating the series as
positions.

You can escape into DO in mid-parse via a PAREN!, it will run if the
parse rule reaches that point.

    src: {a b c d e f}

    rule: [
        to "b" mark1: thru "e" mark2: 
        (text: copy/part mark1 mark2)
        to end ;-- not strictly necessary, but makes PARSE return true
    ]

    parse src rule

That will give you text as `b c d e`

Note that you can\'t have it both ways, either with COPY or with TO.
`TO <series!>` meant \"look for b\", not \"jump to the position of b\".
So when you say `to mark1` you\'re invoking another match. If you want
to set the parse position to *the specific position* recorded in mark1,
use `:mark1` in the parse rule.

*Comment by user310291:* as I said it\'s a contrieved example. so I
updated the example where I have markers: at first div and closing div
with nested div inside.

*Comment by HostileFork says dont trust SE:* \@user310291 If you would
like to ask a new question, it\'s usually better to just do that\...and
be sure to be as clear as possible when you do.

*Comment by user310291:* ok see
[stackoverflow.com/questions/50088909/...](https://stackoverflow.com/questions/50088909/rebo-red-parse-is-it-possible-to-copy-between-two-marks-embedding-nested-div "rebo red parse is it possible to copy between two marks embedding nested div")

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

two alternative solutions/rules working in Red

    rule: [
       to "b" copy text thru "e" to end
    ]

and

     rule: [ to "b" collect  [keep thru "e"] to end]
     text: first parse src rule

------------------------------------------------------------------------

## Comments on question
