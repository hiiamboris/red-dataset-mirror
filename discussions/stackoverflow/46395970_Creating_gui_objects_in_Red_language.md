# Creating gui objects in Red language

**Link:**
<https://stackoverflow.com/questions/46395970/creating-gui-objects-in-red-language>

**Asked:** 2017-09-25 00:00:32 UTC

------------------------------------------------------------------------

Is it possible to use `make` command to create gui `object` in
Red/Rebol. I tried following:

    view [
        do [guiobj: make object! [
                 t: text "text"
                 f: field "fld"
                 b: button "button" ] ; end make object

            obj1: make guiobj
            obj2: make guiobj ]  ; end do

        below
        obj1  
        obj2 ]  ; end view

But I get following error:

    *** Script Error: field has no value
    *** Where: f
    *** Stack: view layout do-safe 
    *** Script Error: VID - invalid syntax at: [obj1 obj2]
    *** Where: do
    *** Stack: view layout cause-error 

I know `compose` can be used but can above code be made to work using
`make` and `object` commands?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by rgchris

According to [the
documentation](https://doc.red-lang.org/en/view.html#_face_object){rel="nofollow noreferrer"}:
*Face objects are clones of face! template object.*

It\'s possible to build up UIs without using
[VID](https://doc.red-lang.org/en/vid.html#_overview){rel="nofollow noreferrer"}---understanding
that will help you understand how to manipulate the output from `layout`
(and `view`). What you lose building things from scratch is the layout
feature that VID offers, but we can get the best from both worlds.
Let\'s have a go:

## Window Without VID

First we\'ll need a place to put all our elements:

    our-window: make face! [
        type: 'window
        text: "Our Window"
        size: 500x500
    ]

Now let\'s stick some things in there:

    our-window/pane: reduce [
        make face! [
            type: 'text
            offset: 20x20
            size: 160x28
            text: "Text"
        ]
        make face! [
            type: 'field
            offset: 200x20
            size: 160x24
            text: "Field"
        ]
        make face! [
            type: 'button
            offset: 380x20
            size: 160x28
            text: "Button"
        ]
    ]

And now we can take a look at it:

    view our-window

Note that the objects in `our-window/pane` are kind-of like the objects
that would be generated in this example:

    our-vid-window: layout [
        text 160 "Text"
        field 160 "Field"
        button 160 "Button"
    ]

As I said, with this approach you have to manage sizes and offsets
yourself. What we can do is generate our row, take those face objects
and append it to our window.

## Stealing Generated Faces from VID

Indeed we can actually create these objects with `layout` and drop them
in `our-window`:

    make-row: func [/local row face kid][
        row: layout copy/deep [ ; copy so the strings are unique
            text 160 "Text"
            field 160 "Field"
            button 160 "Button"
        ]

        ...
    ]

*Using techniques from [this
answer](https://stackoverflow.com/a/46391167/292969) you can even apply
global words to each of these faces and will still work.*

Before we do though, we\'re going to check if `our-window` has any
children and adjust the offset of each of the new faces to appear below
the last child:

    if kid: last our-window/pane [
        ...

        foreach face row/pane [
            face/offset/y: face/offset/y + kid/offset/y + kid/size/y
        ]
    ]

To get the window sizing right, we\'re also going to adjust the
generated row size and apply thus:

    row/size/y: row/size/y + kid/offset/y + kid/size/y

    ...

    our-window/size: row/size

And then the fun part:

    append our-window/pane row/pane

Bringing this all together, we can generate a nicely sized window.

    our-window: layout [
        button "Add a Row" [make-row]
    ]

    make-row: func [/local row face kid][
        row: layout copy/deep [
            text 160 "Text"
            field 160 "Field"
            button 160 "Button"
        ]

        if kid: last our-window/pane [
            row/size/y: row/size/y + kid/offset/y + kid/size/y

            foreach face row/pane [
                face/offset/y: face/offset/y + kid/offset/y + kid/size/y
            ]
        ]

        our-window/size: row/size

        append our-window/pane row/pane
    ]

    make-row
    make-row
    make-row

    view our-window

*Comment by rgchris:* For old-timers, adding `'across` in the `row` spec
and `show our-window` after the `append`, this last example works in
Rebol/View 2.7.8 as well : )

*Comment by rnso:* What is \'panel\' (
[red-by-example.org/index.html#0panel](http://www.red-by-example.org/index.html#0panel){rel="nofollow noreferrer"}
) for? Can we not use it here?

*Comment by rgchris:* `panel` is akin to a `<div>` in HTML---it creates
a face object that itself has child objects. It could indeed be used
here, would make the positioning loop redundant
(`foreach face row/pane [...]`).

*Comment by rnso:* Addition of code with `panel` will make your answer
even more comprehensive.

*Comment by rgchris:* \@rnso Am somewhat reluctant to---it does change
the code and resultant structure sufficiently that it require an
extended explanation in itself.

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Of course. I did talk about this and linked to
examples in some of my answers

*Comment by Geeky I:* e.g.
[stackoverflow.com/a/46256166/5798459](https://stackoverflow.com/a/46256166/5798459)

*Comment by Geeky I:* Just wanted to add, this is a good question, but I
get the feeling you\'re trying to run before you can crawl. Please do
check out the community here
[chat.stackoverflow.com/rooms/291/rebol](https://chat.stackoverflow.com/rooms/291/rebol)
and on gitter

*Comment by rgchris:*
[VID](https://doc.red-lang.org/en/vid.html#_overview){rel="nofollow noreferrer"}
(the spec handed to `view` or `layout`) is a dialect---it is processed
and converted into [a face
tree](https://doc.red-lang.org/en/view.html#_the_face_tree){rel="nofollow noreferrer"}
(in the case of `layout` is not yet a descendant of a screen face). It
is not Red *do* code though does have some evaluative properties---using
outside of `view` and `layout` will almost always produce an error.
