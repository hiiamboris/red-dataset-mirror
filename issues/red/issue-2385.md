
#2385: Draw command using text does not work correctly
================================================================================
Issue is closed, was reported by koba-yu and has 4 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/2385>

Please check the code below.
It seems text can not be drawn.

```
; this works. It shows a text on view.
view [ base draw [text 0x0 "test"] ]

; draw command with text seems to return empty image, not drawing a text.
i: make image! 50x50
i: draw i [text 0x0 "test"]
; == make image! [50x50 #{
;FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
;FFFFFFFFFFFFFF
view [base i ] ; just shows empty image

; box can be correctly drawn
i: draw i [box 0x0 10x10]
view [base i ]
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-29T09:20:18Z, meijeru, commented:
<https://github.com/red/red/issues/2385#issuecomment-269602465>

    This may be related to #2283 

--------------------------------------------------------------------------------

On 2017-02-18T03:38:24Z, qtxie, commented:
<https://github.com/red/red/issues/2385#issuecomment-280818775>

    Fixed in master branch.

