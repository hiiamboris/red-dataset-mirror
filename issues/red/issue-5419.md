
#5419: [View] Pointer lock is lost when `move` is used while dragging
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5419>

**Describe the bug**

`move` action has a strange effect: dragging was supposed to track the pointer even when it leaves the face, but it doesn't:
![](https://i.gyazo.com/daac93ded76f6297dd2a28f880984ce4.gif)

**To reproduce**

1. Run this script
   ```
   Red []

   view [
    size 300x300
	base wrap magenta yellow "loses contact when pointer leaves the base" 100x100 with [
        options: compose [
            drag-on: down
            bounds: (object [min: 10x10 max: 10x190])
        ]
    ] on-down [
		move p: face/parent/pane tail p
	]
   ]
   ```

2. Click and drag the face
3. Observe that it stops moving when pointer gets off it

**Expected behavior**

Without `move` it works correctly: keeps moving even when pointer is off it

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5037 date: 30-Oct-2023/8:45:38 commit: #377b5ed3f38a7eb027243c70b68061f5c9fe8f99 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-04T18:51:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/5419#issuecomment-1793522250>

    Thematically relevant https://github.com/red/red/issues/1463

