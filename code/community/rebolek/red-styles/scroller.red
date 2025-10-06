Red[
	Title: "Scroller style"
	Author:  "Boleslav Březovský"	
]

context [

limit: func [number min-nr max-nr][
	min 
		max number min-nr
		max-nr
]

vertical?: func [face][face/extra/axis = 'v]
main-axis?: func [face][pick [y x] vertical? face]
area-size?: func [face][face/size/(main-axis? face) - (2 * face/extra/offset)]

; --- SCROLLER ---------------------------------------------------------------
set 'scroller-style [
	style scroller: base 12x12 draw []
		on-create [
			face/extra: object [
				drag?:	no
				ratio: 30%

				axis: either face/size/x > face/size/y ['h]['v]

				offset: 3.0 		; distance of knob from edges (TODO: padding or margin)
				drag-start: 0
				knob-pos: offset

				outer-outline: 220.220.220
				outer-fill: 'off
				inner-outline: 220.220.220
				inner-fill: 160.160.160

				draw-init: [
					pen (face/extra/outer-outline)
					fill-pen (face/extra/outer-fill)
					box 0x0 (face/size - 1x1) 3
					pen (face/extra/inner-outline)
					fill-pen (face/extra/inner-fill)
				]
				draw-box: [
					[
						box 
							(as-pair face/extra/offset - 1 face/extra/knob-pos) 
							(as-pair 
								face/size/x - face/extra/offset 
								face/size/y - face/extra/offset * face/extra/ratio + face/extra/knob-pos) 
							3
					][
						box
							(as-pair face/extra/knob-pos face/extra/offset - 1)
							(as-pair 
								face/size/x - face/extra/offset * face/extra/ratio + face/extra/knob-pos
								face/size/y - face/extra/offset 
							)
							3
					]
				]

				start-drag: func [face offset][
					face/extra/drag?: yes
					face/extra/drag-start: offset/(main-axis? face) - face/extra/knob-pos
				]
				do-drag: function [face offset][
					area-size: area-size? face
					set-knob-pos face offset
					face/data: limit
						to percent! (face/extra/knob-pos - face/extra/offset) / (area-size - (area-size * face/extra/ratio) - face/extra/offset)
						0%
						100% 
				]

				set-knob-pos: func [face offset][
					area-size: area-size? face
					face/extra/knob-pos: limit
						offset/(main-axis? face) - face/extra/drag-start
						face/extra/offset
						area-size * (100% - face/extra/ratio) 
				]

				set-data: function [face data][
					data: to float! data
					area: (area-size? face) * (100% - face/extra/ratio)
					offset: data * area + face/extra/offset
					face/extra/knob-pos: offset
				]

				redraw: function [face][
					set-data face face/data
					draw-block: append clear [] face/extra/draw-init
					append draw-block pick face/extra/draw-box vertical? face
					face/draw: compose bind draw-block 'face
				]
			]

			face/extra/inner-fill: face/color
			face/color: none
			face/data: 0%
			face/flags: [all-over]
			face/extra/redraw face
		]
		on-down [
			face/extra/start-drag face event/offset
		]
		on-up [
			face/extra/drag?: no
		]		
		on-over [
			if face/extra/drag? [
				face/extra/do-drag face event/offset
				face/extra/set-data face face/data
				face/extra/redraw face
				show face
			]
		]
]
; -- end of context
]
