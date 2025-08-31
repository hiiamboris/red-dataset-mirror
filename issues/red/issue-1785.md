
#1785: Crash when executing 'show face' within 'on-down' event
================================================================================
Issue is closed, was reported by Zamlox and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/1785>

Following script will crash the console:

```
Red []

rect: object [
    offset: 100x0
    size:   20x20
]
generate-draw: does [
    compose [
        pen black fill-pen black box (rect/offset) (rect/offset + rect/size)
    ]
]
content: compose/deep [
    base 200x20
    draw
] 
append/only content generate-draw
append content [
    on-down [
        prin "event/offset: " probe event/offset prin "rect/offset: " probe rect/offset
        if event/offset/x < rect/offset/x [
            rect/offset/x:  rect/offset/x - 50
            face/draw/6:    rect/offset
            face/draw/7:    rect/offset + rect/size
            show face
        ]
        if event/offset/x > rect/offset/x [
            rect/offset/x:  rect/offset/x + 50
            face/draw/6:    rect/offset
            face/draw/7:    rect/offset + rect/size
            show face
        ]
    ]
]

view layout content
```

When clicking on left side of black box (but on the gray area) within a distance less then 50pixels, the console will crash. Not the same happens when clicking on right side.



Comments:
--------------------------------------------------------------------------------

On 2016-04-08T15:13:41Z, Zamlox, commented:
<https://github.com/red/red/issues/1785#issuecomment-207472795>

    Additional info:
    When crash happens the 'pane/node' data inside 'update-z-order' function becomes 'null' and 'GET_BUFFER(pane)' will try to access 'pane/node/value' which will cause the crash.

--------------------------------------------------------------------------------

On 2016-04-20T11:23:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1785#issuecomment-212386548>

    The root cause is the temporary buffer `object/path-parent` used for path resolution not being cleaned up properly by compiled code using it, leaving it in wrong state when the interpreter resolves an object path, leading, in this case, to wrong firing of object events, later causing various memory corruptions, usually resulting in a crash.

