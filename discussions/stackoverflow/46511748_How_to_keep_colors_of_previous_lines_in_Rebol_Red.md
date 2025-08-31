# How to keep colors of previous lines in Rebol/Red

**Link:**
<https://stackoverflow.com/questions/46511748/how-to-keep-colors-of-previous-lines-in-rebol-red>

**Asked:** 2017-10-01 11:02:24 UTC

------------------------------------------------------------------------

I am trying to draw lines of different colors in modified paint program:

    REBOL [title: "Paint"]
    mycol: black
    view layout [ size 1100x700
        s: area 1060x600 white feel [
            engage: func [f a e] [
                if a = 'over [append s/effect/draw e/offset  show s]
                if a = 'up [append s/effect/draw 'line]
            ]
        ] effect [draw [pen mycol line]]
        across
        btn "Clear" 100x50 [s/effect/draw: copy [line] show s]
        btn "Red" 100x50 [set [to-word mycol] red]
        btn "blue" 100x50 [set [to-word mycol] blue]
        btn "magenta" 100x50 [set [to-word mycol] magenta]
        btn "green" 100x50 [set [to-word mycol] green]
        btn "yellow" 100x50 [set [to-word mycol] yellow]
        btn "orange" 100x50 [set [to-word mycol] orange]
        btn "Quit" 100x50 [quit]
    ]

However, when I select a color, all lines in area change color. How can
I modify so that earlier lines remain of same color?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by rgchris

The [Draw
dialect](http://www.rebol.com/docs/draw.html){rel="nofollow noreferrer"}
is a cumulative description of a drawing. In your example, you only set
the pen colour once and all lines thereafter inherit said colour. As you
set the pen colour using the word `mycol`, all your lines are set to
whatever colour that word refers to once the face display is updated
(`show s` in your code above).

Can break things down a little here to understand some of the
operations:

## The Drawing

Let\'s initiate the drawing in it\'s own object with the current colour.

    drawing: make object! [
        image: []
        color: black
        use: func [new [tuple!]][
            append image reduce ['pen color: new]
        ]
        reset: does [
            clear image
            use color
        ]
        reset
    ]

Here we have everything we need to manage the settings of the drawing:

**image** --- the drawing itself (in the Draw dialect).

**color** --- the current pen colour.

**use** --- a function to change the current color and apply it to the
drawing.

**reset** --- clears the drawing.

## The Canvas

Our canvas will be a simple BOX face which will contain the drawing:

    box 1060x600 white
    effect reduce ['draw drawing/image]

And will react to `down` and `over` actions passed via the
[Engage](http://www.rebol.com/docs/view-face-events.html#section-11){rel="nofollow noreferrer"}
function:

    feel [
        engage: func [face action event] [
            switch action [
                down [append drawing/image 'line]
                over [append drawing/image event/offset show face]
            ]
        ]
    ]

*(I\'ve changed the engage parameters here to their full
names---there\'s little efficiency gained and much expressivity lost in
Rebol/Red using one-letter words)*

This should work as per the engage function in your example except that
new lines are started on a `down` action.

## Actions

Our \'Clear\' button engages the `drawing` object and resets the canvas
(the button\'s oldest sibling):

    btn "Clear" 100x50 [
        drawing/reset
        show first face/parent-face/pane
    ]

Just for a little interface sugar, we\'ll use toggles to indicate the
current colour. You can create a mutual relationship between toggles
using the `of` keyword:

    tog of 'color "Red"     100x50 [drawing/use red]
    tog of 'color "Blue"    100x50 [drawing/use blue]
    tog of 'color "Magenta" 100x50 [drawing/use magenta]
    tog of 'color "Green"   100x50 [drawing/use green]
    tog of 'color "Yellow"  100x50 [drawing/use yellow]
    tog of 'color "Orange"  100x50 [drawing/use orange]

# Bringing It Together

Can wrap this up in a script:

    Rebol [Title: "Paint"]

    drawing: make object! [
        image: []
        color: black
        use: func [new [tuple!]][
            append image reduce ['pen color: new]
        ]
        reset: does [
            clear image
            use color
        ]
        reset
    ]

    view layout [
        box 1060x600 white
        effect reduce ['draw drawing/image]
        feel [
            engage: func [face action event] [
                switch action [
                    down [append drawing/image 'line]
                    over [append drawing/image event/offset show face]
                ]
            ]
        ]
        across
        btn "Clear" 100x50 [drawing/reset show face/parent-face/pane/1]
        tog of 'color "Red"     100x50 [drawing/use red]
        tog of 'color "Blue"    100x50 [drawing/use blue]
        tog of 'color "Magenta" 100x50 [drawing/use magenta]
        tog of 'color "Green"   100x50 [drawing/use green]
        tog of 'color "Yellow"  100x50 [drawing/use yellow]
        tog of 'color "Orange"  100x50 [drawing/use orange]
        btn "Quit" 100x50 [unview]
    ]

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

A minimal example looks like this

    view layout [
        s: area white feel [
            engage: func [f a e] [
                if a = 'over [append s/effect/draw e/offset  show s]
                if a = 'up [append s/effect/draw 'line]
            ]
        ] effect [draw [pen blue line]]
        btn "Clear" [s/effect/draw: copy [line] show s]
        btn "Red" [append s/effect/draw [pen red line]]
    ]

So your script should be

    view layout [ size 1100x700
        s: area 1060x600 white feel [
            engage: func [f a e] [
                if a = 'over [append s/effect/draw e/offset  show s]
                if a = 'up [append s/effect/draw 'line]
            ]
        ] effect [draw [pen black line]]
        across
        btn "Clear" 100x50 [s/effect/draw: copy [line] show s]
        btn "Red" 100x50 [append s/effect/draw [pen red line]]
        btn "blue" 100x50 [append s/effect/draw [pen blue line]]
        btn "magenta" 100x50 [append s/effect/draw [pen magenta line]]
        btn "green" 100x50 [append s/effect/draw [pen gree line]]
        btn "yellow" 100x50 [append s/effect/draw [pen yellow line]]
        btn "orange" 100x50 [append s/effect/draw [pen orange line]]
        btn "Quit" 100x50 [quit]
    ]

*Comment by rnso:* Can you briefly explain about `engage` and `effect`.
Also, a button to add text is not working. I am trying code:
`btn "text" [append s/effect/draw ['text 100x100 "Graphics Plot" ]]` .
(I cannot ask new questions for some time now!).

*Comment by rgchris:* \@rnso Documentation on [Face
Effect](http://www.rebol.com/docs/view-face-effects.html){rel="nofollow noreferrer"},
[Draw](http://www.rebol.com/docs/draw.html){rel="nofollow noreferrer"}
dialect (is somewhat compatible with SVG), and [Event
Handling](http://www.rebol.com/docs/view-face-events.html){rel="nofollow noreferrer"}
(`engage`).

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Is this rebol2? (talking about the tag)

*Comment by rnso:* REBOL/view 2.7.8
