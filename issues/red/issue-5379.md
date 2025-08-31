
#5379: [D2D] Radial gradient focus offset is wrong
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5379>

**Describe the bug**

According to the docs:
> The radial gradient will be painted **from focal point to the edge of a circle defined by center point and radius.** The start color will be painted in focal point and the end color will be painted in the edge of the circle.

There's no indication that focus should be relative to center. On GTK focus coordinates are absolute:
![](https://i.gyazo.com/53ff3e46e38b19dcd1f18280ecf7fe23.gif)

On Windows focus is relative to center however:
![](https://i.gyazo.com/fd191ecc50ca1da6cc5037df666b8199.gif)

**To reproduce**
```
Red []

view [
	base 200x200 white all-over on-over [
		face/draw: compose [
			pen black
			fill-pen radial
				cyan 0.0 magenta 1.0
				100x100 99 (event/offset)  
			circle 100x100 99
		]
	]
]
```
Hover the pointer above your base.

**Expected behavior**

Either focus should share coordinate system with center on Windows, or docs and GTK backend should be updated to make it relative to center.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4949 date: 1-Sep-2023/16:17:00 commit: #8fa47cf440b0af7eaf1c35fcf1903f7f1c074aa3 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-08T09:22:02Z, qtxie, commented:
<https://github.com/red/red/issues/5379#issuecomment-1711356318>

    We should make it the same as SVG does.

--------------------------------------------------------------------------------

On 2023-09-08T09:39:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/5379#issuecomment-1711378032>

    In SVG focus and center are expressed in the same units, so like in GTK.

