# red parsing and replacing double % with &lt;&gt; doesn&#39;t work

**Link:**
<https://stackoverflow.com/questions/47036192/red-parsing-and-replacing-double-with-doesnt-work>

**Asked:** 2017-10-31 13:04:33 UTC

------------------------------------------------------------------------

I want to transform

     test: "bla bla %bla bla% bla bla bla bla %bla% bla"

into

     test: "bla bla <bla bla> bla bla bla bla <bla> bla"

with this code, it doesn\'t work in red:

     rules: [
        (toggle: -1)
        to "%" mark: (
            (toggle: 0 - toggle)
            either (toggle = 1) [change mark {<}][change mark {>}]
        )
        thru "%"
        |
        to end
    ]

    parse test rules

Output is

    >> test
    == "bla bla <bla bla% bla bla bla bla %bla% bla"

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by HostileFork says dont trust SE

You don\'t have any iterative construct in your parse rule (SOME, ANY,
WHILE, etc.) So it shouldn\'t be surprising it does one replacement and
stops.

This will give you the desired output, and has a couple other changes
for consideration (though just including the `any [... | skip]`
modification would have fixed your code):

    rules: [
        (toggle: true)
        any [
            to "%" mark: thru "%" (
                change mark pick [{>} {<}] (toggle: not toggle)
            )
        |
            skip
        ]
    ]

    parse test rules

*(I\'m not the biggest fan of using PICK with a LOGIC!\...it gives you
the first element if true and the second if false, but throwing it in
here for fun.)*

------------------------------------------------------------------------

### Answer (score: 4) --- by Edoc

Your rules need a little more care, especially when using the keywords
`'to` and `'thru`. The way your rule is written the replacement will
occur once and then `to end` will advance you to the end of the input
\-- not what you want.

I\'ll step through it slowly.

The first rule, the `to "%"`, this advances the input to the first \"%\"
character. It\'s a successful rule so your parens expression executes
and modifies the input, i.e., changes the \"%\" to a \"\<\". All good
there: the first replacement is complete and the very next char in the
input is now \"\<\". *BUT* your next rule is `thru "%"`. This advances
the input *past* the next \"%\" character in the input\-- a char you
want changed to \"\>\".

The other key piece here (as HostileFork points out) is that your
replacement rule is not repeating. Your parse rule runs once and then
it\'s over. Your alternative rule `to end` then takes over and jumps the
input all way to the end. In order to get a rule to scan repeatedly
through the entire input you need to set up your rule with a `some`,
`any`, `while` or `skip`.

Here\'s a quick rework of your rule leaving most of your code in place
but achieving the result I think you want.

    test: "bla bla %bla bla% bla bla bla bla %bla% bla"
    toggle: -1
    rules: [any [
        to "%" mark: (
            toggle: negate toggle 
            either toggle = 1 [change mark "<"][change mark ">"]
        ) 
        ]
    ]
    parse test rules
    test
     == "bla bla <bla bla> bla bla bla bla <bla> bla"

There are other things in the code that I would probably change, such as
the toggle, and you can see I got rid of unecessary parentheses, but for
now I\'m forcusing on the way `parse` works.

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

Two solutions: one without parse

    test: "bla bla %bla bla% bla bla bla bla %bla% bla"
    replace test "%" "<"
    replace test "%" ">"
    replace test "%" "<"
    replace test "%" ">"

and one with parse

    test: "bla bla %bla bla% bla bla bla bla %bla% bla"
    parse test [some [to "%" change skip "<"  to "%" change skip ">"] to end]

and one for fun

    parse test [(tog: next [">" "<"]) some [to "%" change skip tog  (reverse head tog)] to end]

------------------------------------------------------------------------

## Comments on question
