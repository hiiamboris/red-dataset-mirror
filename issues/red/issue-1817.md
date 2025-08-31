
#1817: Child won't move with its parent when the child has transparency.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/1817>

Run the following code. when dragging the green parent, the child ( a triangle ) won't move and can be outside of its parent. 

``` Red
RED [ ]

triangle: make face! [ 
    type: 'base
    size: 10x10
    offset: 335x10
    draw: [ fill-pen gray pen gray triangle 0x1 9x5 0x8  ]
]


Item: make face! [ 
    type: 'base
    offset: 100x100
    size: 350x30 
    color: green 
    text: "Drag Me! The child (triangle) won't move together. :-( "
    options: [ drag-on: down ]
    pane: reduce [ triangle ]
]

view [
    canvas: base 750x650 240.240.240
    do [ 
        canvas/pane: reduce [
            make item [] 
        ]
    ]
]
```



