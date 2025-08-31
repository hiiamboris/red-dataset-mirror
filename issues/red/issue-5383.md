
#5383: [Draw] `box` rounding behavior is undocumented and not cross platform
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/5383>

**Describe the bug**

| corner value | D2D | GTK | Comment |
|-|-|-|-|
| 0 | ![](https://i.gyazo.com/5878906bc266dcde1ce7cfacfdc6b9e9.png) | ![](https://i.gyazo.com/c6fd8c719356792c28fa2dd74c497306.png) | Expected no difference, since none is documented |
| 1 | ![](https://i.gyazo.com/a8fbf034550636af3eceaff3d8c05a9f.png) | ![](https://i.gyazo.com/9d1d54644931c681ed538a9db43e6ea3.png) | Expected 1px rounding, not 15 |

**To reproduce**

```
view [
	box 400x400 draw [
		line-width 30 line-join miter
		box 30x30  370x70
		box 30x130 370x170 0		;) set last value to 0 or 1 as in the table
	]
]
```


**Expected behavior**

I guess it is platform limitation that rounding cannot be smaller than half line width?
In this case I propose unifying cross-platform behavior and documenting it.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4950 date: 2-Sep-2023/9:39:49 commit: #004d71b71ff3e82c9ad3e199860c61adee158223 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------

-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-10T22:02:17Z, qtxie, commented:
<https://github.com/red/red/issues/5383#issuecomment-1712951484>

    > `<corner>       : (optional) radius of the arc used to draw a round corner (integer!).`
    
    I guess the radius unit is not in `px`. It's related to the pen width. When it's zero, it should no rounding. So it's correct on GTK.

--------------------------------------------------------------------------------

On 2023-09-11T11:30:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5383#issuecomment-1713694568>

    In pixels, just ignores the line join:
    ![](https://i.gyazo.com/3e152ea18289f206fe8a7219e07f7c41.gif)
    `view [below s: slider 200 box 200x200 react [face/draw: compose [line-width 8 box 5x5 195x195 (100 * s/data)]]]`
    
    Notice btw some line thinning at small radii. Must be a driver glitch.

