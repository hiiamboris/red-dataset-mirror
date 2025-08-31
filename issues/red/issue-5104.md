
#5104: Total mess of `over` events when using a box
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5104>

**Describe the bug**

Got a `box` covering another `base` face:
```
view [
    base green all-over on-over [print ['base event/offset]]
    at 0x0 box 150x150 on-over [print ['box event/offset]]
]
```
- `box` is not all-over, but it triggers events as if it was flagged so (W10 & GTK)
- events go into `base` even though pointer is outside of it (GTK only)

<img src=https://i.gyazo.com/0d9deab30c782f0bb57c1e870863129d.gif width=450></img>

**Expected behavior**

- `box` should not be `all-over`
- `box` is click-through (because fully transparent), so I don't think transparent parts should produce `over` events
- `base` should not get events when pointer is not above it

**Platform version**
```
Red 0.6.4 for Windows built 11-Mar-2022/2:40:53+03:00  commit #27f71f9
Red 0.6.4 for Linux built 15-Mar-2022/17:14:51+03:00  commit #af98e79
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-17T09:24:14Z, dockimbel, commented:
<https://github.com/red/red/issues/5104#issuecomment-1250036733>

    @qtxie 
    The commits above are destroying the dragging behavior in View. Try dragging in `%tests/view-test.red` or in the following example:
    
    ```
    Red []
    
    view [
    	size 400X400
    	pad 200x0
            scroll-bar: box 16x64 silver loose on-created [
    		face/extra: face/offset
    		append face/options compose [bounds: (object [
    			min: face/extra
    			max: min + 0x200
    		])]
    	]
    ]
    ```
    
    The mouse cursor should be allowed to leave the dragged face while continuing sending mouse movements to the dragged face. Eventually we could have an option for restricting the moving events to the face area only when needed, but the default should be to allow all moving events to be sent to the dragged face _regardless_ of the mouse cursor location.

--------------------------------------------------------------------------------

On 2022-09-17T12:11:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5104#issuecomment-1250060234>

    Fixed by commit: https://github.com/red/red/commit/3d300ec6b9a00ecf4e59da87c8c97a23de491469

