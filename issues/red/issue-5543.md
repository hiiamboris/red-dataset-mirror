
#5543: A black frame appears when capturing the Red Window
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 4 comment(s).
[GUI]
<https://github.com/red/red/issues/5543>

**Describe the bug**

A black frame appears when capturing the Red Window.

**To reproduce**

Run this code:

```
Red [
	Title:	"Red window & screen capture VID demo"
	Author:	"Qingtian Xie"
	File:	%face-to-image-vid.red
	Tabs:	4
	Needs:	'View
	Rights:	"Copyright (C) 2016 Qingtian Xie. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

view [
	title "Simple Capturing demo"
	style btn: button 100x40
	pad 30x0
	btn "Capture Self" [
		img: to-image face
		canvas/draw: reduce ['image (img) (canvas/size - img/size / 2)]
	]
	btn "Capture Window" [
		img: to-image face/parent
		canvas/draw: reduce ['image (img) 0x0 (canvas/size)]
	]
	btn "Capture Screen" [
		img: to-image system/view/screens/1
		canvas/draw: reduce [
			'image (img)
			0x0 canvas/size
		]
	]
	return
	canvas: image 400x330
]
```

Hit the center button "capture window"

**Screenshots**

![image](https://github.com/user-attachments/assets/288e284e-2444-452b-904f-df91f177c220)

**Platform version**

RED: [ branch: "master" tag: #v0.6.5 ahead: 186 date: 6-Sep-2024/10:31:12 commit: #f5c9214f6b545dc7aa7a551ac57851f86f8fd5ec ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]



Comments:
--------------------------------------------------------------------------------

On 2024-09-25T01:24:05Z, qtxie, commented:
<https://github.com/red/red/issues/5543#issuecomment-2372681613>

    I think the black frame is the shadow of the window. We capture the window (by using [PrintWindow](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-printwindow)) to a bitmap. While a bitmap cannot encode transparent color properly, it becomes a black frame.

--------------------------------------------------------------------------------

On 2024-09-25T01:31:00Z, qtxie, commented:
<https://github.com/red/red/issues/5543#issuecomment-2372688832>

    It's a limitation of the PrintWindow API. https://github.com/microsoft/WindowsCompositionSamples/issues/358

