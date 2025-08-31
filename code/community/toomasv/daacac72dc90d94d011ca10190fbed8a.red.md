# Nostalgic pendulum clock

**Gist ID:** daacac72dc90d94d011ca10190fbed8a
**Created:** 2018-02-14T20:38:10Z
**Last updated:** 2020-02-06T09:22:16Z

## File: `clock.red`

```Red
Red []
system/view/auto-sync?: off
pos: 145x143
nums: does [collect [
	repeat i 12 [keep compose [
		text (as-pair 
			(cosine i * 30 - 91) * 50 + (pos/x) 
			(sine i * 30 - 91) * 50 + (pos/y)) 
		(to-string i)
]]]]
hyp: func [a b][sqrt add a ** 2 b ** 2]
ang: func [a][180 / pi * arctangent2 a/y a/x]
fin: func [s l w][compose/deep [shape [
	move 150x150 'move (s)
	'arc (as-pair 0 0 - s/y * 2) (hyp s/x s/y) (hyp s/x s/y) (ang s) large 
	'line (as-pair l / 2 w / 2 + s/y) (as-pair l / 2 w / -2) (as-pair l / -2 w / -2)
]]]
time: now/time
get-hour: does [remainder subtract add multiply time/hour 30 multiply time/minute 0.5 90 360]
get-min: does [remainder subtract add multiply time/minute 6 multiply time/second 0.1 90 360]
get-sec: does [remainder subtract multiply to-integer time/second 6 90 360]
chick: load/as https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/hatched_chick.png 'png
n: 0
view/tight compose/deep [
	b: box 300x600 rate 1 
	draw [
		fill-pen silver
		pendulum: rotate 90 150x150 [box 150x148 550x152 fill-pen gold circle 550x150 30]
		fill-pen brown
		polygon 50x250 50x80 150x30 250x80 250x250
		rotate 152 150x30 [box 150x30 280x35]
		rotate 	28 150x30 [box 145x25 280x30]
		fill-pen black circle 150x60 15
		cockoo: translate 141x55 [scale .3 .3 [image (chick)]]
		
		fill-pen white
		circle 150x150 60 (nums) pen red line 150x145 150x155 line 145x150 155x150 pen black
		fill-pen gold
		hours: rotate (get-hour) 150x150 [(fin 6x-3 30 10)]
		fill-pen yello
		mins:  rotate (get-min) 150x150 [(fin 4x-2 40 6)]
		fill-pen red
		secs:  rotate (get-sec) 150x150 [(fin 2x-1 50 3)]
	]
	on-time [
		n: n + 1
		time: now/time ;probe time
		m: time/minute % 60 
		s: time/second % 60
		probe reduce [m s]
		hours/2: get-hour
		mins/2:  get-min
		secs/2:  get-sec
		pendulum/2: either odd? n [91][89]
		case  [
			any [
				all [m =  0 find [0.0 2.0 4.0 6.0] s]
				all [m = 15 s = 0.0]
				all [m = 30 find [0.0 2.0] s]
				all [m = 45 find [0.0 2.0 4.0] s]
			][
				cockoo/3/2: cockoo/3/3: .35
				cockoo/2: 139x53
			]
			'else [
				cockoo/3/2: cockoo/3/3: .3
				cockoo/2: 141x55
			]
		]
		show face
	] 
	at 135x45 box rate 9 
	draw [
		door: translate 30x15 [scale 1 1 [fill-pen brown circle -15x0 15]]
	] 
	on-time [
		time: now/time/precise ;probe time/second
		m: time/minute % 60
		s: time/second % 60
		
		case [
			all [; opening
				find [59 14 29 44] m
				s > 59
			][door/3/2: door/3/2 - 0.2]
			any [; closing
				all [m =  0 7.5 < s s < 8.5]
				all [m = 15 1.5 < s s < 2.5] 
				all [m = 30 3.5 < s s < 4.5]
				all [m = 45 5.5 < s s < 6.5]
			][door/3/2: door/3/2 + 0.2]
			any [; shut
				all [m =  0 s >= 8.5]
				all [m = 15 s >= 2.5]
				all [m = 30 s >= 4.5]
				all [m = 45 s >= 6.5]
				all [not find [0 15 30 45] m]
			][door/3/2: 1]
		]
		show face
	]
]

```

## Comments

No comments.
