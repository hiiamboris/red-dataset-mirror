# Test board illustrating drag drop swap to top make images disappear

**Gist ID:** 2bd823cb5c2ba8abf6e0
**Created:** 2015-12-18T12:01:22Z
**Last updated:** 2016-02-24T08:06:14Z

## File: `tb.red`

```Red
Red [
	"Drag and Drop over other images test in simple GUI"
	filename: %tb.red
	author:   "Arnold van Hofwegen"
	version:  0.6.0
	date:     "18-Dec-2015"
	Needs: 'View
]

system/view/debug?: no
live?: system/view/auto-sync?: no

workstation?: system/view/platform/product = 1

print [
	"Windows" switch system/view/platform/version [
		10.0.0	[pick ["10"			 "10 Server"	 ] workstation?]
		6.3.0	[pick ["8.1"		 "Server 2012 R2"] workstation?]
		6.2.0	[pick ["8"			 "Server 2012"	 ] workstation?]
		6.1.0	[pick ["7"			 "Server 2008 R1"] workstation?]
		6.0.0	[pick ["Vista"		 "Server 2008"	 ] workstation?]
		5.2.0	[pick ["Server 2003" "Server 2003 R2"] workstation?]
		5.1.0	["XP"]
		5.0.0	["2000"]
	] 
	"build" system/view/platform/build
]

bring-to-top: func [series item /local item-index item-value] [
    item-index: find series item
    item-value: first item-index
    remove item-index
 
    append series item-value
    show last series
    show item-value
]

piece-actors: object [
		on-over: function [face [object!] event [event!]][
			print ["Event over" event/offset event/away?]
		]
		on-drag-start: func [face [object!] event [event!]][
			print ["drag starts at" event/offset face/offset]
			bring-to-top piece-panel/pane face
		]
		on-drop: function [face [object!] event [event!]][
			print ["dropping" event/offset face/offset]
		]
]

piece-A: make face! [
	type: 'base offset: 100x200
	size: 30x30
	image: load %images/Xiangqi_General_TR.png
	options: [drag-on: 'down]
	id: "WK"
	actors: piece-actors
	dest: copy [] drag: false 
]
piece-B: make face! [
	type: 'base offset: 200x100
	size: 30x30
	image: load %images/Xiangqi_General_TB.png
	options: [drag-on: 'down]
	id: "WK"
	actors: piece-actors
	dest: copy [] drag: false 
]
pieces: [piece-A piece-B]

; Declaring the window
win: make face! [
	type: 'window text: "test" offset: 300x200 size: 300x300
]

; -- Declare window pane
win/pane: reduce [

	piece-panel: make face! [
		type:	'panel
		offset: 0x0
		size:	300x300
		color:  none
		pane:	reduce pieces
	]
	
]

view win
```

## Comments

### @Oldes on 2015-12-18T12:10:13Z

not trying to solve your issue, but would like to note, that instead of:

```
    item-index: find series item
    item-value: first item-index
    remove item-index
    append series item-value
```

you can use:

```
 append series take find series item
```

For more info see `help take`


### @iArnold on 2016-02-24T08:06:14Z

Setting the size of the panel bigger than 0x0 also helps to see the images. The over events do not make much sense to me and when dragging there are a lot of them while the images cannot be moved.


