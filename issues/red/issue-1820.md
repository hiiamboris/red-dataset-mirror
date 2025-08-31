
#1820: There is a loop to break, but the Red interpreter doesn't think so.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1820>

``` Red
red [ ]

dummy: func [ ] [
    true
]

view [
    canvas: base 500x500
    do [
        canvas/pane: reduce [
            make face! [
                type: 'base
                offset: 0x0
                size: 300x20
                color: green
                text: "Drag Me! and check the console message"
                options: [ drag-on: down ]
                actors: object [
                    on-drag-start: func [ face [object!] event [event!] /local f] [
                        foreach f face/parent/pane [
                            if all [ dummy ] [
                                break
                            ]
                        ] 
                    ]
                ]               
            ] 
        ]
    ]   
]
```

and I got this message:

```
Throw error: no loop to break
Where: break
```



