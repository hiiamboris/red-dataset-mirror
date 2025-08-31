
#2800: [Draw] Changing the pen color and line-width in shape will affect the original Draw setting.
================================================================================
Issue is open, was reported by JenniferLee520 and has 12 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/2800>

In the following code, I draw a line in red color first, then a triangle shape in blue color, then draw a circle in draw. The circle should be in red color.

```Red
view [
    box 400x400 white 
        draw [
            pen red
            line 10x10 50x50   ; <== Line
            shape [ ; <=== Triangle
                pen blue     
                move 130x130
                line 180x80 0x80
            ] 
            circle 200x200 50  ; < ==== Circle
        ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-12T09:46:30Z, geekyi, commented:
<https://github.com/red/red/issues/2800#issuecomment-307741655>

    So you want `shape` have it's own color settings?
    Is this the same as it works in Rebol2? (I'll try to test this later)
    
    Btw, Red works the same way it works in html5 `<canvas>`
    It does have a setting there to store global state and retrieve it: [CanvasRenderingContext2D.save()](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/save)
    
    The wish in general (I feel) is about wanting a 
    - *retained mode* (svg, graph of objects)
    
    instead  of 
    - *immediate mode* (canvas, opengl, real-time paint) graphics

--------------------------------------------------------------------------------

On 2017-06-12T16:03:30Z, greggirwin, commented:
<https://github.com/red/red/issues/2800#issuecomment-307835609>

    I thought `push` would do it, but it seems not:
    ```
    view [
        box 400x400 white 
            draw [
                pen red
                line 10x10 50x50   ; <== Line
                push [
                    shape [ ; <=== Triangle
                        pen blue     
                        move 130x130
                        line 180x80 0x80
                    ] 
                ]
                circle 200x200 50  ; < ==== Circle
            ]
    ]
    ```
    I haven't used it before, so may be missing something. It doesn't like `push` at all inside `shape`.
    ```
    *** Script Error: invalid Draw dialect input at: [push [pen blue move 130x130 line 180x80 0x80]]
    *** Where: ???
    ```

--------------------------------------------------------------------------------

On 2017-06-19T02:02:31Z, qtxie, commented:
<https://github.com/red/red/issues/2800#issuecomment-309321250>

    @greggirwin There is a bug in `push` on Windows. It works on macOS. 
    Maybe we should let the user to do the `push` if he want instead of forcing a `push`.  What do you think? @JenniferLee520 @dockimbel 

--------------------------------------------------------------------------------

On 2017-07-28T17:20:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2800#issuecomment-318712804>

    @qtxie 
    > Maybe we should let the user to do the push if he want instead of forcing a push.
    
    But you said `push` has a bug??

--------------------------------------------------------------------------------

On 2017-07-29T01:10:20Z, qtxie, commented:
<https://github.com/red/red/issues/2800#issuecomment-318793277>

    @dockimbel Already fixed.

--------------------------------------------------------------------------------

On 2017-07-29T03:31:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2800#issuecomment-318800865>

    @qtxie Good. Then we can do an implicit `push` when entering a Shape block? Saving/restoring the matrix should be the default when going from Draw to Shape and back.

