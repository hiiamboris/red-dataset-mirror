# What&#39;s the equivalent of Python&#39;s list\[3:7\] in REBOL or Red?

**Link:**
<https://stackoverflow.com/questions/46824700/whats-the-equivalent-of-pythons-list37-in-rebol-or-red>

**Asked:** 2017-10-19 07:29:39 UTC

------------------------------------------------------------------------

With Rebol pick I can only get one element:

    list: [1 2 3 4 5 6 7 8 9]

    pick list 3

In python one can get a whole sub-list with

    list[3:7]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by HostileFork says dont trust SE

-   [**AT**](http://www.rebol.com/docs/words/wat.html){rel="noreferrer"}
    can seek a position at a list.
-   [**COPY**](http://www.rebol.com/r3/docs/functions/copy.html){rel="noreferrer"}
    will copy from a position to the end of list, by default
-   the **/PART** refinement of COPY lets you add a limit to copying

Passing an integer to /PART assumes how many things you want to copy:

    >> list: [1 2 3 4 5 6 7 8 9]

    >> copy/part (at list 3) 5
    == [3 4 5 6 7]

If you provide a series *position* to be the end, then it will copy *up
to* that point, so you\'d have to be past it if your range means to be
inclusive.

    >> copy/part (at list 3) (next at list 7)
    == [3 4 5 6 7]

There have been some proposals for range dialects, I can\'t find any
offhand. Simple code to give an idea:

    range: func [list [series!] spec [block!] /local start end] [
        if not parse spec [
            set start integer! '.. set end integer!
        ][
            do make error! "Bad range spec, expected e.g. [3 .. 7]"
        ]
        copy/part (at list start) (next at list end) 
    ]

    >> list: [1 2 3 4 5 6 7 8 9]

    >> range list [3 .. 7]
    == [3 4 5 6 7]

*Comment by user310291:* Wow what an answer ;)

*Comment by sqlab:* There is no need for the parentheses in **at list
n**

------------------------------------------------------------------------

### Answer (score: 3) --- by Graham Chiu

    >> list: [1 2 3 4 5 6 7 8 9]
    == [1 2 3 4 5 6 7 8 9]
    >> copy/part skip list 2 5
    == [3 4 5 6 7]

So, you can skip to the right location in the list, and then copy as
many consecutive members as you need.

If you want an equivalent function, you can write your own.

------------------------------------------------------------------------

## Comments on question
