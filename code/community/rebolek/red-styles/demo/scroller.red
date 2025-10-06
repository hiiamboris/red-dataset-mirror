Red []

do %../scroller.red

demo-lay: [
	panel [
		origin 0x0
		across
		bx: box gray 400x200
		vs: scroller
			react [                                                              
				face/offset/x: face/parent/size/x - 17
				face/size/y: bx/size/y
			]
		return
		hs: scroller red
			react [
				face/offset/y: face/parent/size/y - 17
				face/size/x: bx/size/x
			]
		return
	]
	return
	button "set 50" [vs/data: 50% hs/data: 50% vs/extra/redraw vs hs/extra/redraw hs]
	button "quit" [unview]
]

insert demo-lay scroller-style

view demo-lay

