Original URL: <http://helpin.red/EventsandActors.html>

# Events and Actors

* * *

* * *

## Events:

Mouse clicking, mouse hovering, key pressing etc., are events that you may want to associate with code. We saw on last chapter that there is something called action facet that executes code triggered by a default event. You can add more blocks of code associated with events by following this layout:

![](http://helpin.red/lib/eventlayout.png)

There is an extensive list of possible events in the [documentation](https://doc.red-lang.org/en/view.html#_events). I copied it at the end of this chapter for reference.

Each face accepts a set of events, i.e. not all events apply to all faces.

I made a short set of examples. I see no point in giving examples of each existing event, since the logic is the same:

down - left mouse button pressed; 

over - mouse cursor passing over a face;

Red \[needs: view]

view [

       t: area 40x40 blue

       on-down \[quit]

       on-over \[either t/color = red \[t/color: blue]\[t/color: red]]

]

wheel - mouse wheel being turned;

Red \[needs: view]

list: \["first" "second" "third" "fourth"]

view [

       t: text "Place your cursor over here and roll the wheel"

               on-wheel [

                       t/text: first list

                       list: next list

                       if tail? list \[list: head list]

               ]                

]

key-down - a key has been pressed;

Red \[needs: view]

list: \["key" "another key" "one more key"]

view [

       below

       text "Click inside field and press a key"

       t: text 100

       a: field

               on-key-down [

                       t/text: first list

                       list: next list

                       if tail? list \[list: head list]

               ]

]

![](http://helpin.red/lib/NewItem47.png)

time - the delay set by face’s  rate facet expired.

The following example "blinks" a text at a 1 second rate (see rate in chapter [GUI- Advanced topics](http://helpin.red/Advancedtopics.html)):

Red \[needs: view]

view [

       t: text "Now you see..." rate 1

               on-time \[either t/text = "" \[t/text: "Now you see..."]\[t/text: ""]]

]

close - this is a window event: the window was closed. Very useful to include code to be executed when the user quits (closes the window).

Red \[needs: view]

view [

       on-close \[print "bye!"]        

       button \[print "click"]

]

### Actors

Actors is the name of the event handling functions in Red. That is, the code inside the block after on-&lt;event&gt; . So why not call them just event handlers like most other language do? I think is because they are an object inside the face as you can see if you run this code below and click on the area face:

Red \[Needs: view]

view [

       t: area 40x40 blue on-down \[print t] ;click to quit

       on-over \[either t/color = red \[t/color: blue]\[t/color: red]]

]

You will see in the console, nearly at the end of the print, an object with the actors described:

(...)

edge: none

para: none

font: none

actors: make object! [

   on-down: func \[face \[object!] event \[event! none!]]\[print t]

   on-over: func \[face \[object!] event \[event! none!]]\[either t/color = red \[t/color: blue] \[t/color: red]]

]

extra: none

draw: none

(...)

on-create actor:

In addition to the GUI events, it is possible to define an on-create actor which will be called when the face is shown for the first time, just before system resources are allocated for it. Unlike other actors, on-create has only one argument, face.

#### Full list of event names:

Name

Input type

Cause

down

mouse

Left mouse button pressed.

up

mouse

Left mouse button released.

mid‑down

mouse

Middle mouse button pressed.

mid‑up

mouse

Middle mouse button released.

alt‑down

mouse

Right mouse button pressed.

alt‑up

mouse

Right mouse button released.

aux‑down

mouse

Auxiliary mouse button pressed.

aux‑up

mouse

Auxiliary mouse button released.

drag‑start

mouse

A face dragging starts.

drag

mouse

A face is being dragged.

drop

mouse

A dragged face has been dropped.

click

mouse

Left mouse click (button widgets only).

dbl‑click

mouse

Left mouse double-click.

over

mouse

Mouse cursor passing over a face. This event is produced once when the mouse enters the face and once when it exits. If flags facet contains all‑over flag, then all intermediary events are produced too.

move

mouse

A window has moved.

resize

mouse

A window has been resized.

moving

mouse

A window is being moved.

resizing

mouse

A window is being resized.

wheel

mouse

The mouse wheel is being moved.

zoom

touch

A zooming gesture (pinching) has been recognized.

pan

touch

A panning gesture (sweeping) has been recognized.

rotate

touch

A rotating gesture has been recognized.

two‑tap

touch

A double tapping gesture has been recognized.

press‑tap

touch

A press-and-tap gesture has been recognized.

key‑down

keyboard

A key is pressed down.

key

keyboard

A character was input or a special key has been pressed (except control; shift and menu keys).

key‑up

keyboard

A pressed key is released.

enter

keyboard

Enter key is pressed down.

focus

any

A face just got the focus.

unfocus

any

A face just lost the focus.

select

any

A selection is made in a face with multiple choices.

change

any

A change occurred in a face accepting user inputs (text input or selection in a list).

menu

any

A menu entry is picked.

close

any

A window is closing.

time

timer

The delay set by face’s rate facet expired.

Notes:

- touch events are not available for Windows XP.+
- One or more moving events always precedes a move one.
- One or more resizing events always precedes a resize one.

[&lt; Previous topic](http://helpin.red/Faces.html)                                                                                          [Next topic &gt;](http://helpin.red/Eventmousepositionandkeypressed.html)
