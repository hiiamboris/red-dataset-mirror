
#2747: [DRAW] Using gradient pen will make fill-pen stop working
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.wish] [GUI]
<https://github.com/red/red/issues/2747>

```Red
view [ 
    box white 100x100 draw [ 
        line-width 15 
        fill-pen yellow  ; <==== not working
        pen linear red 30.0 green 30.0 blue 30.0 0x0 100x100 
        circle 50x50 40 20
    ] 
]
```
This bug is both on Windows and macOS.


Comments:
--------------------------------------------------------------------------------

On 2017-06-19T07:31:47Z, qtxie, commented:
<https://github.com/red/red/issues/2747#issuecomment-309361013>

    Fixed it on Windows. For macOS, will be fixed by this issue #2746 

