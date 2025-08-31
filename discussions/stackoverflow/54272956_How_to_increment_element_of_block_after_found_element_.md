# How to increment element of block after found element?

**Link:**
<https://stackoverflow.com/questions/54272956/how-to-increment-element-of-block-after-found-element>

**Asked:** 2019-01-20 01:59:36 UTC

------------------------------------------------------------------------

Given `player-choices: ["rock" 0 "paper" 0 "scissors" 0]`

How could I increment the value after `"paper"` in this block by
searching for `"paper"`?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by sqlab

    >> player-choices/("paper"): player-choices/("paper") + 1
    == 1

*Comment by Terrence Brannon:* What do the parentheses do in this case?

*Comment by sqlab:* Normally they evaluate what\'s inside, similar to a
do. Here they make it possible.

------------------------------------------------------------------------

### Answer (score: 2) --- by Gregg Irwin

Consider, also, that you may not need to use strings in your data block.

    player-choices: [rock 0 paper 0 scissors 0]
    player-choices/paper: player-choices/paper + 1

You can also write a generic `incr` func, like this:

    incr: function [
        "Increments a value or series index"
        value [scalar! series! any-word! any-path!] "If value is a word, it will refer to the incremented value"
        /by "Change by this amount"
            amount [scalar!]
    ][
        amount: any [amount 1]

        if integer? value [return add value amount]         ;-- This speeds up our most common case by 4.5x
                                                            ;   though we are still 5x slower than just adding 
                                                            ;   1 to an int directly and doing nothing else.

        ; All this just to be smart about incrementing percents.
        ; The question is whether we want to do this, so the default 'incr
        ; call seems arguably nicer. But if we don't do this it is at 
        ; least easy to explain.
        if all [
            integer? amount
            1 = absolute amount
            any [percent? value  percent? attempt [get value]]
        ][amount: to percent! (1% * sign? amount)]          ;-- % * int == float, so we cast.

        case [
            scalar? value [add value amount]
            any [
                any-word? value
                any-path? value                             ;!! Check any-path before series.
            ][
                op: either series? get value [:skip][:add]
                set value op get value amount
                :value                                      ;-- Return the word for chaining calls.
            ]
            series? value [skip value amount]               ;!! Check series after any-path.
        ]
    ]

And then do

    incr 'player-choices/paper

------------------------------------------------------------------------

### Answer (score: 1) --- by endo64

You can also keep a reference to the positions of the values in the
block to change them later:

    player-choices: ["rock" 0 "paper" 0 "scissors" 0]
    rock-pos: find/tail player-choices "rock"
    paper-pos: find/tail player-choices "paper"
    scissors-pos: find/tail player-choices "scissors"

    change paper-pos 1 + paper-pos/1
    player-choices
    ; == ["rock" 0 "paper" 1 "scissors" 0]

------------------------------------------------------------------------

### Answer (score: 0) --- by Time Series Lord

> Given player-choices: \[\"rock\" 0 \"paper\" 0 \"scissors\" 0\] How
> could I increment the value after \"paper\" in this block by searching
> for \"paper\"?

    poke player-choices index? next find player-choices "paper" 1 + select player-choices "paper"

Broken down:

    >> ? poke
    USAGE:
         POKE series index value

    DESCRIPTION: 
         Replaces the series value at a given index, and returns the new value. 

1.  The series player-choices.
2.  The index is position in player-choices of the value after \"paper\"
3.  The value is whatever the current value is after paper added to 1

Find will return either the series where a value is found, or NONE.

    >> find player-choices "paper"
    == ["paper" 0 "scissors" 0]    

But you want the index of next value hence:

    >> index? next find player-choices "paper"
    == 4

Select will return the next value of a series if it finds the value,
which precedes it. Otherwise it will return none.

    >> select pc "paper"
    == 0

But we want to increase it by one, thus

    >> 1 + select pc "paper"
    == 1

------------------------------------------------------------------------

## Comments on question
