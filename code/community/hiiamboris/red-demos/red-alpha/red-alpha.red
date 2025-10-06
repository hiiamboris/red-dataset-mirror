Red [Needs: View]

w8+?: not find get in os-info 'name "Windows 7"
img: load %saturn-transparent.png

on-over: [if event/down? [w/offset: w/offset - (face/size / 2) + event/offset]]
w-flags: [no-title no-border all-over]
w-body: compose/deep pick [
	[backdrop black] 
	[image (img) all-over on-over [(on-over)]]
] w8+?
w-options: compose/deep pick [
	[
		draw: [image img]
		size: img/size
		actors: object [on-over: func [face event] [(on-over)]]
	]
	[]
] w8+?

w: view/no-wait/flags/options w-body w-flags w-options

#system [
	#import [
		"user32.dll" stdcall [
			GetActiveWindow: "GetActiveWindow" [
				return: [handle!]
			]
			SetWindowLong: "SetWindowLongW" [
				hWnd            [handle!]
				nIndex          [integer!]
				dwNewLong       [integer!]
				return:         [integer!]
			]
			SetLayeredWindowAttributes: "SetLayeredWindowAttributes" [
				hWnd            [handle!]
				crKey           [integer!]
				bAlpha          [integer!]
				dwFlags         [integer!]
				return:         [integer!]
			]
		]
	]
]

hack-it-w7: routine [hred [handle!] /local hwnd [handle!]] [
	hwnd: as handle! hred/value
	SetWindowLong hwnd -20 00080000h
	SetLayeredWindowAttributes hwnd 0 0 2
]

hack-it-w8+: routine [hred [handle!] /local hwnd [handle!]] [
	hwnd: as handle! hred/value
	SetWindowLong hwnd -20 00080000h
	SetLayeredWindowAttributes hwnd 0 0 1
]

hack-it: function [f [object!]] [
	h: f/state/1
	either w8+? [hack-it-w8+ h][hack-it-w7 h]
]

hack-it w
do-events