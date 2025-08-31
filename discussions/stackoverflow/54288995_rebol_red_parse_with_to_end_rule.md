# rebol / red parse with \[to end\] rule

**Link:**
<https://stackoverflow.com/questions/54288995/rebol-red-parse-with-to-end-rule>

**Asked:** 2019-01-21 11:26:58 UTC

------------------------------------------------------------------------

I\'m trying to understand parse from the ground up so don\'t tell me to
use split in this case.

    sentence: "This is a sentence"

    parse sentence [
        any [
            [any space] copy text [to space | to end] skip
            (print text)
        ]
     ]

Why do I not get the last word in the sentence, and only:

    This
    is
    a

Did the `[to end]` not work?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by rebolek

`to end` did work, but then you have `skip` there and you\'re already at
the end, so `skip` fails. See this:

    >> parse sentence [any [[any space] copy text [to space | to end ] (print text) skip]]
    This
    is
    a
    sentence

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

An alternative solution without to and end

    sentence: "This is a sentence"
    space:  charset " "
    chars: complement space

    parse sentence [
        any [
           any space 
           copy text some chars
           (print text) 
        ]
    ]

In Rebol2 you have to use parse/all, if you deal with strings, but the
most simple solution in Rebol2 for splitting is

    >> parse sentence none
    == ["This" "is" "a" "sentence"]

------------------------------------------------------------------------

## Comments on question
