# Initialization in Rebol/Red language

**Link:**
<https://stackoverflow.com/questions/46509262/initialization-in-rebol-red-language>

**Asked:** 2017-10-01 04:37:19 UTC

------------------------------------------------------------------------

In example given on
[http://business-programming.com/business_programming.html#section-2.6](http://business-programming.com/business_programming.html#section-2.6){rel="nofollow noreferrer"}
:

    REBOL []
    items: copy []               ; WHY NOT JUST "items: []"
    prices: copy []              ; WHY NOT JUST "prices: []"
    append items "Screwdriver"
    append prices "1.99"
    append items "Hammer"
    append prices "4.99"
    append items "Wrench"
    append prices "5.99"

Why should one do `items: copy []` and not `items: []` ? Also should
this be done for all variable initializations or are there some
selective types for which this is needed?

Edit: I find that following code works all right:

    REBOL []
    items: []   
    prices: []  
    append items "Screwdriver"
    append prices "1.99"
    append items "Hammer"
    append prices "4.99"
    append items "Wrench"
    append prices "5.99"

    probe items
    probe prices

    items: []   
    prices: []  
    append items "Screwdriver"
    append prices "1.99"
    append items "Hammer"
    append prices "4.99"
    append items "Wrench"
    append prices "5.99"

    probe items
    probe prices

Output is ok:

    ["Screwdriver" "Hammer" "Wrench"]
    ["1.99" "4.99" "5.99"]
    ["Screwdriver" "Hammer" "Wrench"]
    ["1.99" "4.99" "5.99"]

But not following:

    REBOL []

    myfn: func [][
        items: []   
        prices: []  
        append items "Screwdriver"
        append prices "1.99"
        append items "Hammer"
        append prices "4.99"
        append items "Wrench"
        append prices "5.99" ]

    do myfn
    probe items
    probe prices

    do myfn
    probe items
    probe prices

Output is duplicated here:

    ["Screwdriver" "Hammer" "Wrench"]
    ["1.99" "4.99" "5.99"]
    ["Screwdriver" "Hammer" "Wrench" "Screwdriver" "Hammer" "Wrench"]
    ["1.99" "4.99" "5.99" "1.99" "4.99" "5.99"]

Is the problem only when initialization is in a function?

Apparently, all variables in a function are taken as global variables by
default and created only once at start. It seems that the language is
converting my function to:

    items: []   
    prices: []  
    myfn: func [][
        append items "Screwdriver"
        append prices "1.99"
        append items "Hammer"
        append prices "4.99"
        append items "Wrench"
        append prices "5.99" ]

Now the response of multiple calls to myfn is understandable. Global
functions created in a loop are also created only once.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Graham Chiu

The `copy []` is not needed in this script because when it\'s run again,
all prior references to the series `items` and `prices` will be created
anew.

But if there\'s a possibility that the `items: []` is going to run more
than once inside the same script, then you need to copy to make sure you
create a new series each time, and not just reference the existing
series.

*Comment by rnso:* So, `items: []` should not be part of a function in
which `items` may be getting modified, else it will affect next calls to
that function. Am I right?

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* It might help if you read
through the answer to [\"Why do functions have memory in
Rebol?\"](https://stackoverflow.com/q/25935648/211160) But as that
answer notes, the new semantics in Ren-C will not allow you to do the
append without the copy, because `[]` is an array in source and it will
be locked.

*Comment by rnso:* It becomes quite clear on reading the link. Can
someone explain this in terms of \'mutable\' and \'immuatable\' or is
that not relevant here?

*Comment by rnso:* Pl see my edit in question above also.

*Comment by HostileFork says dont trust SE:* It is not from being in a
function, it\'s from running the same line of code more than once. You
get accumulative behavior with a loop as well, e.g. **loop 2 \[data:
\[\] append data \'something\]**. While some would read that and think
each iteration of the loop would get a new empty block via the
assignment **data: \[\]**, there is only one instance of *that*
particular block. So the second time through the loop it will be **data:
\[something\]** in R3-Alpha and Red. As I\'ve said before, my own
opinion (implemented in Ren-C) is that source series should be locked
from modification to avoid errors.

*Comment by rnso:* Very well explained.

*Comment by HostileFork says dont trust SE:* *\"Global functions created
in a loop are also created only once.\"* -\> actually, if you say **loop
2 \[foo: func \[x\] \[print x\] foo \"hello\"\]** the FUNC function will
run each time through the loop, making a unique distinct (but
identically-behaving) function. However, if you said **loop 2 compose
\[foo: (func \[x\] \[print x\]) foo \"hello\"\]** it would do the
composition to create the function just one time. This function would
have a unique pointer/reference, and then the loop would assign that
same unique reference. It\'s a strange way to write software, if you
haven\'t noticed yet. :-)

*Comment by rnso:* Is there any option by which all variables in a
function/loop are local by default and global only if so declared?
