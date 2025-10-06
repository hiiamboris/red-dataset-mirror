Red[
	Type: 'plugin
	Name: 'plugin-A
]

rule: [
	'hello 'world 
	set data block! (print ["plugin A matched" data])
	length-rule
]

data: []
length: none

init: func [][
    print "plugin A init"
    data: copy []
]
