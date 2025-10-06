Red [
	Title:   "Text Table"
	Author:  "Boleslav Březovský"
	Requests: [
		<APPEARENCE>
		"Read only cell columns could have a different style by default"
		"optional: cell with reactive buttons filled with pictures on the right or left side of each cell, "
		"Picture inside a cell"
		<NAVIGATION>
		"Tab/Shift TAB skip to multiple than 1 cells"
		<COLS>
		"Columns repositioning with a way to know the new order and if the user made a change"
		<SORT>
		"Colums Sorting change on click with SHIFT or some other key allowing for multiple sort column"
		"A way to block sorting until the user has hit INSERT to avoid continuous repositioning"
		"A keyword to block any sorting"
		<EDIT>
		"a way to filter characters input in editing"
		"support for shortcuts, function keys and left/right buttons"
		"Read only cells that react to mouse click"
		"Mixing read only and writeable columns"
		<DONE>
		"Columns headers" 
		"A way to have no border on cells"
		"Default styles could be edited"
		"each column could have a different style or we could adopt a global one"
		partially: "output styles to display currency symbol, format values/text, change the positioning (middle/center), background color/text color and cell border size/color"
	]
	To-Do: [
		"Highlight mulitple rows/cells, highlight column(s)"
		"Move header drawing after table drawing (will help with smooth scrolling)"
	]
	Bugs: [
		"Header padding is wrong"
	]
	Notes: [
	]
	Documentation: {
TEXT-TABLE
==========

`text-table` is a style for Red VID that provides table for text-based data.
It is not general purpose grid style and is optimized for textual data, however
it uses the Draw dialect for drawing cells, so it's possible to support cell
styling using colors and other Draw features.

Usage
-----

Because Red VID does not support `stylize` yet, you need to insert style into
your layout manually. Do something like this:

```
do %text-table.red
window: [
	<your VID here>
]
insert window text-table-style
view window
```

`text-table` expects data as block of blocks. First line is header. See example:

```
["ID" "Name" "Age" "City"]
[#1 "John" 32 "Brno"]
[#2 "Paul" 34 "Adamov"]
[#3 "George" 28 "Jeseník"]
[#4 "Ringo" 12 "Liverpool"]
```

To define column widths, you need to set them in `text-table/extra/styles`.
The format of this block is `pair!` of `<column-index>x<width>`, followed by
`word!` defining alignment and optional `paren!` with code that will be run when
cell from tthis column is draw. This way you can easily change appearance of
the cell based on its data. See example:

```
text-table/extra/styles: [
	[1x50 right]
	[2x100 left]
	[3x50 right (face/extra/color: as-color 40 value * 60 40)]
	[4x100 left]
]
```

In the bove example you can see that we set text color with `face/extra/color`
and we get cells' value with `value` word. `face/extra` is used for various
internals and also user settings that affect table's appearance. See the list
of various settings:

* color - Text color
* background - Background color
* alt-color? - alternate row background colors
* font - Font to use
* cell-padding - Cell padding
* row-border - Row border type: `full`, `horizontal`, `false`
* header? - is first row in data header?
* header-color - Header text color
* header-background - Header background
* header-padding - Header padding
* header-font - Header font
* align - Default align
* highlight
	* color - color of highlight frame
	* style - type of highlight: `cell`, `row`, `column`


}
]

trim-text: function [
	text
	width
	font
][
	; some preparation
	unless font/name [font/name: system/view/fonts/system]
	face: make face! compose [
		text: (text)
		font: (font)
	]
	face-width: first size-text face
	; if original text fits, return it
	if face-width <= width [return text]
	; remove last character
	change back tail face/text "…"
	face-width: first size-text face
	while [
		face-width > width
	] [
		; remove until text fits
		remove back back tail face/text
		face-width: first size-text face
	]
	; return trimmed text
	face/text
]

