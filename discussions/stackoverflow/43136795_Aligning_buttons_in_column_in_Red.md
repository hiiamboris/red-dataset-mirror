# Aligning buttons in column in Red

**Link:**
<https://stackoverflow.com/questions/43136795/aligning-buttons-in-column-in-red>

**Asked:** 2017-03-31 09:10:29 UTC

------------------------------------------------------------------------

I am brand new to Red/Rebol. I love it so far, I am experimenting with
the GUI system.

I am trying to align some buttons in a vertical column so to speak.

This is what I have so far

        Red [ Title: "Editor"  needs: 'view]

        view [ size 800x600 title "Save Notes"
        t: text  ""
        a: area 500x500 black
        button "Click" [t/text: "Red is good !" ]  return
        text "" button "Close" [quit] return
        text "" button "Save" [save %notes.dat a/text t/text "Saved"]
            ]

This is what it creates, which I have annotated with what I am trying to
do: [![enter image description
here](https://i.sstatic.net/XMBv2.png)](https://i.sstatic.net/XMBv2.png){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

Welcome to Red!

In the
[VID](https://doc.red-lang.org/en/vid.html){rel="nofollow noreferrer"}
dialect, the default direction where the next element will be put, is by
default horizontal (`across`), so that a `return` will go to the next
column. If you switch the direction to vertical (using `below`), then
the next element will go in the next row, staying in the same column. So
it gives you:

    Red [ Title: "Editor"  needs: 'view]

    view [ size 800x600 title "Save Notes"
        t: text  ""
        a: area 500x500 black
        below pad 10x0
        button "Click" [t/text: "Red is good !" ] 
        text "hello" button "Close" [quit]
        text "world" button "Save" [save %notes.dat a/text t/text "Saved"]
    ]

*Note: I just put some text into your empty labels, so that we can see
them in the layout, and how they affect the positionning of the
buttons.*

Have fun playing with it! ;-)

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Nice explanation!
