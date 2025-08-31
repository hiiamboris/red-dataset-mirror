
#4769: [DRAW] Quadratic bezier curve is not one
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/4769>

**Describe the bug**

Quadratic bezier curve is well-defined geometric form and should be precise. However, it's a mess:
| Windows (D2D) | Windows (master) | GTK | Mac |
|---|---|---|---|
| ![](https://i.gyazo.com/0ea9ec25abda215080b02063bbf60e19.png) | ![](https://i.gyazo.com/05190fc7db7a27c656b5903c5df6e524.png) |  ![](https://i.gyazo.com/e02f5211e27ea709c107a8ded36e059c.png) | ![](https://i.gyazo.com/4d813e7de949823be7f05a4e91823afa.png) |

As can be observed, the curve goes waywards, esp. on GTK.

**To reproduce**

Use this code (modify `pt` as needed):
```
Red []

pt: [0x50 250x50 200x250]

lns: collect [repeat i 9 [
	keep reduce [
		'line (10 - i * pt/1) + (i * pt/2) / 10
		      (10 - i * pt/2) + (i * pt/3) / 10
	]
]]
view compose/deep [
	box 300x300 draw [
		pen red triangle (pt) (lns)
		pen black shape [move (pt/1) qcurve (pt/2) (pt/3)]
	]
]
```

**Expected behavior**

https://en.wikipedia.org/wiki/Bézier_curve#Quadratic_Bézier_curves got pictures
D2D and Mac draw a correct curve.

**Platform version**
```
Red 0.6.4 for Windows built 4-Dec-2020/7:41:48+03:00 commit #382dd4e
```



