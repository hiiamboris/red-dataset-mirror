# Rebol code gui working but not clearing fields

**Link:**
<https://stackoverflow.com/questions/46210982/rebol-code-gui-working-but-not-clearing-fields>

**Asked:** 2017-09-14 05:12:07 UTC

------------------------------------------------------------------------

I am trying following code where user enters 2 numbers and on clicking
calculate button, answer should be shown. There are also buttons for
clearing fields and for exiting.

    REBOL[]

    fields: [f-ht f-wt ans]
    reset-fields: does [
        unfocus
        f-ht/text: " "   ; Changing this to "ENTER NUMBER HERE" does not help
        f-wt/text: " "
        focus f-ht
    ]

    oncalc: does [ 
        ans/text: (to integer! f-wt/text) / ((100 * to integer! f-ht/text) * (100 * to integer! f-ht/text))
        show fields
    ]

    lo: layout [
        style tx label 200x24 center
        style fld field 200x24 center
        style btn button 200x24 center

        tx "First Number:" 
        f-ht: fld 
        tx "Second Number:" 
        f-wt: fld 
        btn "Calculate" [oncalc]                   
        ans: tx "Answer"
        btn "Clear" [reset-fields show fields]     ; NOT WORKING- NOTHING HAPPENS
        btn "Exit" escape [unview/only lo]
    ]
    reset-fields
    view center-face lo

The GUI is showing all right. However, there are following problems:

    On clear button clicking, nothing is happening.

There are no changes on GUI and no errors are being reported. Where is
the problem and how can this be solved? Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

Clear the fields instead of setting to new strings

    reset-fields: does [
       unfocus
       clear f-ht/text  
       clear f-wt/text
       focus f-ht
    ]

*Comment by rnso:* Why setting of new strings not working? If I have to
set new strings, how do I do it?

*Comment by rnso:* Also, how can I change decimal values being shown in
the answer?

*Comment by sqlab:* Reuse the existing fields with clear, append or
insert. You can round your result, if you want to get it prettier.

*Comment by sqlab:* try help round in the interpreter

*Comment by rnso:* Yes, I found it. But it is not clear how to round a
decimal number to 2 or 3 digits.

*Comment by sqlab:* e.g. round/to 5.55555555 0,01

------------------------------------------------------------------------

## Comments on question
