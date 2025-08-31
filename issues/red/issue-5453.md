
#5453: [GTK, View] No move/moving/resize events when maximized
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5453>

**Describe the bug**

When maximizing the window I get `resizing` event but no `resize`,`move` or `moving`. One of the `resizing` events reports wrong size. These events get repeated every time window is activated.

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
2. Maximize the window
3. See the output, which (omitting on-creation events) is:
```
type= resizing  window= (860, 0) 1966x1066      event/offset= 1966x1066    <- 46px bigger than the screen!
type= resizing  window= (860, 0) 1920x1020      event/offset= 1920x1020
```
4. Switch from and back to the window
5. See new output, even though there was no resizing, which repeats on every activation:
```
type= resizing  window= (860, 0) 1920x1020      event/offset= 1920x1020
type= resize    window= (860, 0) 1920x1020      event/offset= 1920x1020
```
6. Try just normally moving the window
7. There are no `move` or `moving` events generated

**Expected behavior**

1. I think there should be `resize` and `move` events, but not the other two, when maximized?
2. Normal moving should generate `moving` and `move` events
3. /offset should only report the final (correct) value
4. Window activation should not produce sizing events

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5063 date: 23-Nov-2023/9:52:23 commit: #e286183ea4239f00b96e850476dfa1e9dd635df6 ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-12-30T18:34:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5453#issuecomment-1872580438>

    Related https://github.com/red/red/issues/5452

