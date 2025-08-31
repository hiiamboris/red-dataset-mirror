# Inverse of \`split\` function: \`join\` a string using a delimeter

**Link:**
<https://stackoverflow.com/questions/46509781/inverse-of-split-function-join-a-string-using-a-delimeter>

**Asked:** 2017-10-01 06:17:51 UTC

------------------------------------------------------------------------

IN Red and Rebol(3), you can use the `split` function to split a string
into a list of items:

    >> items: split {1, 2, 3, 4} {,}
    == ["1" " 2" " 3" " 4"]

What is the corresponding inverse function to `join` a list of items
into a string? It should work similar to the following:

    >> join items {, }
    == "1, 2, 3, 4"

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rebolek

There\'s no inbuild function yet, you have to implement it yourself:

    >> join: function [series delimiter][length: either char? delimiter [1][length? delimiter] out: collect/into [foreach value series [keep rejoin [value delimiter]]] copy {} remove/part skip tail out negate length length out]
    == func [series delimiter /local length out value][length: either char? delimiter [1] [length? delimiter] out: collect/into [foreach value series [keep rejoin [value delimiter]]] copy "" remove/part skip tail out negate length length out]
    >> join [1 2 3] #","
    == "1,2,3"
    >> join [1 2 3] {, }
    == "1, 2, 3"

per request, here is the function split into more lines:

    join: function [
        series 
        delimiter
    ][
        length: either char? delimiter [1][length? delimiter] 
        out: collect/into [
            foreach value series [keep rejoin [value delimiter]]
        ] copy {} 
        remove/part skip tail out negate length length 
        out
    ]

*Comment by rnso:* The function will be easier to be read and understood
if it is placed on multiple lines.

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

There is an old modification of
[rejoin](http://www.rebol.org/ml-display-thread.r?m=rmlVVYS){rel="nofollow noreferrer"}
doing that

    rejoin: func [
        "Reduces and joins a block of values - allows /with refinement." 
        block [block!] "Values to reduce and join" 
        /with join-thing "Value to place in between each element" 
    ][ 
        block: reduce block 
        if with [ 
            while [not tail? block: next block][ 
                insert block join-thing 
                block: next block
           ] 
           block: head block 
        ] 
        append either series? first block [ 
           copy first block
        ] [
           form first block
        ] 
        next block 
    ]

call it like this **rejoin/with \[..\] delimiter**

But I am pretty sure, there are other, even older solutions.

------------------------------------------------------------------------

### Answer (score: 1) --- by rnso

Following function works:

    myjoin: function[blk[block!] delim [string!]][
        outstr: ""
        repeat i ((length? blk) - 1)[
            append outstr blk/1
            append outstr delim
            blk: next blk ]
        append outstr blk ]

    probe myjoin ["A" "B" "C" "D" "E"] ", "

Output:

    "A, B, C, D, E"

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* Ren-C calls this
**delimit**, and it\'s specialized as
`spaced: specialize 'delimit [delimiter: space]` and
`unspaced: specialize 'delimit [delimiter: blank]`. To make them more
useful, the delimiting omits voids and blanks (\"unset!\" and \"none!\"
in R3-Alpha and Red), then is smart about coalescing delimiters\...so
**delimit \[\"a\" if false \[\"b\"\] if false \[\"c\"\] \"d\"\] {, }**
would be \"a, d\".
