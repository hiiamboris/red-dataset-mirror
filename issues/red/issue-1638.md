
#1638: Dragging events should be sent to the face where the mouse button is pressed, even though the mouse cursor is not over its territory.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/1638>

For Most GUI system's design, Dragging events should be sent to the face where the mouse button is pressed in the first place, even though the mouse cursor is not over its territory any more. I don't mean "on-drag" actor in a face with the "drag-on" option here. I mean "on-over" actor in a face with "all-over" flag. 

Try the following code. Press mouse on Red Panel, keep the mouse button pressed and move the mouse cursor to the Green Panel. The printed messages shows that all the events are sent to Green Panel now. It's not right.

However, If the two Panels are replaced by two Bases, this bug does not exist.

``` Red
Red [
    Needs:   'View
]

view [ 
    size 800x500
    red-obj: panel red 100x100 
        on-over [
            print ["Red" event/offset]
        ]
    green-obj: panel green 100x100 
        on-over [
            print ["Green" event/offset]
        ]
    do [
        red-obj/flags: [ all-over ]
        green-obj/flags: 'all-over
    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-16T22:14:02Z, endo64, commented:
<https://github.com/red/red/issues/1638#issuecomment-454964307>

    This works as expected and issue can be closed, @greggirwin 
    Tested on `Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10`

