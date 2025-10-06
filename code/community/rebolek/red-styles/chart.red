Red [ 
	To-Do: [
		"Padding - chart can have different padding on each side"
		"Labels  - Typically left and bottom, but support for all"
		"Axis    - more than one line (some definitional dialect)"
		"Scaling - support padding, more algorithms (signed, unsigned, ...)"
		"Boxes   - improve scaling (first and last element)"

		"Data    - decide on supported formats, allow multi data (two or more charts in one)"
		"For multiple charts support multiple settings"
	]
	Done: [
		"Overwrite margin area with boxes"
	]
	Scaling: [
		"get min and max"
		"convert data to absolute values, min=0, max=1"
		"scale properly"
		scale-types:
			full: 0 - max
			fill: min - max
			range
	]
	Axis: [
		count:  XxY
		origin: [bottom center top left middle right]
		style:  [dash solid ...]
	]
	Data: [
{
	Currently, flat format is supported in form of [val1 val2 ...]
	This is easy to work with, however it has only Y values and no info on X values.
	It is possible to draw a chart from it, but X axis labels will be missing.
	It should be possible to add some range for these data in form of first and last value,
	i.e. datum.
	Other supported format should be map! in form of #(val1: value val2: value ...)
	where we have labels for X in KEYS-OF and values in VALUES-OF.
	This format should be supported also as a block, but it hould be indicated somewhere.

	It is also important to support multiple data ((at least) two charts in one face),
	where first chart would have labels on top/left and second on bottom/right (configurable)
	together with configurable colors. 
}
	]
]

do %tools.red

; --- chart style ------------------------------------------------------------

