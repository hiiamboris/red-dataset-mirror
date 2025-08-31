# Simple tool to show how faces work

**Gist ID:** 6f8475bdc0890eaae8ffbebf47c02ecc
**Created:** 2017-05-15T17:12:47Z
**Last updated:** 2017-05-16T06:19:45Z

## File: `incredidle.red`

```Red
Red []

inc-value: func [
	face 
	color-id
	dest-face
	/local value rate
] [
	unless face/extra [face/font/color: 255.255.255]
	overflow?: false
	value: 1 + load face/text
	if value > 255 [
		value: max 1 value - 255
		face/rate: none
		overflow?: true
	]
	face/text: form value
	face/color/:color-id: value
	unless zero? rate: value / 10 [
		face/rate: rate
	]
	if overflow? [
		dest-face/extra: on
		dest-face/font/color: white
		dest-face/text: form 1 + load dest-face/text
		unless color-id > 2 [
			dest-face/color/(color-id + 1): load dest-face/text
		]
	]
	box-total/text: rejoin [box-1/color/1 "." box-2/color/2 "." box-3/color/3]
	box-total/color: to tuple! reduce [box-1/color/1 box-2/color/2 box-3/color/3]
]

win: layout [
	title "IncRedIdle"
	style box: base 100x100 0.0.0 128.128.128 "0" font-size 36 bold
	box-1: box 0.0.0 255.255.255
		on-up [inc-value face 1 box-2] 
		on-time [inc-value face 1 box-2]
		on-create [face/font: make face/font []]
	box-2: box extra #[false]
		on-up [if face/extra [inc-value face 2 box-3]] 
		on-time [inc-value face 2 box-3]
		on-create [face/font: make face/font []]
	box-3: box extra #[false]
		on-up [if face/extra [inc-value face 3 box-1]]
		on-time [inc-value face 3 box-1]
		on-create [face/font: make face/font []]
	return
	box-total: box 320x100 "0.0.0"
]

view win
```

## Comments

No comments.
