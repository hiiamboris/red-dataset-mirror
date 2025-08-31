
#1633: Font size problem
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1633>

I have two AREAs. they share the same Font object with color and size definations. When I remove an Area from its parent (a panel) and then add it back to the panel (for z-order thing), the other AREA's font size is changed somehow, but the color is still the OK. I am using Windows 10.

``` Red
Red [
    Needs:   'View
]

font1: make font! [
    color: red
    size: 16
]

view [ 
    size 800x500
    below 
    canvas: panel 400x100
    text yellow "type in something in the above two areas, then click here (yellow box) again and again to see the bug"
    on-down [
        obj: first canvas/pane
        remove canvas/pane 
        append canvas/pane obj
    ]

    do [
        canvas/pane: reduce [
            make face! [
                type: 'area
                font: font1
                offset:  0x0
                size: 100x50
            ]           
            make face! [
                type: 'area
                font: font1
                offset:  200x0 
                size: 100x50
            ]           
        ]
    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-17T09:43:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1633#issuecomment-185121493>

    I can reproduce the issue on Windows 7.

