
#5491: Using point2D! as SIZE for a TAB-PANEL makes its children not to be shown.
================================================================================
Issue is closed, was reported by luce80 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5491>

**Describe the bug**
If a `point2D!` is given as size to a `tab-panel` in VID, its children are not displayed on W10 or disappear when it is resized on W11.
Using a `pair!` gives no problem.

**To reproduce**
```
win: layout [
	tb: tab-panel (200, 200) [
		"t1" [
			below
			button "try"
			button "to"
			button "resize"
			button "the"
			button "window"
		]
		"t2" [box gray]
		"t3" [text "Hello"]
		"t3" [panel [check "true?"]]
	]
]

react compose [tb/size: win/size - (win/size - tb/size)]

view/flags win 'resize
```
If `200x200` is used instead of `(200, 200)` all is fine.

**Expected behavior**
Same behavior when using `pair!` or `point2D!` as size for a `tab-panel` in VID.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 22 date: 17-Feb-2024/7:32:56 commit: #58b8f8937178a1748df17841d0d8efdd169b7c50 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------```



