Original URL: <http://helpin.red/Eventmousepositionandkeypressed.html>

# Event! mouse position and key pressed

* * *

* * *

## Every time an event! happens on a face, you may get information about it from event/&lt;see list below&gt;.

## Mouse position:

## So, in the stripped-down example below, we print the event type and the mouse coordinates when the event happens, in this case, a mouse down (click) event:

Red \[needs: view]

view [

   base 100x100

   on-down [

               print event/type

               print event/offset

       ]

]

down  
39x57  
down  
86x43

## Key pressed:

## Interestingly, in the example above, you only get none!  if you try to print event/key, but in the example below, using on-key as event, you get not only the key pressed, but also the mouse coordinates. In fact, you get mouse coordinates from wherever the mouse is on the screen when the key is pressed, referenced to the upper left corner of the face.

Red \[needs: view]

view [

   area 100x100

   on-key [

               print event/type

               print event/offset

               print event/key

       ]

]

key  
\-59x84  
r  
key  
\-36x59  
s  
key  
\-116x79  
o

## Note that, in the example above, if we change area for base, we get no results on the console. However, this code works:

Red \[needs: view]

view \[base focus on-key \[probe event/key]]

## Here, focus seems to make the difference. Note that probe outputs a char!

## Another example:

Red \[needs: view]

view [canvas: base 150x80 "Press an arrow key" focus

       draw\[]

       on-key  [

        switch event/key

               [

               up \[canvas/text: "move up"]

               down \[canvas/text: "move down"]

               left \[canvas/text:  "move left"]

               right \[canvas/text:  "move right"]

               ]

       ]

]

![](http://helpin.red/lib/NewItem215.png)

## Here is a list of events taken from [Red's official documentation](https://doc.red-lang.org/en/view.html):

Field

Returned value

type

Event type (word!).

face

Face object where the event occurred (object!).

window

Window face where the event occured (object!).

offset

Offset of mouse cursor relative to the face object when the event occurred (pair!). For gestures events, returns the center point coordinates.

key

Key pressed (char! word!).

picked

New item selected in a face (integer! percent!). For a mouse downevent on a text-list, it returns the item index underneath the mouse or none. For wheel event, it returns the number of rotation steps. A positive value indicates that the wheel was rotated forward, away from the user; a negative value indicates that the wheel was rotated backward, toward the user. For menu event, it returns the corresponding menu ID (word!). For zooming gesture, it returns a percent value representing the relative increase/decrease. For other gestures, its value is system-dependent for now (Windows: ullArguments, field from [GESTUREINFO](https://msdn.microsoft.com/en-us/library/windows/desktop/dd353232%28v=vs.85%29.aspx)).

flags

Returns a list of one or more flags (see list below) (block!).

away?

Returns true if the mouse cursor exits the face boundaries (logic!). Applies only if over event is active.

down?

Returns true if the mouse left button was pressed (logic!).

mid-down?

Returns true if the mouse middle button was pressed (logic!).

alt-down?

Returns true if the mouse right button was pressed (logic!).

ctrl?

Returns true if the CTRL key was pressed (logic!).

shift?

Returns true if the SHIFT key was pressed (logic!).

[&lt; Previous topic](http://helpin.red/EventsandActors.html)                                                                                          [Next topic &gt;](http://helpin.red/Advancedtopics.html)
