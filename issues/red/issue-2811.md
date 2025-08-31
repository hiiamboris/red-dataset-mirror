
#2811: [macOS Draw] 'Clip a 'Shape
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/2811>

Using a shape as a clipping region is not working.
```Red
view [
    origin 0x0
    box 450x450 white
        draw [
            clip [
                move 360x20
                arc 380x40 20 20 90 sweep
                vline 180 
                line 430x200 380x220 
                vline 360 
                arc 360x380 20 20 90 sweep
                'hline -320 
                arc 20x360 20 20 90 sweep 
                'vline -320 
                arc 40x20 20 20 90 sweep 
                hline 360 
            ]
            fill-pen red
            box 0x0 450x450
        ]
]
```
This bug is on macOS only.


Comments:
--------------------------------------------------------------------------------

On 2017-06-15T04:16:23Z, qtxie, commented:
<https://github.com/red/red/issues/2811#issuecomment-308624061>

    It has not been implemented yet on macOS.

