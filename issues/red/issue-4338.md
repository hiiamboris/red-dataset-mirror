
#4338: Asynchronous keyboard handler discards mod keys on Windows
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4338>

**Describe the bug**

It is possible to press key combos quickly enough that Red won't notice modifier keys at all. See https://github.com/red/red/commit/acedb275c35c431b2fdcc6f48c19fa420b4717a5#r35782215 for the cause of that.

**To reproduce**

The script below simulates a SHIFT+SPACE combo. Red processes SPACE key at the time SHIFT was already released and produces wrong event flag `event/shift? = false`. Same true for every set of mods & key of course.
```
Red [needs: view]

#system [
	#import [
		"user32.dll" stdcall [
			keybd_event: "keybd_event" [
				bVk			[byte!]
				bScan		[byte!]
				dwFlags		[integer!]
				dwExtraInfo	[pointer! [float64!]]		;-- points to ULONG (uint64); unused
			]
			MapVirtualKey: "MapVirtualKeyW" [			;-- Translates (maps) a virtual-key code into a scan code or character value, or translates a scan code into a virtual-key code.
				uCode		[integer!]
				uMapType	[integer!]
				return:		[integer!]
			]
		]
	]
]

keybd_event*: routine [vk [integer!] scan [integer!] flags [integer!]] [
	keybd_event as byte! vk as byte! scan flags null
]
mapvirtualkey*: routine [code [integer!] type [integer!] return: [integer!]] [
	mapvirtualkey code type
]

MAPVK_VK_TO_VSC:    0 ; uCode is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is no translation, the function returns 0.
vk-to-scan: func [vk [integer!]] [mapvirtualkey* vk MAPVK_VK_TO_VSC]

sim-vkey-event: function [vk [integer!] down? [logic!]] [
	flags: either down? [0][KEYEVENTF_KEYUP]
	keybd_event* vk vk-to-scan vk flags
]
; #define VK_LSHIFT         0xA0
KEYEVENTF_KEYUP:			0002h


; ;████████ here starts the test code ████████

view [
	do [
		press: func [/slow] [
			set-focus f
			loop 10 [do-events/no-wait]			;-- move the focus
			sim-vkey-event A0h yes
			sim-vkey-event 20h yes
			sim-vkey-event 20h no
			if slow [loop 10 [do-events/no-wait]]	;-- has to process SPACE before LSHIFT is UP
			sim-vkey-event A0h no
		]
	]
	below
	f: field focus on-key [
		print [either event/shift? ["SHIFT+"][""] mold event/key]
	]
	button "Press SHIFT+SPACE" [press]
	button "Press SHIFT+SPACE SLOWLY" [press/slow]
]
```
1. Save & compile the script, run it
2. Press the lower button: it outputs `SHIFT+ #" "`
3. Press the upper button: it outputs just ` #" "`

**Expected behavior**

Both should output `SHIFT+ #" "`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 14-Mar-2020/16:01:22+03:00
```



