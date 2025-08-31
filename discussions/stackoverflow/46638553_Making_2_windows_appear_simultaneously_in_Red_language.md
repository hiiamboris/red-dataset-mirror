# Making 2 windows appear simultaneously in Red language

**Link:**
<https://stackoverflow.com/questions/46638553/making-2-windows-appear-simultaneously-in-red-language>

**Asked:** 2017-10-09 03:45:57 UTC

------------------------------------------------------------------------

How can I make these 2 separate windows appear simultaneously and remain
open thereafter unless the quit button is pressed?

       Red []

       view/flags [ below
                text "second view"
                f2: field "f2 text"
                ] 'no-buttons

       view/flags [ below
            text "first view"
            b1: button "Print f2 text" [print f2/text]
            quitb: button "quit" [quit]
        ] 'no-buttons

I tried to put second view in a function and call it from first view-
but it shows only second view (first view is shown after second is
closed by Alt-F4).

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by DocKimbel

A call to `view` is a blocking call that will run its own event loop,
until it is closed. `view/no-wait` will open the window without a new
event loop, so it will not block (still requires an event loop to
process events). So you can open the first window as non-blocking, and
the last one in blocking mode, for running the event loop:

    view/no-wait/flags [
        below
        text "second view"
        f2: field "f2 text"
    ] 'no-buttons

    view/flags [
        below
        text "first view"
        b1: button "Print f2 text" [print f2/text]
        quitb: button "quit" [quit]
    ] 'no-buttons

------------------------------------------------------------------------

## Comments on question
