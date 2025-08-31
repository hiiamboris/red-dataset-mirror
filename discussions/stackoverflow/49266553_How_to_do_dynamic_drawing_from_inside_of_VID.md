# How to do dynamic drawing from inside of VID

**Link:**
<https://stackoverflow.com/questions/49266553/how-to-do-dynamic-drawing-from-inside-of-vid>

**Asked:** 2018-03-13 22:01:40 UTC

------------------------------------------------------------------------

I have some code that is supposed to do some drawing from inside VID.
People have suggested using the draw block for using it inside VID. I am
trying to do that here, but perhaps not correctly.

Here is some code that shows the basic idea of what I am trying to do.

    Red [Needs: 'View]
    Consolas: make font! [size: 11 name: "Consolas" style: 'bold]
    win: [ size 600x400

    a: area 460x400 rate 0:0:3 on-time [

            a/draw [
                font Consolas
                text 10x20  "Miter"
                text 170x20 "Round"
                text 330x20 "Bevel"
            ]
        ]
    ]
    view win

This code does not create any errors, but does not do any drawing. How
can I change the code to actually do the drawing?

The key here is that I am trying to do drawing conditionally based on
other factors which will help to determine what is supposed to be drawn.
But if I can\'t get this working, there\'s no hope for adding in logic.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

Here is a correct version of your code:

    Red [Needs: 'View]

    Consolas: make font! [size: 11 name: "Consolas" style: 'bold]

    view [
        size 600x400
        a: base 460x400 draw [
            font Consolas
            text 10x20  "Miter"
            text 170x20 "Round"
            text 330x20 "Bevel"
        ]
    ]

I have made the following changes:

-   `area` creates a text area native widget that does not support
    drawing, so it is replaced by `base` which is the generic face
    supporting drawing.
-   `rate 0:0:3` and `on-time` handler together create a timer that will
    evaluate the handler every 3 seconds, so irrelevant here.
-   `a/draw` is not the correct
    [syntax](https://doc.red-lang.org/en/vid.html#_draw){rel="nofollow noreferrer"}
    for specifying a draw block as option to a face definition in VID.
-   The `win:` word setting has been removed, and the VID block is fed
    to `view` directly for sake of simplicity in this case.

You can join our Gitter [help
room](https://gitter.im/red/help){rel="nofollow noreferrer"} if you need
more help in learning Red and its GUI system.

*Comment by Alexander Ryan Baggett:* I appreciate the thought. The
documentation on the Face object said that the draw facet was applicable
for all.

*Comment by Alexander Ryan Baggett:* The thing, I am not trying to draw
something static. I am trying to draw something whose contents will
depend on the contents of the area block. Having to draw in another
block somewhat throws a wrench in my plans. But more importantly, I wish
I saw documentation on how to draw stuff dynamically, every example is
static text. The contents of the Draw block are never
determined/evaluated at runtime in any example.

*Comment by DocKimbel:* The content of Draw is *always* evaluated at
runtime, so you can achieve dynamic effects by simply modifying the
`a/draw` block in an event handler.

------------------------------------------------------------------------

## Comments on question

*Comment by DocKimbel:* Both are incorrect, it should be:
`Red [Needs: 'View]`. Such property in the header matters only if the
user wants to compile the code to a standalone executable, otherwise it
is not required for running the script from the console.
