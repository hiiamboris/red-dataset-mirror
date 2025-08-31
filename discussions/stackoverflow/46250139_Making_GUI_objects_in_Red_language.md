# Making GUI objects in Red language

**Link:**
<https://stackoverflow.com/questions/46250139/making-gui-objects-in-red-language>

**Asked:** 2017-09-16 04:47:04 UTC

------------------------------------------------------------------------

I have following simple code for a small panel:

    view [
        t: text "label"
        f: field
        button "Click here" [t/text: f/text]    ]

But I have to make 2 of them and put them on one window. I want to
create single object class and make 2 objects out of it. I see that
objects can be created as follows:

    obj: object [
        view [
            t: text "label"
            f: field
            button "Click here" [t/text: f/text] ]  ]

    view [
        obj
        obj     ]

But I get following error:

    *** Script Error: VID - invalid syntax at: [obj obj]
    *** Where: do
    *** Stack: view layout cause-error 

How can this be done? Thanks for your help.

Edit: I tried with `do` but could manage only with `does`:

      myview: object [
          show: does [view[
            below
            t: text "1st time"
            f: field "Enter value"
            button "Click here" [f/text "clicked"]
            area] ] ]

      myview/show

      print "READY TO SHOW 2nd OBJECT: "
      myview2: copy myview
      myview2/show

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

I guess what you are looking for are styles and not objects in order to
create a layout. Until now there is no official stylize function in Red.
But you can create your layout dynamically like this

    view repeat i 2 [
        tname: to-word rejoin ['t i]
        fname: to-word rejoin ['f i]
        append v: [] compose/deep [ 
            (to-set-word tname) text "label"
            (to-set-word fname) field
            button "click here"   [
              (to-set-path  compose [(tname) text])  
              (to-path  compose [(fname) text])
            ] 
        ] 
    ]

You can just append a predefined block of words many times to the block
you want to view and you will get repeated elements.

     txt_btn: [
        t: text "label"
        f: field
        button "Click here" [t/text: f/text] 
     ] 
     view append append [] txt_btn txt_btn

The problem arises as you refer to a named element in your block. But a
word can not point to more than one element of the repeated elements,
therefore the usage of compose in the complete solution in order to
create unique names.

Maybe there is a bug in Red because I thought `compose/deep` would also
do parentheses deep inside and not need more compose --

*Comment by rnso:* Yes, it is working! Some explanation of code will
also be very helpful.

*Comment by rnso:* How can I access each of these panels/objects (what
is their name or symbol) if the program wants to interact with them
separately?

*Comment by Geeky I:* This is probably a better way to build up layouts.
You can modify the objects afterwards this way.

*Comment by rnso:* But it is clearly not remaining simple anymore which
was the theme of Red language.

------------------------------------------------------------------------

### Answer (score: 2) --- by Geeky I

To work with *objects* instead of in the *VID* dialect, replace `view`
with `layout`:

    lay: layout [
        t: text "label"
        f: field
        button "Click here" [t/text: f/text]
    ]

    view lay

You can then inspect it like any other object: `?? lay`.

For example, to access the contents of `lay` with `pane`:

    >> ? lay/pane/1

However, a more useful function may be `dump-face`:

    >> dump-face lay
     Type: window Style: none Offset: 833x548 Size: 270x45 Text: "Red: untitled"
         Type: text Style: text Offset: 10x10 Size: 80x24 Text: "label"
         Type: field Style: field Offset: 100x10 Size: 80x24 Text: none
         Type: button Style: button Offset: 190x9 Size: 70x25 Text: "Click here"
    == make object! [
        type: 'window
        offset: 833x548
     ...

`panel`s are useful to group objects together:

    >> dump-face blay: layout [p: panel button "hi"]
     Type: window Style: none Offset: none Size: 292x220 Text: none
         Type: panel Style: panel Offset: 10x10 Size: 200x200 Text: none
         Type: button Style: button Offset: 220x9 Size: 62x25 Text: "hi"
    == make object! [
        type: 'window
        offset: none
        ...

But it\'s probably easier to use the *VID* dialect with `compose` to
build up stuff first.

See also [this
question](https://stackoverflow.com/questions/43809351/how-can-you-dynamically-add-a-new-tab-to-a-tab-panel-in-red/)

*Comment by rnso:* `view lay` works but I want another object
`lay2 copy lay` which also works but then I want to show them in one
view and `view [lay lay2]` throws error: \` VID - invalid syntax at:
\[lay lay2\]\`. How can I show both lay and lay2 in one view?

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

> I want to create single object class and make 2 objects out of it.

There is no object *class* system in Red, so you should really try first
to grasp the basic Red concepts before trying more complex GUI
constructs. Red is a very flexible data-oriented language, so you can
use that to your advantage by, for example, building parametrized block
templates, and assembling them to form a correct block of VID code. Here
is an example:

    make-row: func [label [string!] but-label [string!]][
        compose [
            t: text (label)
            f: field
            b: button (but-label) [face/extra/1/text: face/extra/2/text]
            do [b/extra: reduce [t f]]
        ]
    ]

    view compose [
        (make-row "label" "Click") return
        (make-row "label2" "Click2")
    ]

Understanding the face tree (analog to the HTML DOM, just way simpler),
is an important part of mastering Red\'s GUI system. As there is no much
documentation yet (you can start with
[http://docs.red-lang.org](http://docs.red-lang.org){rel="nofollow noreferrer"}),
you are welcome to ask live questions on
[red/help](https://gitter.im/red/help){rel="nofollow noreferrer"} Gitter
room.

*Comment by rnso:* What is \` do \[b/extra: reduce \[t f\]\]\` doing?
Why not `face/pane` rather than `face/extra`?

*Comment by DocKimbel:* The `/pane` facet is used for constructing the
face tree that defines which widget contains others. You don\'t want
`button` to have child widgets, so there is no purpose in using `/pane`
there. The `/extra` field is a free facet that can be used to attach any
data to the face object. In this case, we want to save a reference to
the text and field faces, so that we can use it when the button is
clicked. Please re-read the
[documentation](https://doc.red-lang.org/en/view.html#_face_object){rel="nofollow noreferrer"}.

------------------------------------------------------------------------

## Comments on question

*Comment by Graham Chiu:* You are still mixing dialects which is why it
won&amp;#39;t work. View only understands the vid dialect. You can
preprocess the block in the do dialect and feed the block of vid dialect
to view

*Comment by rnso:* It seems they are 2 different languages, connected
very thinly.

*Comment by Graham Chiu:* They are two different dialects of the same
language.

*Comment by rnso:* I tried in this as well as previous question, but I
am not able to produce an example with `do` (I could make `collect` and
`keep` work). Can you provide an answer using `do` for this purpose?
(Also see edit in my question above).

*Comment by Graham Chiu:*
[rebol.com/docs/view-guide.html#section-70](http://www.rebol.com/docs/view-guide.html#section-70){rel="nofollow noreferrer"}

*Comment by Geeky I:* See
[stackoverflow.com/questions/43809351/...](https://stackoverflow.com/questions/43809351/how-can-you-dynamically-add-a-new-tab-to-a-tab-panel-in-red "how can you dynamically add a new tab to a tab panel in red")