; --- TEXT-TABLE -------------------------------------------------------------
text-table-style: [
	style text-table: base 800x370 draw []
		on-create [
			print "on-create start"
			face/extra: context [
				; settings
				; TODO: COLUMNS and STYLES should be just one block
				styles:	none 
					; TODO: not only block of blocks, but also parse whole block into internal representation
				color:              40.40.40
				background:			230.250.230
				alt-color?:         no ; alternate row background colors
				font:               make font! [name: system/view/fonts/system]
				cell-padding:       8x8
				row-border:         'horizontal ; full, horizontal, false
				header?:            true ; is first row header?
				header-color:       80.80.150
				header-background:  230.230.250
				header-padding:     0x16
				header-font:        make font [style: 'bold size: 10]
				align:              'right ; Default align, can be overriden
				highlight: context [
					color: 250.120.120
					style: 'column ; 'cell, 'col
				]

				; internal stuff
				columns:            []
				offset:             0 ; line offset
				height:             0 ; computed in `draw-row`
				header-height:      0
				headers:            [] ; header names
				odd-line?:          true
				base-color:         color
				backgrounds:        none 
				hilite-mark:        none
				parsed-styles:      none
				cell-index:         0x0 ; CELL is in-data
				box-index:          0x0 ; BOX is on-screen
				box-position:       0x0
				box-size:           0x0
				all-over?:          true ; set to false to ignore mouse-over (for keyboard navigation)

				set-data: func [
					face
					data
					/local length
				][
					print "set-data"
					face/data: data
					; Init styles if none are defined
					unless face/extra/styles [
						print "set initial styles"
						length: length? first face/data
						styles: face/extra/styles: make block! length
						repeat i length [
							repend/only styles [as-pair i 100 'left]
						]
					]

					face/extra/draw-table face  
				]

				set-styles: func [
					face 
					styles
				][
					face/extra/styles: styles
				]

				; TODO: move funcs out
				parse-style: function [face style index][
					output: #()
					if none? style [return output]
					value: none
					; TODO: separate rules
					parse style [
						some [
							set value pair! (output/column: value)
						|	set value ['left | 'right | 'center] (output/align: value)
						|	set code paren! (
								unless zero? index/y [ ; hack to ignore header
									value: pick face/data/(index/y + face/extra/offset) output/column/x
									do bind to block! code 'value
									face/extra/color
								]					
							)
						]
					]
					output
				]
				get-columns: func [
					"Temporary function, should be read directly from STYLES"
					face
				][
					print "get-columns"
					clear face/extra/columns
					if face/extra/styles [
						foreach style face/extra/styles [
							append face/extra/columns first find style pair!
							; FIXME: Widths must be ALWAYS specified,
							;        should support some default value
						]
					]
				]
				max-lines?: func [face][face/size/y - face/extra/header-height / face/extra/height + 1]
				get-backgrounds: function [face][
					background: face/extra/background
					reduce [
						background 
						to tuple! head insert/dup clear [] background/1 + background/2 + background/3 / 3 3
					]
				]
			
				offset-to-index: function [
					"Set internal index values and return box index"
					face
					event
					/absolute "Return cell index in data instead of box index on screen"
				][
					extra: face/extra
					extra/box-index: extra/cell-index: 0x0 ; reset to prevent problems
					; get column
					start: 0
					columns: extra/columns
					forall columns [
						col: first columns
						all [
							event/offset/x >= start
							event/offset/x < (start + col/y)
							extra/box-index/x: index? columns
							extra/cell-index/x: col/x
							break
						]
						start: start + col/y
					]
					; get row
					extra/box-index/y: to integer! event/offset/y / face/extra/height
					extra/cell-index/y: extra/box-index/y + extra/offset 
					either absolute [extra/box-index][extra/cell-index]
				]
				box-to-cell: function [face index][
					as-pair
						face/extra/columns/(index/x)/x
						index/y + face/extra/offset
				]

				get-row: function [
					face 
					event 
					/absolute "Return absolute offset in data instead of relative offset on screen"
				][
					offset: either absolute [face/extra/offset][0]
					(event/offset/y / face/extra/height) + offset
				]
				get-col: func [
					; NOTE: this is useful and shouldn't be removed probably 
					face 
					event
					/pos "Return start and width as pair!"
				][
					print "get-col"
					extra: face/extra
					start: 0
					foreach col extra/columns [
						all [
							event/offset/x >= start
							event/offset/x < (start + col/y)
							return either pos [as-pair start col/y][col/x]
						]
						start: start + col/y
					]
					none
				]
				get-box: function [
					; TODO? put this into offset-to-index ?
					"Return box metrics as [top-left-position size]"
					face
					index
				][
					if zero? index/x [return none] ; add other conditions here
					extra: face/extra
					position: 0x0
					i: 0
					repeat i index/x - 1 [position: position + extra/columns/:i/y]
					position/y: extra/height * (index/y - 1) + extra/header-height
					reduce [position as-pair extra/columns/(i + 1)/y extra/height]
				]
				get-cell-content: function [
					face
					index
				][
					if index >= 1x1 [
						pick
							pick face/data index/y 
							index/x
					]
				]
				set-cell-content: function [
					face
					index
					content
				][
					row: pick face/data index/y
					poke row index/x content
				]
				draw-header-background: function [face][
					extra: face/extra
					unless empty? extra/headers [
						head reduce/into [
							'font extra/header-font
							'pen extra/header-color
							'fill-pen extra/header-background
							'box 
								as-pair 0 0 
								as-pair face/size/x - 1 extra/header-height
							; header shadow - FIXME: screws up on-over
							'pen 'off
							'fill-pen 'linear 0.0.0.127 0.0 255.255.255.127 1.0 0x0 0x10
							'box
								as-pair 0 extra/header-height 
								as-pair face/size/x - 1 extra/header-height + 10
						] clear []
					]
				]
				draw-cell: function [
					face
					index ; COLxROW (position on screen, not in data)
					text
					/header "Header cell instead of normal one"
				][
				;	print ["draw cell" index mold text]
					extra:       face/extra
					; reset to default values
					extra/color: extra/base-color
					font:        either header [extra/header-font][extra/font]
					padding:     either header [extra/header-padding][extra/cell-padding]
					style:       parse-style face pick extra/styles index/1 index
					if header    [style/align: 'center] ; FIXME: hardcoded style for header
					cell-width:  second pick extra/columns index/x
					inner-width: cell-width - (2 * padding/x)
					position:    first extra/get-box face index
					if header    [position/y: 0]
					text:        trim-text copy form text inner-width font
					text-width:  first size-text make face! compose [text: (text) font: (extra/font)]
					; align text (move to separate func?)
					offset:      switch/default any [style/align extra/align] [
						right    [inner-width - text-width + padding/x]
						center   [cell-width - text-width / 2]
					]            [padding/x]
					head reduce/into [
						'pen extra/color
						'text as-pair position/x + offset position/y + padding/y text
					] clear []
				]
				draw-row-text: function [
					face
					index "Ignored when header"
					/header
				][
					print "draw-row-text"
					extra: face/extra
					; FIXME: This produces wrong position for header
					;			should be header/row independent -
					;			should support independent height
					output: clear [] ; TODO: Use `collect/keep` here?
					row:    either header [extra/headers] [face/data/:index]
					i: 0
					foreach col extra/columns [
						i: i + 1
						if all [row col/y > 0] [
							append output either header [
								draw-cell/header face as-pair i index row/(col/x)
							][
								draw-cell face as-pair i index - extra/offset row/(col/x)
							]
						] 
					]
					output
				]
				draw-row-background: function [face index][
					extra: face/extra
					head probe trim head compose/into [
						font (extra/font)
						pen (either equal? 'full extra/row-border [extra/color]['off])
						line-width (either equal? 'full extra/row-border [1][0])
						fill-pen (pick extra/backgrounds not face/extra/alt-color? and face/extra/odd-line?: not extra/odd-line?)
						box 
							(as-pair 0 (index - 1) * extra/height + extra/header-height) 
							(as-pair face/size/x - 1 index * extra/height + extra/header-height + 1)
						pen (extra/color)
						(
							if equal? 'horizontal extra/row-border [
								compose [
									line
										(as-pair 0 index * extra/height + extra/header-height)
										(as-pair face/size/x - 1 index * extra/height + extra/header-height)
								]
							]
						)
					] clear []
				]
				draw-table: function [face][
					ntp: now/time/precise
					extra: face/extra
					extra/columns: extra/get-columns face
					extra/height: (2 * extra/cell-padding/y) + second size-text make face! compose [font: (extra/font) text: "M"]
					extra/header-height: (2 * extra/header-padding/y) + second size-text make face! compose [font: (extra/header-font) text: "M"]
					; TODO: move out from here (should be done on setting data)
					; FIXME: when table data are reloaded it should check if header is same as first new-line
					;		or add some other mechanism
					extra/backgrounds: extra/get-backgrounds face
					if all [
						extra/header?
						empty? extra/headers
					][
						extra/headers: take face/data
					]
					; --- draw table
					lines: min extra/max-lines? face any [length? face/data 0]
					extra/odd-line?: odd? extra/offset
					clear face/draw
					; --- draw rows
					repeat i lines [append face/draw draw-row-background face i]
					; --- draw row text
					repeat i lines [
						append face/draw draw-row-text face i + extra/offset 
					]
					; --- draw headers
					append face/draw draw-header-background face
					append face/draw draw-row-text/header face 0
					extra/hilite-mark: tail face/draw
					print now/time/precise - ntp
				]
				
				draw-hilite: func [
					face 
					event
					/local
				][
					extra: face/extra
					metrics: extra/get-box face extra/box-index
					if all [
						metrics
						event/offset/y > extra/header-height 
					][
						remove/part extra/hilite-mark tail face/draw ; remove old highlight
						repend face/draw [
							'pen extra/highlight/color
							'fill-pen 'off
							'line-width 2
							'box
						]
						repend face/draw switch extra/highlight/style [
							cell [[metrics/1 metrics/1 + metrics/2]]
							row  [[as-pair 0 metrics/1/y as-pair face/size/x metrics/1/y + metrics/2/y]]
							column [[as-pair metrics/1/x extra/header-height as-pair metrics/1/x + metrics/2/x face/size/y]]
						]
					]
				]
			]
			; ---
			face/flags: [all-over]
			if face/data [
				face/extra/draw-table face
			]
		]
	;	NOTE: ON-UP for editing
	;
	;	on-up [
	;		print ["cell content" content: face/extra/get-cell-content face face/extra/cell-index]
	;		; NOTE: hardcoded setting of edit field
	;		if content [ff/text: content] 
	;		set-focus ff
	;	]
	;
	;	NOTE: ON-UP for keyboard navigation
	;
		on-up [
			set-focus face
		;	face/extra/all-over?: not face/extra/all-over?	
		]
		on-key [
			extra: face/extra
			redraw-table?: no
			switch event/key [
				left  [extra/box-index/x: max 1 extra/box-index/x - 1]
				right [extra/box-index/x: min length? extra/columns extra/box-index/x + 1]
				; TODO: scroll vertically on boundaries
				up    [
					extra/box-index/y: extra/box-index/y - 1
					if zero? extra/box-index/y [
						extra/offset: max 0 extra/offset - 1
						extra/box-index/y: 1
						redraw-table?: yes
					]
				]
				down  [
					lines: extra/max-lines? face
					extra/box-index/y: extra/box-index/y + 1
					if extra/box-index/y > lines [
						extra/offset: min extra/offset + 1 (length? face/data) - lines
						extra/box-index/y: lines
						redraw-table?: yes
					]
				]
			]
			extra/cell-index: extra/box-to-cell face extra/box-index 
			if redraw-table? [extra/draw-table face]
			extra/draw-hilite face event
		]
		on-over [
			; TODO: switch for selecting hilite mode, also add column hilite
			extra: face/extra
			old-index: extra/box-index
			extra/offset-to-index face event
			if all [
				extra/all-over?
				event/offset/y > extra/header-height
				not equal? old-index extra/box-index
			][
				extra/draw-hilite face event
			]
		]

]