chart-style: [
	style chart: base 800x400 draw []
		on-create [
			face/draw: [
			]
			face/extra: context [
				background: 43.48.53        ; 220.220.220
				color:      241.196.15      ; 180.180.80
				fill-color: 249.214.34.120  ; 220.220.160.120
				axis-color: 86.94.106
				crosshair-color: 241.15.94
				
				label:      object [
					color: 241.196.196
					font:  make font! [size: 8]
				]

				axis: context [
					color: red ;86.94.106
					count: -1x-1 ; -1: automatic, 0: none, other: number of lines
					style: 'solid
				]

				mode:       'spline
				margin:     #(left: 50 right: 20 top: 5 bottom: 20)
				padding:	0x15 ; inner chart padding, used by scale
				scale:      none
				scaling:    'fill ; or 'fill (see above)
				offset:     0 ; scaling offset
				step:       none
				overlay:    none
				value-font: make font! [size: 8]

				min-value:  0
				max-value:  0
				chart:      none ; current chart

				chart-size?: function [face][
					as-pair
						face/size/x - face/extra/margin/left - face/extra/margin/right
						face/size/y - face/extra/margin/top - face/extra/margin/bottom
				]
				scale?: function [face][
					print ["scale?" face/extra/scaling]
					extra:       face/extra
					size:        extra/chart-size? face
					data:        head sort copy face/extra/chart
					extra/min-value: min-value: first data
					extra/max-value: max-value: last data
					height:      size/y - (2 * extra/padding/y)
					range:       max-value - min-value
					switch/default extra/scaling [
						full [
							extra/offset: 0
							extra/scale: height / max-value
						]
						fill [
							extra/scale: height / range
							extra/offset: extra/scale * min-value
						]
					][
						; NOTE: here we expect that default value is range [min max]
						extra/scale: height / (extra/scaling/2 - extra/scaling/1)
						extra/offset: min-value - extra/scaling/1 * extra/scale
					]
					extra/scale 
				]

				redraw: function [face][
					unless face/data [return none]
					face/extra/chart: face/data ; TODO: support multiple data

					extra:       face/extra
					size:        extra/chart-size? face 
					
					clear face/draw
;
					extra/draw-backgroud face
					extra/draw-axis face
				
					case [
						not block? first face/data [
							length:      length? extra/chart
							extra/step:  (to float! size/x) / (length - 1)
							extra/scale: extra/scale? face

							extra/chart: face/data
							extra/draw-chart face
						]
						1 = length? probe unique collect [foreach value face/data [keep type? value]][
							print "block of blocks"
							foreach chart face/data [
								extra/chart: chart

								length:      length? extra/chart
								extra/step:  (to float! size/x) / (length - 1)
								extra/scale: extra/scale? face

								extra/draw-chart face
							]
						]
					]
					extra/draw-border face
					extra/draw-labels face
					extra/overlay: tail probe face/draw
				]


				draw-backgroud: function [face][
					extra: face/extra
					size:  extra/chart-size? face
					top-left: as-pair extra/margin/left extra/margin/top 
					repend face/draw [
						; TODO: separate background
						'pen 'off
						'fill-pen extra/background
						'box top-left top-left + size
						; --- /bg
					]
				]
				draw-axis: function [face][
					print "draw-axis"
					extra: face/extra
					size:  extra/chart-size? face
					; TODO: merge both axis together somehow, it's same code
					; Y-axis
					count: switch/default extra/axis/count/y [
						-1 [4] ; TODO: automatic based on height
						0  [0]
					][min 16 extra/axis/count/y] ; TODO: limit based on height
					pattern: probe switch probe extra/axis/style [
						solid [[pen pattern 1x1 [line 0x0 1x0]]]
						dashed [[pen pattern 4x1 [line 0x0 2x0]]]
					]
					unless zero? count [
						step: size/y / to float! (count + 1)
						position: extra/margin/top
					;	if pattern [append face/draw pattern]
						repend face/draw [
							'pen extra/axis/color
							'fill-pen 'off
						]
						repeat index count + 2 [
							repend face/draw [
								'line as-pair extra/margin/left position 
									  as-pair extra/margin/left + size/x position
							]
							position: position + step
						]
					]
					; X-axis
					pattern: reverse-pairs pattern
					count: switch/default extra/axis/count/x [
						-1 [4] ; TODO: automatic based on height
						0  [0]
					][min 32 extra/axis/count/x] ; TODO: limit based on width
					unless zero? count [
						step:     size/x / to float! (count + 1)
						position: extra/margin/left
					;	if pattern [append face/draw pattern]
						loop count + 2 [
							repend face/draw [
								'line as-pair position extra/margin/top
									  as-pair position extra/margin/top + size/y
							]
						;	as-pair position size/y - (extra/scale * value) + extra/margin/top
							position: position + step
						]
					]
					probe face/draw
				]
				draw-chart: function [face][
					print "draw-chart"
					extra: face/extra
					size:  extra/chart-size? face
					switch extra/mode [
						line spline [
							repend face/draw [
							;	'pen 'pattern 1x1 [line 0x0 1x0]
								'fill-pen extra/fill-color
								'line-width 2
								'pen extra/color
								extra/mode
								as-pair extra/margin/left - 3 size/y + extra/margin/top ; TODO: add only for SPLINE
							]
							extra/draw-line face
						]
						box [
							extra/draw-boxes face
						]				
					]
				]
				draw-line: function [face][
					extra:    face/extra
					size:     extra/chart-size? face
					position: extra/margin/left
					foreach value face/extra/chart [
						append face/draw as-pair position size/y - (extra/scale * value) + extra/margin/top + extra/offset
						position: position + extra/step
					]
					append face/draw as-pair size/x + extra/margin/left + 3 second last face/draw ; TODO: add only for SPLINE
					append face/draw as-pair size/x + extra/margin/left + 3 size/y + extra/margin/top ; TODO: add only for SPLINE
				]
				draw-boxes: function [face][
					extra:    face/extra
					size:     extra/chart-size? face
					position: extra/margin/left
					repend face/draw [
						'pen 'pattern 1x1 [line 0x0 1x0]
						'fill-pen extra/fill-color
					]
					foreach value face/extra/chart [
						repend face/draw [
							'box 
								as-pair position - (extra/step / 2) extra/scale * value + (size/y / 2)
								as-pair position + (extra/step / 2) - 1 size/y - 1
						]
						position: position + extra/step
					]
				]
				draw-crosshair: function [face offset][
					extra: face/extra
					size:  extra/chart-size? face

					if any [
						offset/x < extra/margin/left
						offset/x > (extra/margin/left + size/x)
						offset/y < extra/margin/top
						offset/y > (extra/margin/top + size/y)
					] [return none]

					step:  to integer! offset/x - extra/margin/left / extra/step
					x-pos: step * extra/step + extra/margin/left
					value: pick face/extra/chart step + 1
					; TODO: change draw only when STEP changes
					remove/part extra/overlay tail face/draw
					repend extra/overlay [
						'pen extra/crosshair-color
						'line 
							as-pair x-pos extra/margin/top
							as-pair x-pos size/y + extra/margin/top + 2
						'fill-pen 'off
						'circle 
							as-pair x-pos size/y - (extra/scale * value) + extra/margin/top + extra/offset
							5
						; value box - TODO: move box size out of here
						'fill-pen 180.80.80
						'box
							as-pair x-pos - 25 size/y + extra/margin/top + 2
							as-pair x-pos + 25 size/y + extra/margin/top + 17
							3
						; value box text
						'pen 200.240.240
						'font value-font
						'text as-pair x-pos - 20 size/y + extra/margin/top + 2 form face/extra/chart/(step + 1)
					]
				]
				draw-border: function [face][
					extra: face/extra
					size:  extra/chart-size? face
					repend face/draw [
						'pen 'off
						'fill-pen extra/background
						'line-width 1
						'box 0x0 as-pair extra/margin/left face/size/y
						'box 0x0 as-pair face/size/x extra/margin/top
						'box as-pair 0 extra/margin/top + size/y face/size
						'box as-pair extra/margin/left + size/x 0 face/size 
					]
				]
				draw-labels: function [face][
					print "draw-labels"
					extra: face/extra
					size:  extra/chart-size? face

					; TODO:
					;	* Do not get values from data, but compute them
					;		They are wrong currently, lowest value is 0, not 997

					; x-axis
					; FIXME: VALUE is actually Y-axis, but it's good enough for testing

					count: switch/default extra/axis/count/x [
						-1 [4] ; TODO: automatic based on height
						0  [0]
					][min 16 extra/axis/count/y] ; TODO: limit based on height
					unless zero? count [
						step: size/x / to float! (count + 1)
						position: extra/margin/left
						repend face/draw [
							'pen extra/label/color ; TODO: add to settings
							'font extra/label/font
						]
						scale: (length? face/extra/chart) - 1 / (count + 1.0)
						repeat index count + 2 [ ; + 2 - left and right borders
							text: form to integer! pick face/extra/chart to integer! (index - 1) * scale + 1 
							text-pos: align-text text label/font 40x15 0x0
							repend face/draw [
								'line as-pair position face/size/y - extra/margin/bottom
									  as-pair position face/size/y - extra/margin/bottom + 2
								'text text-pos + as-pair position - 20 face/size/y - extra/margin/bottom + 2 text
							]
							position: position + step
						]
					]
					; y-axis

					count: switch/default extra/axis/count/y [
						-1 [4] ; TODO: automatic based on height
						0  [0]
					][min 16 extra/axis/count/y] ; TODO: limit based on height
					unless zero? count [
						step: size/y / to float! (count + 1)
						position: extra/margin/top - 6 ; naive attempt to center text vertically
						repend face/draw [
							'pen extra/label/color ; TODO: add to settings
							'font extra/label/font
						]
						; FIXME: does not count with chart padding
						scale: extra/max-value - extra/min-value / (count + 1)
						repeat index count + 2 [ ; + 2 - left and right borders
							text:     form to integer! extra/min-value + (count - index + 2 * scale) 
							text-pos: align-text text label/font 40x15 0x0
							repend face/draw [
								'text text-pos + as-pair extra/margin/left - 40 position text
							]
							position: position + step
						]
					]
				]
			]
			face/flags: [all-over]
			face/extra/redraw face
		]
		on-over [
			face/extra/draw-crosshair face event/offset
		]
]
