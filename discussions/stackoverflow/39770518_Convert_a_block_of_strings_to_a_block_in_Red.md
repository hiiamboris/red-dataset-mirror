# Convert a block of strings to a block in Red

**Link:**
<https://stackoverflow.com/questions/39770518/convert-a-block-of-strings-to-a-block-in-red>

**Asked:** 2016-09-29 12:35:52 UTC

------------------------------------------------------------------------

How to convert a block of strings into a block?

To change this:

    keep rejoin['circle " " coord " " 5 " "]]]

    ["circle 10x10 5 " "circle 20x20 5 " "circle 30x30 5 "]

to this:

    [circle 10x10 5 circle 20x20 5 circle 30x30 5]

I want to change it so it can be used with VID.

    view [
          size 800x600
          base 780x580
          draw drawblock
         ]

Thanks!

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rebolek

To convert `string!` to Red code, you need to LOAD it:
` red>> load "circle 10x10 5 " == [circle 10x10 5] `

So for block of `string!`s, just load them in loop:
` collect [ foreach arg ["circle 10x10 5 " "circle 20x20 5 " "circle 30x30 5 "] [ keep load arg ] ] == [circle 10x10 5 circle 20x20 5 circle 30x30 5] `

However, for code generation, it is better to use Red types directly and
not start with strings.

------------------------------------------------------------------------

### Answer (score: 2) --- by Geeky I

You can also use `load rejoin` to convert
`["set " "of " "spaced " "strings"]` to

    red>> load rejoin ["circle 10x10 5 " "circle 20x20 5 " "circle 30x30 5 "]
    == [circle 10x10 5 circle 20x20 5 circle 30x30 5]

Best thing to do is not have a block of strings in the first place and
try to use literals and code as much as possible.

### Edit:

For your particular use case this would work:

    drawblock: collect [
        foreach arg [10 20 30] [
            keep compose [circle (as-pair arg arg) 5]
        ]
    ]

*p.s.* if you are playing around with view [this
gist](https://gist.github.com/DideC/85d60c99f97f2e4972a6f7b09a1fe630){rel="nofollow"}
could help

------------------------------------------------------------------------

## Comments on question
