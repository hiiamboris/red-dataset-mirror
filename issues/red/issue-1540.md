
#1540: REACT does not work when followed by PANEL
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1540>

This code works:

```
win: layout [
    s: slider
    text "0" left bold react [face/text: form s/data]
    text "Something else"
]

view win
```

But when we put the last TEXT in PANEL, REACT stops working:

```
win: layout [
    s: slider
    text "0" left bold react [face/text: form s/data]
    panel [
        text "Something else"
    ]
]

view win
```



Comments:
--------------------------------------------------------------------------------

On 2016-01-18T10:36:23Z, rebolek, commented:
<https://github.com/red/red/issues/1540#issuecomment-172493135>

    Note: REACT does not have to be followed by PANEL immediately to trigger this bug:
    
    ```
    win: layout [
        s: slider
        text "0" left bold react [face/text: form s/data]
        text "bug?"
        panel [
            text "Something else"
        ]
    ]
    
    view win
    ```
    
    This code also shows the problem.

