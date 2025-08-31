
#1833: Base's hot-zone has become the whole rectangle, including the transparent part, since last night.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/1833>

After you change the implementation of Base to use win8+ as default, the hotzone of base became the whole face. Try the following code.

``` red
red []

canvas: make face! [
    type: 'base
    offset: 0x0
    size: 100x100
    color: none
    draw: [ anti-alias on fill-pen off pen black line-width 5 line 0x0 100x100  ]
    actors: object [
        on-over: func [ face event ]  [
            either event/away? [
                face/draw/6: black
            ] [
                face/draw/6: red
            ]
        ]
    ]
]

view [
    main: panel 
    do [
        main/pane: reduce [ canvas ]
    ]
]
```



