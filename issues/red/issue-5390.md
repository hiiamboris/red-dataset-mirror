
#5390: [Draw] Shapes fill is platform-dependent
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/5390>

**Describe the bug**

I was trying to understand how `shape` command works, as it's undocumented largely, and discovered that:
1. `move` command interrupts shape, dividing it into subshapes
2. `close` has to be applied to each subshape, it has no 'global' effect
3. no subshape is automatically closed, despite the docs saying 
   > shapes are automatically closed (no need to draw the last stroke back to start position)
4. all subshapes share their fill pen, I can't seem to paint them differently
5. painting behavior of subshapes is platform-dependent and can be considered undefined, namely:
   - on GTK last `fill-pen` sets the pen for the whole shape; previous/outside pen state and location of `fill-pen` command doesn't matter
   - on W10 in-shape `fill-pen` overrides the fill color for the whole shape, but does not enforce fill-or-not behavior for subshapes before it; so outside pen state strangely affects the filling

| W10 | GTK |
|-|-|
| ![](https://i.gyazo.com/a67f0a1c925332f6c4e74034e53f0690.gif) | ![](https://i.gyazo.com/ae4723b1c4a44150f351ae3191937b7b.gif) |


**To reproduce**

To reproduce the gifs above:
```
Red []

move: [
	'move 0x0
]
pen:  [
	fill-pen cyan
]
outer-pen: [fill-pen yello]
outline: [
	'line 50x0
	'line 50x50
	'line 0x50
	'line -50x0
	'line -50x-50
	'line 0x-50
]
segments: (length? outline) / 2
offsets: reactor [
	pen:  0
	move: 0
] 

view [
	across
	canvas: box 100x100 white react [
		shape: compose/deep [shape [(outline) close]]
		if outer/data [insert shape outer-pen]
		insert skip shape/shape offsets/move * 2 move
		insert skip shape/shape offsets/pen  * 2 pen
		face/draw: shape
	] text 200x150 font-size 8 react [face/text: mold canvas/draw] return
	outer: check "enable fill-pen yello outside?" return
	slider react [offsets/move: round/to face/data * segments 1]
	text 120 react [face/text: rejoin ["'move 0x0 at: " offsets/move]] return
	slider react [offsets/pen:  round/to face/data * (segments + 1) 1]
	text 120 react [face/text: rejoin ["fill-pen cyan at: " offsets/pen]]
]
```
To reproduce the (3) clause (same on W10 and GTK):
`view [box 100x100 draw [shape [fill-pen cyan move 30x0 'line -30x50 30x50 move 70x0 'line 30x50 -30x50]]]`
![](https://i.gyazo.com/56cfee06b7639fa79f8b7adca71e5a20.png)

**Expected behavior**

1. Consistent
2. Documented

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4999 date: 27-Sep-2023/10:17:47 commit: #6ddd85f793e2e5421fac0155ce500e2d5600026b ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------

-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-29T12:42:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5390#issuecomment-1740838148>

    If current *shape closing* behavior will be kept and docs will be updated, https://github.com/red/red/issues/3089 can be closed as done.

