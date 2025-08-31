# Parse looping forever when replacing %% by &lt;!\-- \--&gt;

**Link:**
<https://stackoverflow.com/questions/47050465/parse-looping-forever-when-replacing-by>

**Asked:** 2017-11-01 07:56:56 UTC

------------------------------------------------------------------------

I want to transform

     test: "bla bla %bla bla% bla bla bla bla %bla% bla"

into

     test: "bla bla <!--bla bla--> bla bla bla bla <!--bla--> bla"

which I thought would be easy as it was a slight variation of [red
parsing and replacing double % with \<\> doesn\'t
work](https://stackoverflow.com/questions/47036192/red-parsing-and-replacing-double-with-doesnt-work)

but my code loops forever though I have \"to end\" rule:

    test: "bla bla %bla bla% bla bla bla bla %bla% bla"


    toggle: -1
    rules: [ 
        any [
            to "%" mark: (
                toggle: negate toggle 
                either toggle = 1 [change mark {} insert mark {<!--}][change mark {} 
                insert mark {-->}]
        ) 
        ]
        |
        to end
    ] 

    parse test rules
    test

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by rebolek

I would not use `to` (or `thru`), they are bit dangerous IMO. I would
use something like:

    toggle: false 
    parse test [
        some [
            change #"%" (either toggle: not toggle ["<!--"]["-->"]) 
        |   skip
        ]
    ]

Also, you can get rid of the `toggle`, if you want to:

    parse test [
        some [
            change #"%" (first reverse ["-->" "<!--"]) 
        |   skip
        ]
    ]

*Comment by user310291:* Really smart solution :) Will use when I\'ll be
more advanced, for now my purpose is learning the basics.

*Comment by rebolek:* Ok :) But I think that you should adopt at least
`logic!` toggle instead of `integer!` one. You can split it into two
lines - `toggle: not toggle either toggle...` - like in your original
code. `logic!` is more appropriate here, `toggle = 1` gets reduced into
`logic!` anyway, so why not to use it directly.

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

The problem comes from you trying to exchange \"%\" with an empty
string. \"%\" stays there and gets always a hit. Your rule works with
these modifications

    rules: [ 
        any [
            to "%" mark: (
                toggle: negate toggle 
                either toggle = 1 [
                    change/part mark  {<!--} 1 
                ][
                    change/part   mark {-->} 1
                ]
            ) 
        ] 
        to end
    ] 

------------------------------------------------------------------------

### Answer (score: 2) --- by endo64

Without using `parse`, though there is no advantage, just another way:

    until [none? attempt [insert remove find test "%" first reverse ["-->" "<!--"]]]

------------------------------------------------------------------------

## Comments on question
