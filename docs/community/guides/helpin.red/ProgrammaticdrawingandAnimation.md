Original URL: <http://helpin.red/ProgrammaticdrawingandAnimation.html>

# Programmatic drawing and Animation

* * *

* * *

Executing drawings using Red programming tools (loops, math, branching etc.) requires some structuring of the script. I found the following to be a rule-of-thumb structure:

Red \[needs: view]

draw-changing: function \[  ]

view compose/deep/only [

       face focus

       draw\[commands (arguments)]

       on-event \[ draw-changing ]

]

draw-changing - This are the functions to be called from an event to do calculations and then change the "draw" field of the face's object. You must change this field from here because you can't change it from inside the dialect block.

face focus -  Some events (as key) seem to only be generated with  focus on graphic faces like base or box, so beware.

draw - Executes the draw dialect. Any calculated argument (variable) should be within parenthesis to be evaluated by compose/deep/only.  

on-event - Calls the appropriate draw-changing function considering the type of event.

Very simple animation:

Red \[needs 'view]

position: 0x0        

update-canvas: func \[] [        

   position: position + 1x1

   canvas/draw:  reduce \['circle position 5]

]

view [

   canvas: base 100x100  rate 25

   on-time \[update-canvas]

]

![](http://helpin.red/lib/NewItem194.png)

The code explained:

Red \[needs 'view]

{ "position" is the center of the circle

that will be moved. Here it's at the top left corner}

position: 0x0        

{ the "update-canvas" function does all the

necessary processing and "passes" the draw

routine to the draw field of the canvas

object.  Notice three things in the code below:

1- Yes, draw is a field of an object!

2- You must use "reduce" to send the

current value of position;

3- There must be an apostrophe before

"circle". "circle" is a keyword of the draw

dialect, and so it must be passed "as is"}

update-canvas: func \[] [        

   position: position + 1x1

   canvas/draw:  reduce \['circle position 5]

]

{The view routine creates a base named

"canvas" that updates itself 25 times

per second}

view [

   canvas: base 100x100  rate 25

   on-time \[update-canvas]

]

To show that canvas is an object!, close the graphic view after it runs a bit, but leave the console open. Type ? canvas in the console. You will get:

&gt;&gt; ? canvas

CANVAS is an object! with the following words and values:

    type             word!         base

    offset           pair!         10x10

    size             pair!         100x100

    text             none!         none

    image            none!         none

    color            tuple!        128.128.128

    menu             none!         none

    data             none!         none

    enabled?         logic!        true

    visible?         logic!        true

    selected         none!         none

    flags            none!         none

    options          block!        length: 6  [style: base vid-align: top at-o...

    parent           object!       [type offset size text image color menu dat...

    pane             none!         none

    state            none!         none

    rate             integer!      25

    edge             none!         none

    para             none!         none

    font             none!         none

    actors           object!       \[on-time]

    extra            none!         none

    draw             block!        length: 3  \[circle 37x37 5]

    on-change*       function!     \[word old new /local srs same-pane? f saved]

    on-deep-change*  function!     \[owner word target action new index part]

In the next example, instead of changing the draw block, we will append it with new draw commands. The result is that all the previous drawings are kept, and not deleted (in fact they are redrawn, but...), creating a trail of drawings:

Red \[ needs 'view ]

position: 0x0

command: \[]        ; initialized to prevent error.

update-canvas: func \[] [

   position: position + 1x1

       {I could not figure out how to append the draw

method directly, so a block named "command" was

used to pass words to draw dialect}

   append command reduce \['circle position 5]

   canvas/draw:  command

]

view [

   canvas: base 100x100  rate 25

   on-time \[update-canvas]

]

![](http://helpin.red/lib/NewItem196.png)

Note that if you close the graphic window and type ? canvas in the console you will see a long block as the value of draw:

&gt;&gt; ? canvas

...

    draw     block!   length: 84  [circle 1x1 5 circle 2x2 5 circle 3x3 5 circle 4x4 5 ...

...

An example of programmed drawing:

Red \[needs: view]

drawcircles: does [

   command: \[pen red fill-pen blue]

   repeat x 8 [

       repeat y 8 [

           position:(x * 11x0) + (y * 0x11)

           append command reduce \['circle position 4]

       ]

   ]

           canvas/draw:  command

]

view [                

   canvas: base 100x100

   do \[drawcircles]

]

![](http://helpin.red/lib/NewItem198.png)

You could have written the program above without using a function, but you would need the no-wait refinement for view, like this:

Red \[needs: view]

command: \[pen red fill-pen blue]

view/no-wait [                

   canvas: base 100x100

]

{the "no-wait" refinement above allows the

script do create the view (base) and then keep

going, to the nested "repeats" below.

Without "no-wait" the script would stay in the

"view" block}

repeat x 8 [

   repeat y 8 [

       position:(x * 11x0) + (y * 0x11)

       append command reduce \['circle position 4]

   ]

]

canvas/draw:  command

probe command {just to show you what was sent to draw.

you must use probe instead of print, because print

tries to evaluate things, and "pen" and "circle" have

no value}

[pen red fill-pen blue circle 11x11 4 circle 11x22 4 circle 11x33 4 circle 11x44 4 circle 11x55 4 circle 11x66 4 circle 11x77 4 circle 11x88 4 circle 22x11 4 circle 22x22 4 circle 22x33 4 circle 22x44 4 circle 22x55 4 circle 22x66 4 circle ...

You see that Red updates the base with the drawings generated by the draw block even after the face was created by View. That happens because in Red, unlike Rebol, the default is that whenever you change some field of the face object, the face is updated automatically. That wouldn't have happened if you added the statement system/view/auto-sync?: off  at the beginning of the script as described [here](http://helpin.red/Advancedtopics.html#autosync) .

The simplest Paint program ever:

Red \[needs: view]

newposition: 40x40                ;sorry, but always starts in center.

linedraw: func \[offset] [        ;func, not function. Variables are global.

   oldposition: newposition

   newposition: offset        

       ; now we keep adding lines to the draw block:

   append canvas/draw reduce\['line oldposition newposition]

]

view [

canvas: base draw\[]                ;creates a draw field in the object.

   on-down [                        ;when button is clicked...

       do \[linedraw event/offset]  ;sends mouse position.

   ]        

]

Every time you click the mouse on the base, a new line segment is drawn:

![](http://helpin.red/lib/NewItem213.png)

Here is a much improved version of the script that, however, does not use the "rule-of-thumb" structure:

Red \[needs: view]

EnableWrite: false

view [

   canvas: base 150x150 white all-over

   draw\[]

   on-down [                              ;when mouse button is pressed...

       EnableWrite: true              ;... enables drawing...

       startpoint: event/offset    ;...and get cursor position

   ]

   on-up \[EnableWrite: false]        ;when mouse button is released, disable drawing

   on-over [                              ;when cursor is moved on canvas...

       if EnableWrite [        

           endpoint: event/offset        ;get cursor position

                       ; now we keep adding lines to the draw block

           append canvas/draw reduce\['line startpoint endpoint]

           startpoint: endpoint

       ]  

   ]        

]

Note that the all-over flag allows the over event to create events for every mouse movement, as explained [here](http://helpin.red/Advancedtopics.html#allover).

![](http://helpin.red/lib/NewItem214.png)

Moving a shape with arrow keys

This script draws an "alien" in the center of a base, and allows the arrow keys to move the shape up, down, left and right. It uses the translate transform to do the moving. Note the use of compose to evaluate things in parenthesis.

Red \[needs: view]

pos: 28x31                ; This is the initial position of the "alien"

{ The following block is just the shape of an "alien"}

alien: [line 4x0 4x2

'hline 2 'vline 2 'hline -2 'vline 2

'hline -2 'vline 2 'hline -2 'vline 6

'hline 2 'vline -4 'hline 2 'vline 4

'hline 2 'vline 2 'hline 4 'vline -2

'hline -4 'vline -2 'hline 10 'vline 2

'hline -4 'vline 2 'hline 4 'vline -2

'hline 2 'vline -4 'hline 2 'vline 4

'hline 2 'vline -6 'hline -2  'vline -2

'hline -2 'vline -2 'hline -2 'vline -2

'hline 2 'vline -2 'hline -2 'vline 2

'hline -2 'vline 2 'hline -6 'vline -2

'hline -2 'vline -2 'hline -2

move 6x6 'hline 2 'vline 2 'hline -2 'vline -2

move 14x6 'hline 2 'vline 2 'hline -2 'vline -2

]

{Next function updates the 'draw' block of the cosmos object.

It removes the word 'translate and the following pair!

from the beginning of the block and then inserts the

word 'translate again and the updated position's pair!}

update-cosmos: func \[] [

       remove/part cosmos/draw 2    

       insert cosmos/draw reduce \['translate pos]

]                

view compose/deep/only [

       cosmos: base black focus ; use focus to get on-key event

       draw [

               translate (pos)         ; initial translation. Centers "alien"

               pen white        

               fill-pen white

           shape (alien)

       ]

       on-key  [

               switch event/key [

                       up        \[pos: pos - 0x1]        ; decreases y axis

                       down        \[pos: pos + 0x1]        ; increases y axis

                       left        \[pos: pos - 1x0]        ; decreases x axis

                       right \[pos: pos + 1x0]        ; increases x axis

               ]

             update-cosmos

       ]

]

![](http://helpin.red/lib/NewItem216.png)

I suggest you try to change the code to rotate it.

Moving two or more shapes separately

The following script uses the left and right arrow to move the "spaceship" and "z" and "x" keys to move the "alien". Note the scope of reduce and compose:

Red \[needs: view]

;======= initial positions: ========

alienposition: 28x15

shipposition: 32x60

;======= just the shapes ===========

alien: [line 4x0 4x2

'hline 2 'vline 2 'hline -2 'vline 2

'hline -2 'vline 2 'hline -2 'vline 6

'hline 2 'vline -4 'hline 2 'vline 4

'hline 2 'vline 2 'hline 4 'vline -2

'hline -4 'vline -2 'hline 10 'vline 2

'hline -4 'vline 2 'hline 4 'vline -2

'hline 2 'vline -4 'hline 2 'vline 4

'hline 2 'vline -6 'hline -2  'vline -2

'hline -2 'vline -2 'hline -2 'vline -2

'hline 2 'vline -2 'hline -2 'vline 2

'hline -2 'vline 2 'hline -6 'vline -2

'hline -2 'vline -2 'hline -2

move 6x6 'hline 2 'vline 2 'hline -2 'vline -2

move 14x6 'hline 2 'vline 2 'hline -2 'vline -2

]

spaceship: [move 0x12 'hline 14 'vline -6

'hline -2 'vline -2 'hline -4 'vline -4 'hline -2

'vline 4  'hline -4 'vline 2 'hline -2 'vline 6

]

;======= The draw block updating function ======

; this time we create the whole block and just replace

; the original cosmos/draw

update-cosmos: does[

   drawblock: reduce compose/deep[

       'pen white

       'fill-pen white

       'translate alienposition \[shape \[(alien)]]

       'translate shipposition \[shape \[(spaceship)]]

   ]

   ;probe drawblock ;uncomment if you want to see it

   cosmos/draw: drawblock

]

view compose/deep/only [

   cosmos: base black focus

;this "draw" be "executed" only once:

   draw [        

       pen white

       fill-pen white

       translate (alienposition) \[shape (alien)]

       translate (shipposition) \[shape (spaceship)]

   ]

; now the draw block will be recreated on every key press

   on-key  [

               switch event/key [

                       #"z"        \[alienposition: alienposition - 1x0]        ; decreases x axis

                       #"x"        \[alienposition: alienposition + 1x0]        ; increases x axis

                       left \[shipposition: shipposition - 1x0]            ; decreases x axis

                       right \[shipposition: shipposition + 1x0]        ; increases x axis

       ]

      update-cosmos ; calls the "draw block recreating function"

       ]

]

![](http://helpin.red/lib/NewItem217.png)

Curiouser and curiouser...

The following script creates a rotating square using a different, somewhat strange technique:

Red \[needs: view]

tick: 1

view[

   mybox: box rate 10 draw [

       mytransform: rotate  1  40x40

       box 20x20 60x60

       ]

   on-time [

       tick: tick + 1

       mytransform/2: tick

   ]

]

![](http://helpin.red/lib/NewItem288.png)

In this script, mytransform/2 refers to the second element of  mytransform (  1  ). 1 is the starting value, but is increased on every on-time event. Since this second element is an argument of the rotate transform, on every on-time event the rotation increases!

A side note is that the first box is a face of View dialect, while the second box is a command of the Draw dialect that creates a rectangle.

[&lt; Previous topic](http://helpin.red/Shapesub-dialect.html)                                                                                          [Next topic &gt;](http://helpin.red/Whatisinsystem.html)
