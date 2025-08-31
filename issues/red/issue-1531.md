
#1531: Newly opened window has offset 0x0 and controls are out of screen
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1531>

If I create new layout and open it with `show`, window is displayed in top-left corner and controls are not visible, so I’m not able to move the window. Setting offset manually before show solves this but it would be nice if this was done automatically.

Example code:

```
win: layout [
    below
    button "Open window" [
        show layout [
            text "new window"
        ]
    ]
]
view win
```



Comments:
--------------------------------------------------------------------------------

On 2016-01-15T10:25:09Z, dockimbel, commented:
<https://github.com/red/red/issues/1531#issuecomment-171927201>

    You should be using `view` and not `show` to open a new window, as `show` is low-level and won't do any pre-processing for you.

