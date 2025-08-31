
#2746: [macOS DRAW] linear pen gradient doesn't work
================================================================================
Issue is open, was reported by JenniferLee520 and has 0 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/2746>

```Red
view [ box white 100x100 draw [ line-width 15 pen linear red 30.0 green 30.0 blue 30.0 0x0 100x100 circle 50x50 40 20] ]
```
This bug is only on macOS.


