Red [
    Title: ""
    Author: "Boleslav Březovský"
    License: 'BSD
]

gash: func [
    "Split block into blocks of same length"
    block
    length
][
    block: copy block
    result: make block! (length? block) / length
    until [
        append/only result take/part block length
        empty? block
    ]
    result
]

reverse-pairs: function [
	"Reverse (deep) pairs in block"
	block
][
	rule: [
		some [
			mark: pair! (mark/1: reverse mark/1)
		|	ahead block! into rule
		|	skip
		]
	]
	parse block rule
	block
]

align-text: function [
	"Return position where text should be to align to given rectangle"
	text [string!]
	font [object!]
	; should it accept face! instead?
	box  [pair!]
	alignment [pair!] "-1 - left, 0 - center, 1 - right; -1 bottom, 0 - middle, 1 - top"
] [
	face: make face! compose [text: (text) font: (font) size: 10000x10000]
	size: size-text face
	position: 0x0
	position/x: switch alignment/x [
		-1 [0]
		0  [box/x - size/x / 2]
		1  [box/x - size/x]
	]
	position/y: switch alignment/y [
		1  [0]
		0  [box/y - size/y / 2]
		-1 [box/y - size/y]
	]
	position
]


get-peaks: func [
    "Return block with minimal and maximal value from given block"
    block
    /local min max
][
    min: max: first block
    foreach value block [
        if value > max [max: value]
        if value < min [min: value]
    ]
    reduce [min max]
]

scales!: context [
    min: 0
    max: 0
    type: none ; none, 'linear, 'logarithmic ....
]

scale: func [
    block
    scales
    /local min max offset diff scale
][
    ; TODO: check for limits
    set [min max] get-peaks block
    offset: min - scales/min
    diff: max - min
    scale: (scales/max - scales/min) / to float! diff
    print ["min:" min "max:" max "offset:" offset "diff:" diff "scale:" scale]
    collect [
        foreach value block [
            value: value - offset / diff   ; turn to 0-1
            if scales/type [
                value: value ** second scales/type
            ]
            value: value * diff * scale
            keep value
        ]
    ]
]