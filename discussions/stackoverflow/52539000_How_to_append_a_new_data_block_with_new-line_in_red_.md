# How to append a new data block with new-line in red?

**Link:**
<https://stackoverflow.com/questions/52539000/how-to-append-a-new-data-block-with-new-line-in-red>

**Asked:** 2018-09-27 14:08:36 UTC

------------------------------------------------------------------------

I tried:

    data: [a b c]
    new-line tail data true
    append data [d e f]

I get

    [a b c d e f]

not what I expect:

    [a b c 
    d e f]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by 9214

Newline marker is a property of a value slot, not of a series.
`new-line tail data true` didn\'t set this marker, because `tail` of a
series does not contain any value slot (but `back tail` does).

    >> head new-line tail [a b c] on
    == [a b c]
    >> head new-line back tail [a b c] on
    == [a b 
        c
    ]
    >> append [a b c] new-line [d e f] on
    == [a b c 
        d e f
    ]

------------------------------------------------------------------------

## Comments on question
