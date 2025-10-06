Red[]

#include %lua.rule

callback: func [e m r i s][
	if e = 'match [
		print [
			"EVT:" e "MA?:" m lf
			"RUL:" r lf
			"POS:" i lf
		;	"STK:" s
		]
	]
	true
]

clean-rule: func [value [block!] /local rule][
	parse value rule: [
		collect [some [paren! | ahead block! into rule | keep skip]]
	]
]

rua: func [value][
	if file? value [value: read value]
	parse/trace value block :callback
]
