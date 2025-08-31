
#4813: [Draw] Crazy random 120px offset in `image` command
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4813>

**Describe the bug**

There should be no gray box on this image:
![](https://i.gyazo.com/227554eb46830842192f4f24a2bb5a27.gif)

What seemingly happens here is that `[image img]` paints image about 120px lower than it should. If you draw smth on the `img` you'll see it actually jumps down.

**To reproduce**

Code:
```
Red [needs: view]

img: draw 500x200 []
plot: []

view/no-wait [face: base 500x200]

forever [
	compose/deep/into [
		scale (face/size/x / img/size/x) (face/size/y / img/size/y) [image img]
		pen purple fill-pen cyan
		shape [move (face/size) line (face/size * 0x1) (plot) 'line (face/size * 0x1)]
	] clear b: []
	face/draw: b
	loop 10 [unless do-events/no-wait [break]]
	append plot as-pair (length? plot) (0.9 * face/size/y)
	if face/size/x < length? plot [clear plot]
	unless face/state [quit]
]
```
1. Run this code
2. Wait until the bar fills for at least 50-60% (even better wait until it resets)

I tried just extracting the draw code at the moments the bug happens and redrawing just that code - can't catch it this way.

I can reproduce this on both old GDI+ draw and new D2D.
I cannot reproduce this if console (CLI/GUI) was compiled with `-d` flag.

**Expected behavior**

No jumping gray area.

**Platform version**
```
Red 0.6.4 for Windows built 28-Jan-2021/14:26:17+03:00 commit #bae0c34
```



