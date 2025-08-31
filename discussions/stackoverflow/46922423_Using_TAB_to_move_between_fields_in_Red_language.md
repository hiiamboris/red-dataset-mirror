# Using TAB to move between fields in Red language

**Link:**
<https://stackoverflow.com/questions/46922423/using-tab-to-move-between-fields-in-red-language>

**Asked:** 2017-10-25 01:18:02 UTC

------------------------------------------------------------------------

I have following simple code:

    Red []
    view [
        text "Value of x:"  f1: field "" return
        text "Value of y:"  f2: field "" return
        text "Read Sum:"    tt: text ""  return
        button "Calculate" [
            tt/text: to-string ((to-integer f1/text) + (to-integer f2/text)) ]
        button "Quit" [quit]  ]

How can I add code so that one can move between different fields using
TAB key? Apparently, this works in Rebol (
[http://www.rebol.com/how-to/fields.html](http://www.rebol.com/how-to/fields.html){rel="nofollow noreferrer"}
) but is not working here.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

according [gitter
archive](https://gitter.im/red/red/gui-branch/archives/2016/10/23){rel="nofollow noreferrer"}

    handle-key: function [e prev-fld next-fld][
        k: e/key
        if k = tab [
            either e/shift? [win/selected: prev-fld][win/selected: next-fld]
        ]
    ]
    view [
        text "Value of x:"  f1: field "" on-key [handle-key event tt  f2] return
        text "Value of y:"  f2: field "" on-key [handle-key event f1  tt] return
        text "Read Sum:"    tt: text ""  on-key [handle-key event f2  f1] return
        button "Calculate" [
            tt/text: to-string ((to-integer f1/text) + (to-integer f2/text))      
        ]
        button "Quit" [quit]  
        do [win: self win/selected: f1]
    ]

*Comment by DocKimbel:* View can now handle conversion for `text` and
`field` content for you, so you can simplify your code with:
`button "Calculate" [tt/data: f1/data + f2/data]`.

*Comment by Jim:* You can get the window directly from the event in
`handle-key` to avoid using `win:` throughout the code. Add
`win: e/window` in `handle-key`

------------------------------------------------------------------------

## Comments on question
