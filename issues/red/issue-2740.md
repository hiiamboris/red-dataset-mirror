
#2740: WISH: in DRAW, the 2nd argument of CIRCLE can be pair!.
================================================================================
Issue is open, was reported by JenniferLee520 and has 2 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/2740>

In the DRAW dialect, when we draw ellipse using the CIRCLE command, it takes 3 arguments. I would like the 2nd and the 3rd arguments can be combined to a pair!. so I can do not only this:
```Red
CIRCLE 50x50 30 40
```
but also this:
```Red
CIRCLE 50x50 30x40
```


Comments:
--------------------------------------------------------------------------------

On 2020-08-14T16:46:21Z, 9214, commented:
<https://github.com/red/red/issues/2740#issuecomment-674163580>

    Should be addressed as a part of https://github.com/red/red/issues/1434 I think.

