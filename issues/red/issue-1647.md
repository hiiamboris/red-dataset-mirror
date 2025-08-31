
#1647: resize issue D
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1647>

In the following code, "resized window" is printed when the window is resized by dragging the edges, but not when clicking the maximize button. Is this expected?

```
view/options/flags [text "Hello, World!"][
    actors: object [
        on-size: func [face [object!] event [event!]][
            print "resized window"
        ]
    ]
][resize]
```

This code works when resizing both ways:

```
view/options/flags [text "Hello, World!"][
    actors: object [
        on-resizing: func [face [object!] event [event!]][
            print "resizing window"
        ]
    ]
][resize]
```

Same on Windows XP and Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2016-02-18T09:28:28Z, WiseGenius, commented:
<https://github.com/red/red/issues/1647#issuecomment-185624996>

    In the first example code above, `on-resize` needs to be used instead of `on-size`, since [it was normalized](https://github.com/red/red/commit/b3de9cb8863d32712a485ddd727721a24b700950).
    
    Here's a more visual example anyway:
    
    ```
    view/options/flags [a: area "Hello, World!"][
        actors: object [
            on-resize: func [face [object!] event [event!]][
                a/size: face/size - 20
            ]
        ]
    ][resize]
    ```
    
    To compare with:
    
    ```
    view/options/flags [a: area "Hello, World!"][
        actors: object [
            on-resizing: func [face [object!] event [event!]][
                a/size: face/size - 20
            ]
        ]
    ][resize]
    ```

--------------------------------------------------------------------------------

On 2016-02-22T12:50:06Z, WiseGenius, commented:
<https://github.com/red/red/issues/1647#issuecomment-187157510>

    Now it's the second example which isn't updated by maximize since around the same time as #1657, so it's probably that issue.
    
    ```
    view/options/flags [a: area "Hello, World!"][
        actors: object [
            on-resizing: func [face [object!] event [event!]][
                a/size: face/size - 20
            ]
        ]
    ][resize]
    ```

