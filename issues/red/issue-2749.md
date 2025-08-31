
#2749: [Shape] WISH: default "current position"
================================================================================
Issue is open, was reported by JenniferLee520 and has 0 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/2749>

According to the document in View/Draw/Shape, 
> each drawing command starts from the current pen position.

In the following code (on macOS),
```Red
view [ box white 100x100 draw [ fill-pen yellow shape [ line 20x80 80x20 30x90] ] ]
```
I learned that there is no **default** current position, so I got this error message

```
CGContextAddLineToPoint: no current point
```

Should we make 0x0 the default current position?


