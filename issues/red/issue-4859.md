
#4859: [Draw] Odd behavior of empty CLIP region
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/4859>

**Describe the bug**

Somehow zero-sized clipping region behaves like a non-empty box with rotated corners:
![](https://i.gyazo.com/45f1fe18d60649d5cc82c95a149e7f48.gif)

If clip window is set to nonzero size - everything's OK.
GTK works exactly like W10 - i.e. buggy too.
Pre-D2D version doesn't show anything at all no matter how big clipping region I set.

**To reproduce**

Use this script to play:
```
view [
	base 200x200 white draw [a: rotate 0 100x100 g: clip 0x99 200x101 w: line-width 20 pen red box 10x100 190x100]
	return panel 3 [
		text "rotation angle" slider react [t1/data: a/2: 90 * face/data] t1: text
		text "line width"     slider react [t2/data: w/2: to 1 50 * face/data] t2: text
		text "gap width"      slider react [t3/data: 2 * n: to 1 25 * face/data g/2: 0x100 - (n * 0x1) g/3: 200x100 + (n * 0x1)] t3: text
	]
]
```
Or snapshot for testing:
```
view [base 200x200 white draw  [rotate 30 100x100 clip 0x100 200x100 line-width 30 pen red box 10x100 190x100]]
```
which looks like:
![](https://i.gyazo.com/076a5b911ce241268b00d4f7f15e0b78.png)

For some reason `draw` function properly draws nothing using the same command:
`? (draw 200x200 [rotate 30 100x100 clip 0x100 200x100 line-width 30 pen red box 10x100 190x100])`
So the bug appears on faces only.

**Expected behavior**

Nothing drawn if clipping region is empty.

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-23T08:28:46Z, qtxie, commented:
<https://github.com/red/red/issues/4859#issuecomment-804715615>

    Is the CLIP region a line for `clip 0x100 200x100`? Don't know how the OS API works internally, seems `clip 0x100 0x100` is for empty CLIP region. (or a dot region? ;-) )

--------------------------------------------------------------------------------

On 2021-03-23T08:43:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/4859#issuecomment-804723647>

    I think it should be empty, because 100-101 and 99-100 (and 100-99 and 101-100) seem to work as single pixel wide regions (:
    That would be consistent with what other commands produce.

