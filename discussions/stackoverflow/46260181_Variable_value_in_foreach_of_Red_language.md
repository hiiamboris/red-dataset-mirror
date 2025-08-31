# Variable value in foreach of Red language

**Link:**
<https://stackoverflow.com/questions/46260181/variable-value-in-foreach-of-red-language>

**Asked:** 2017-09-17 02:47:54 UTC

------------------------------------------------------------------------

I am using following code to add multiple GUI elements to a view via a
foreach loop:

    myRange: function [n][  ; to produce a vector of [1 2 3 4... n]
      vv: make vector! n 
      i: 1
      foreach j vv [
        vv/:i: i
        i: i + 1
        if i > n [break]]
      vv ]

    view collect[ 
        foreach i myRange 10 [  
            print append "i in loop: " i
            keep [ t: text ]  keep append "message number: " i
            keep [field "entry"     button "Click" [t/text: "clicked"] return]
                ] ]

All GUI elements are being produced. But the code
`append "message number: " i` is showing value of i to be `12345678910`
in all text elements and not 1, 2, 3\... 10 for different text elements.

Also, `print append...` statement is producing following output:

    i in loop: 1
    i in loop: 12
    i in loop: 123
    i in loop: 1234
    i in loop: 12345
    i in loop: 123456
    i in loop: 1234567
    i in loop: 12345678
    i in loop: 123456789
    i in loop: 12345678910

Moreover, clicking any button changes text of only the last added text
element.

Where is the problem and how can it be solved? Thanks for your help.

------------------------------------------------------------------------

Edit: It seems the language is converting my code from:

    for i 1 10 1 [  
       print append "i in loop: " i  ]

to:

    a_variable: "i in loop"
    for i 1 10 1 [  
       print append a_variable i  ]

Which is not what I and (I think) most users want. In most languages a
string \"i in loop\" will be taken as a constant and not converted to a
variable since user has not specified it so. IMHO it will be easier for
users of other languages to come here if such basic conventions are not
altered.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by Graham Chiu

Whenever you see something like this, it means you failed to create a
new series and are reusing an existing series.

To get around that you need to create a new series with `copy`

Eg.

    print append copy "i in loop: " i

Rebol3/ren-c no longer has this problem because source code is immutable
and so you will get an error message with such code.

*Comment by rnso:* What about any button clicking changing only last
text label?

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

Rebol and Red reuses series (e.g. strings, blocks) as much as possible
if you do not tell them otherwise by initializing anew with `copy`,
`make` etc. So your issue should go away if you write

    append copy "message number: " i

------------------------------------------------------------------------

### Answer (score: 2) --- by rgchris

As the other answers suggest, you are only using a single string for
your message and would need to be copied.

As to the other concern---you should take a wee look at the code you\'re
generating (as I suggested elsewhere, you can pop a little `PROBE` to
examine the output of the `COLLECT` function):

    [
        t: text "message number: 1" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 2" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 3" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 4" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 5" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 6" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 7" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 8" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 9" field "entry" button "Click" [t/text: "clicked"] return 
        t: text "message number: 10" field "entry" button "Click" [t/text: "clicked"] return
    ]

As you can see, you\'re constantly reassigning `t` so that in the end,
it only refers to the last face.

A few options exist here---most prominent is to generate the name
you\'re assigning the `text` face to. Within your `FOREACH` loop:

    keep compose/deep [
        (to set-word! rejoin ["t-" i])
        text (rejoin ["Message Number: " i])
        field "entry"
        button "Click" [
            set in (to word! rejoin ["t-" i]) 'text "clicked"
        ]
        return
    ]

Note that in order to simplify the block creation, I used this line:

    set in (to word! rejoin ["t-" i]) 'text "clicked"

This composes to (in the first instance):

    set in t-1 'text "clicked"

`IN` returns the given word (`'text`) bound to the given context (the
face object `t-1`) which is then `SET` to `"clicked"`.

UPDATE

This method doesn\'t even use a word name, just uses a common parent to
connect the button to the label:

    view collect [
        keep [below space 0x0]
        foreach i myRange 10 [
            keep compose/deep [
                panel [
                    origin 0x0
                    text (rejoin ["Message Number: " i])
                    field "entry"
                    button "Click" [face/parent/pane/1/text: "clicked"]
                ]
            ]
        ]
    ]

*Comment by rnso:* Thanks for a good answer (I have upvoted it as well).
But do you really think last 5 lines with just \'\]\' are adding
anything?

*Comment by rgchris:* \@rnso Yes. It is visually coherent.

*Comment by rgchris:* Pragmatically---aside from adhering to the
Rebol/Red style guide, it reads and folds well in text editors.

------------------------------------------------------------------------

## Comments on question
