
#1809: Removing face on-drop will cause an error
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/1809>

``` Red
RED[]

view [
    size 400x400
    at 200x0 base 200x400 "drop garbage here to dispose"
    base 20x20 red loose on-drop [
        if face/offset/x > 200 [
            remove find face/parent/pane face
        ]
    ]
]
```

I got the following error:

```
Script error: path face/state/4: is not valid for none! type
Where: if
```



