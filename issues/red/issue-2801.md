
#2801: [Shape] When 'Arc is used as part of a shape, it's a mess.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2801>

I am trying to make a rounded rectangle using Shape. On macOS, When 'Arc is used in a shape, the last stroke of the shape is always a line linked to the first point of the last arc. Which is wrong.
```Red
view [
    origin 0x0
    box 400x400 white 
        draw [
            shape [ 
                fill-pen yellow
                move 360x20
                arc 380x40 20 20 90 sweep
                line 380x360 
                arc 360x380 20 20 90 sweep
                line 40x380 
                arc 20x360 20 20 90 sweep 
                line 20x40 
                arc 40x20 20 20 90 sweep 
                line 360x20 
            ] 
        ]
]
```
On Windows 10, 'Arc cannot be used at all. Nothing will be shown.


