
#1528: Changing window’s size has surprising results
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1528>

Changing window’s size is possible, but the results are not what you expect. Consider following code:

```
Red [
    Needs: 'View
]

win: layout [
    below
    button "Show/hide panel" [
        p/visible?: not p/visible?
        win/size/y: either p/visible? [win/size/y + 100] [win/size/y - 100]
        show win
    ]
    p: panel 200x100 [text "panel to hide"]
]
view win
```

When pressing the button, window size changes also horizontally (it should not) and the vertical change is bigger than expected.



