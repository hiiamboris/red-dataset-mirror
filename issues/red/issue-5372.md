
#5372: [View] Suspicious delay in syncing face appearance with its `draw` facet
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5372>

**Describe the bug**

![](https://i.gyazo.com/dc251c689cb43a5216ee8cd7bb6eab6b.gif)

This code looks correct, however produces this undesirable effect above:
```
view [
	origin 20x20 base white loose 100x100 react [
		face/draw: compose [
			fill-pen radial cyan magenta (70x70 - o: face/offset) 40
			box (30x30 - o) (110x110 - o)
		]
	]
]
```
I also tried (to the same effect):
```
view/no-sync [
	origin 20x20 base white loose 100x100 on-drag [
		face/draw: compose [
			fill-pen radial cyan magenta (70x70 - o: face/offset) 40
			box (30x30 - o) (110x110 - o)
		]
		show face/parent
	] on-created [face/actors/on-drag face event]
]
```

**To reproduce**

Run one of the snippets above and try dragging the `base` around using some pointing device.

**Expected behavior**

Gradient should remain stationary in the window as the face is dragged.
If it can't be synced, we need to know why and document it.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4940 date: 25-Aug-2023/1:07:38 commit: #10f54d613a1c78ab9f0638b0bc940f95330b5318 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-08-28T11:42:56Z, dockimbel, commented:
<https://github.com/red/red/issues/5372#issuecomment-1695547918>

    A simpler version (to show that it is not related to the gradient):
    
    ```
    view [
    	origin 20x20 base white loose 100x100 draw [
    		pen magenta
    		box 30x30 110x110
    	] react [
    		face/draw/4: 30x30   - face/offset
    		face/draw/5: 110x110 - face/offset
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2023-10-12T01:45:59Z, qtxie, commented:
<https://github.com/red/red/issues/5372#issuecomment-1758785376>

    Related issue: #5221

