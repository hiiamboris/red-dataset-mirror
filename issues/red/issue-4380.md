
#4380: [View] [Regression] Mouse over started skipping the 1st event
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4380>

Worked in Feb 27, 2020 build. In Mar 18, 2020 already broken.

**Describe the bug**

For some reason Red does not detect first mouse-entered-the-face event, it now needs 2 of those.

**To reproduce**

Compile & run the script below. It simulates mouse hovering over the base then jumping off it to the left top corner of the screen (3 times). (tip: events not followed by `flush` won't be registered)
```
Red [needs: view]

#system [
	#import [
		"user32.dll" stdcall [
			mouse_event: "mouse_event" [
				dwFlags		[integer!]
				dx			[integer!]
				dy			[integer!]
				dwData		[integer!]					;-- for wheel, and buttons 3-4
				dwExtraInfo	[pointer! [float64!]]		;-- points to ULONG (uint64); unused
			]
		]
	]
]

mouse_event*: routine [x [integer!] y [integer!] flags [integer!] "mouseeventf_* mask" data [integer!]] [
	mouse_event flags x y data null
]

MOUSEEVENTF_ABSOLUTE:		8000h
MOUSEEVENTF_MOVE:			0001h

move-to: function [xy [pair!]] [
	scr: system/view/screens/1/size
	x: to integer! round 0.5 + xy/x / scr/x * 65535
	y: to integer! round 0.5 + xy/y / scr/y * 65535
	mouse_event* x y MOUSEEVENTF_MOVE + MOUSEEVENTF_ABSOLUTE 0
	wait 0.2			;-- only for the eyes ;)
]

flush: does [loop 30 [do-events/no-wait]]

redo: does [
	print "REDO"
	move-to v/offset + b/offset + 40
	flush
	move-to v/offset + b/offset + 50
	; flush
	move-to v/offset + b/offset + 60
	move-to 0x0
	flush
]

v: view/no-wait [b: area all-over on-over [print ["OVER @" event/offset "away?:" event/away?]]]

loop 3 [redo print "--"]
```

It outputs:
```
REDO
OVER @ 36x15 away?: false
OVER @ -696x-380 away?: true
--
REDO
--
REDO
--
```

If you uncomment the other `; flush` line, it will register mouse entering and leaving (total of 3 events x 3 times).

**Expected behavior**

In the previous builds the output is correct:
```
REDO
OVER @ 36x15 away?: false
OVER @ -696x-380 away?: true
--
REDO
OVER @ 36x15 away?: false
OVER @ -696x-380 away?: true
--
REDO
OVER @ 36x15 away?: false
OVER @ -696x-380 away?: true
--
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



