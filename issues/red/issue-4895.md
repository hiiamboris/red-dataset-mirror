
#4895: [Draw] Shadow does not tolerate translation & scaling
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4895>

**Describe the bug**

I know it's probably a WIP, but still has to be fixed one day.

| ![](https://i.gyazo.com/2d0ef78f7b86a3989b1fe8b62c277a69.gif) | ![](https://i.gyazo.com/ba6c4e276ba5da9694c118e30294ede3.gif) | ![](https://i.gyazo.com/8a58023addc9f7912fa75237ceaa9d32.gif) |
| - | - | - |

1. Translation destroys box frame and compresses the box itself
2. Scaling when > 1, destroys lower right part of the frame

**To reproduce**
```
Red [needs: view]

redraw: does [
	b/draw: compose/deep [
		translate (load t/text) [
			scale (load s/text) (load s/text) [
				line-width 2
				; fill-pen off
				fill-pen yellow
				pen magenta
				shadow 3x5 2 0 (cyan)
				box 50x50 150x150
			]
		]
	]
]
view [
	b: base 200x200 purple 
	return text 100 "translation:" t: field "0x0" react [face/text redraw]
	return text 100 "scale:"       s: field "1.0" react [face/text redraw]
]
```

**Expected behavior**

1. Box frame visible
2. Box is undistorted

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-05-10T09:48:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4895#issuecomment-836484149>

    Another issue is that `shadow` does not accept colors in word form (only tuple)

