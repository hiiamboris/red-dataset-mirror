# Equivalent of for loop in Red?

**Link:**
<https://stackoverflow.com/questions/47813360/equivalent-of-for-loop-in-red>

**Asked:** 2017-12-14 12:26:17 UTC

------------------------------------------------------------------------

I want to use for
[http://www.rebol.com/docs/words/wfor.html](http://www.rebol.com/docs/words/wfor.html){rel="nofollow noreferrer"}
for Red it doesn\'t work.

What\'s the equivalent ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

As **for** in Rebol2 is just a mezzanine, you can write your own for

    for: func [
        "Repeats a block over a range of values." 
        [catch throw] 
        'word [word!] "Variable to hold current value" 
        start [number! series! time! date! char!] "Starting value" 
        end [number! series!  time! date! char!] "Ending value" 
        bump [number!  time! char!] "Amount to skip each time" 
        body [block!] "Block to evaluate" 
        /local result do-body op
    ][
        if (type? start) <> (type? end) [
            throw make error! reduce ['script 'expect-arg 'for 'end type? start]
        ] 
        do-body: func reduce [[throw] word] body 
        op: :greater-or-equal? 
        either series? start [
            if not same? head start head end [
                throw make error! reduce ['script 'invalid-arg end]
            ] 
            if (negative? bump) [op: :lesser?] 
            while [op index? end index? start] [
                set/any 'result do-body start 
                start: skip start bump
            ] 
            if (negative? bump) [set/any 'result do-body start]
        ] [
            if (negative? bump) [op: :lesser-or-equal?] 
            while [op end start] [
                set/any 'result do-body start 
                start: start + bump
            ]
        ] 
        get/any 'result
    ]

but you can find also a few mightier or more c-syntax-like versions on
the net e.g. a [proposal for
Rebol3](https://stackoverflow.com/questions/23706547/c-style-for-loops-in-rebol)

    cfor: func [  ; Not this name
        "General loop based on an initial state, test, and per-loop change."
        init [block! object!] "Words & initial values as object spec (local)"
        test [block!] "Continue if condition is true"
        bump [block!] "Move to the next step in the loop"
        body [block!] "Block to evaluate each time"
        /local ret
    ] [
        if block? init [init: make object! init]
        test: bind/copy test init
        body: bind/copy body init
        bump: bind/copy bump init
        while test [set/any 'ret do body do bump get/any 'ret]
    ]

Red also offers the possibility to define your own macro and compile it.

------------------------------------------------------------------------

## Comments on question
