
#5454: [View] Discrepancy in sizing events coming from different sources
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5454>

**Describe the bug**

When I resize window by dragging, value reported by `event/offset` is already set to `window/size` (https://github.com/red/red/issues/4355).
When I resize window by maximizing it, value reported by `event/offset` is not yet set to `window/size`.

**To reproduce**

1. Run this:
```
Red [needs: view]

on-event: function [window event] [
	print [
		"type=" event/type
		"^-window=" window/offset window/size
		"^-event/offset=" event/offset
	]
]
view/flags [
	size 200x200
	on-resize :on-event on-resizing :on-event
	on-move   :on-event on-moving   :on-event
] 'resize
```
2. Try resizing window by dragging the border of by choosing `Size` option from system menu.
3. Observe that `window/size` always equals to `event/offset`:
```
type= resizing  window= (540, 260) 200x200      event/offset= 200x200
type= resizing  window= (540, 260) 200x200      event/offset= 200x200
type= resizing  window= (540, 260) 210x200      event/offset= 210x200
type= resize    window= (540, 260) 210x200      event/offset= 210x200
type= resize    window= (540, 260) 210x200      event/offset= 210x200
```
4. Resize window with Win+Up/Win+Right/Win+Left
5. Observe the first event reporting `window/size` unequal to `event/offset`:
```
type= resize    window= (640, 0) 200x200        event/offset= 625x642
type= resize    window= (640, 0) 625x642        event/offset= 625x642
```

**Expected behavior**

Consistency of events behavior.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5076 date: 30-Dec-2023/14:13:04 commit: #f8f255970835423b7be5c0c34f5fa697a0002233 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```
On GTK see https://github.com/red/red/issues/5453 - `event/offset` and `window/size` are currently also synced there, but a lot of events a missing.


