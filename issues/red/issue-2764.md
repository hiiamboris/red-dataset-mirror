
#2764: [VID] Partial text in `BASE is not shown.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2764>

In the following code, partial text are not shown.
```Red
view [ 
    size 200x200 
    origin 0x0 
    panel 200x200 [ 
        origin 0x0 
        base 255.255.255.255 200x200 "Reusing your skills in all kind of programming tasks."
    ] 
    draw [ pen red line-width 5 box 0x0 200x200] 
]
```


