
#1853: MOVEing a face to the tail of the same series will cause an error
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1853>

``` Red
red []

visual-obj: make face! [
    type: 'base
    offset: 50x50
    size: 200x80
    color: red
    options: [ drag-on: down]
    text: "drag me to make me on top"
    actors: object [
        on-down: func [ face [object!] event [event!] ] [
            move find canvas/pane face tail canvas/pane ; <--- Where the problem is
            'done
        ]
    ]
]

view [
    canvas: base 500x500 white "click here to create new object"
    on-down [
        append face/pane make visual-obj [ color: random white offset: random 500x500 ]
    ]
    do [
        canvas/pane: copy  [ ]
    ]
]
```

The error message is as follows

```
Script error: path none is not valid for none! type
Where: eval-set-path
```



