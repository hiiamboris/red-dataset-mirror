# Creating map function in Red language

**Link:**
<https://stackoverflow.com/questions/46753092/creating-map-function-in-red-language>

**Asked:** 2017-10-15 08:17:41 UTC

------------------------------------------------------------------------

How can I create
[map](https://en.wikipedia.org/wiki/Map_(higher-order_function)){rel="nofollow noreferrer"},
a higher order function, in Red language. It should take a block and a
function as arguments and apply the sent function to each member of
block. I tried following code:

    Red []
    mapfn: function[blk sfn][
        outblk: copy []
        foreach i blk[
            append outblk (sfn i) ]
        outblk ]

    ; to test: 
    myblk: [" this " " is   " " a "  "    line " "for" "   testing " " only   "]
    probe mapfn myblk 'reverse 
    probe mapfn myblk 'trim

But it is not working - it simply sends back the original block without
changing it or giving any error message. How can this be corrected?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

In Rebol you have the mezzanine function **apply**

    >> help apply
    USAGE:
        APPLY func block /only 

    DESCRIPTION:
         Apply a function to a reduced block of arguments.
         APPLY is a function value.

    ARGUMENTS:
         func -- Function value to apply (Type: any-function)
         block -- Block of args, reduced first (unless /only) (Type: block)

    REFINEMENTS:
         /only -- Use arg values as-is, do not reduce the block

    (SPECIAL ATTRIBUTES)
         throw

See **source apply**.

As long as Red has no native apply you can write your own mapping
function e.g

    mapfn: function[blk sfn][
        outblk: copy []
        foreach i blk[
            append outblk sfn copy i 
        ]
        outblk 
    ]

Get the function with :functionname

    >> myblk: [" this " " is   " " a "  "    line " "for" "   testing " " only   "]
    == [" this " " is   " " a " "    line " "for" "   testing " " only   "]
    >> probe mapfn myblk :reverse 
    [" siht " "   si " " a " " enil    " "rof" " gnitset   " "   ylno "]
    == [" siht " "   si " " a " " enil    " "rof" " gnitset   " "   ylno "]
    >> probe mapfn myblk :trim
    ["this" "is" "a" "line" "for" "testing" "only"]
    == ["this" "is" "a" "line" "for" "testing" "only"]
    >> 

An alternative and better way as you can not copy all datatypes is e.g.

    mapfn: function[blk sfn][
        collect [
            foreach i blk[
                keep sfn i 
            ]
        ]
    ]

and call the function this way if no do not want to modify the original

    mapfn newblk: copy/deep myblk :reverse

*Comment by sqlab:* I changed the answer. **reverse** and **trim** work
on the original series and change it. So you have to use a copy of the
series you work on.

------------------------------------------------------------------------

## Comments on question
