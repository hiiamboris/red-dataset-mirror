# How to use tab to move in a list of fields in Red language

**Link:**
<https://stackoverflow.com/questions/46936613/how-to-use-tab-to-move-in-a-list-of-fields-in-red-language>

**Asked:** 2017-10-25 15:38:18 UTC

------------------------------------------------------------------------

This is similar to my earlier question ( [Using TAB to move between
fields in Red
language](https://stackoverflow.com/questions/46922423/using-tab-to-move-between-fields-in-red-language)
). Since I have many fields, I want to use a list of fields. However,
following code is not working:

    Red []

    view [
        text "Value of x:"  f1: field "" on-key [handle-key event] return
        text "Value of y:"  f2: field "" on-key [handle-key event] return
        text "Third: " f3:  field "" on-key [handle-key event] return
        text "Fourth:" f4:  field "" on-key [handle-key event] return
        text "Read Sum:"    tt: text ""  on-key [handle-key event] return
        do[
            fldlist: [f1 f2 f3 f4]
            focusnum: 1
            maxfocusnum: length? fldlist
            handle-key: function [e] [
                print rejoin ["focusnum = " focusnum]   ; OUTPUT: "focusnum = none"
                k: e/key
                if k = tab [
                    either e/shift? 
                        [   focusnum: focusnum - 1
                            if focusnum < 1 [focusnum: maxfocusnum]
                            win/selected: fldlist/:focusnum]
                        [   focusnum: focusnum + 1
                            if focusnum > maxfocusnum [focusnum: 1]
                            win/selected: fldlist/:focusnum]
                            ] ] ]

        button "Calculate" [
            tt/text: to-string ((to-integer f1/text) + (to-integer f2/text))      
        ]
        button "Quit" [quit]  
        do [win: self win/selected: f1]
    ]

The `focusnum` is given out as `none`. Where is the problem and how can
this be solved.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

Two modifications make your script working

    fldlist: [f1 f2 f3 f4] -> fldlist: reduce [f1 f2 f3 f4

You need the \'faces\' and not the words pointing to the faces.

    handle-key: function [e] [ 

-\>

     handle-key: func [e] [
         focusnum: index? find fldlist win/selected

**function** makes automatically all set-words local. Therefore the
local **focusnum** is not initialized with a value, but the global
focusnum has still the start value . Finding the focusnum dynamically
should cure the \'disturbance\'. Probably there are more efficent ways
to do so.

And here an almost final version with proper **formatting**

    view [
        text "Value of x:"  f1: field "" on-key [handle-key event]  on-focus [handle-focus face event] return
        text "Value of y:"  f2: field "" on-key [handle-key event] on-focus [handle-focus face event] return
        text "Third: " f3:  field "" on-key [handle-key event] on-focus [handle-focus face event] return
        text "Fourth:" f4:  field "" on-key [handle-key event] on-focus [handle-focus face event] return
        text "Read Sum:"    tt: text ""  on-key [handle-key event] return
        do[
            fldlist:  reduce [f1 f2 f3 f4]
            focusnum: 1
            maxfocusnum: length? fldlist
            handle-key: func [e] [
                print rejoin ["focusnum = " focusnum]  
                k: e/key
                if k = tab [
                    either e/shift?   [   
                        focusnum: focusnum - 1
                        if focusnum < 1 [focusnum: maxfocusnum]
                        set-focus  fldlist/:focusnum
                    ] [   
                        focusnum: focusnum + 1
                        if focusnum > maxfocusnum [focusnum: 1]
                        set-focus  fldlist/:focusnum
                    ]
                ]
            ] 
            handle-focus: func [f e] [ probe focusnum: index? find fldlist f]
        ]
        button "Calculate" [
            tt/data:  f1/data + f2/data      
        ]
        button "Quit" [quit]  
        do [win: self win/selected: f1]
    ]

*Comment by rnso:* Yes, it works but everything gets disturbed if some
field is manually selected by clicking mouse on it. Any way to correct
this problem? I am not able to make `find` or
`select fldlist win/selected` work for this.

*Comment by rnso:* This works very well. Great. I hope this feature
comes in future release of language itself.

------------------------------------------------------------------------

### Answer (score: 0) --- by rnso

I managed some further simplification of code:

    view [
        text "Value of x:"  f1: field "" on-key [handle-key event] return
        text "Value of y:"  f2: field "" on-key [handle-key event] return
        text "Third: " f3:  field ""    on-key [handle-key event] return
        text "Fourth:" f4:  field ""    on-key [handle-key event] return
        text "Read Sum:"    tt: text "" on-key [handle-key event] return
        button "Calculate" [
            tt/data:  f1/data + f2/data   
        ]
        button "Quit" [quit]  

        do[ fldlist:  reduce [f1 f2 f3 f4]
            mafocusnumfocusnum: length? fldlist
            handle-key: func [e] [
                if e/key = tab [
                    focusnum: index? find fldlist win/selected
                    either e/shift?
                        [   focusnum: focusnum - 1    
                            if focusnum < 1 [focusnum: mafocusnumfocusnum] ]
                        [   focusnum: focusnum + 1    
                            if focusnum > mafocusnumfocusnum [focusnum: 1] ]
                    set-focus fldlist/:focusnum 
                ]   
            ]
            win: self win/selected: f1
        ] 
    ]

handle-focus function is not needed here.

*Comment by sqlab:* handle-focus is not needed as I showed in my answer
at first, but the setting of focusnum at every key stroke is inefficent
compared to the solution of setting at focus change.

------------------------------------------------------------------------

## Comments on question
