Red[]

tree!: context []

branch!: context [
	data:
	parent:
	children: none
]

make-branch: func [payload paren /local branch][
	branch: make branch! [
		data: payload
		parent: paren
		children: copy []
	]
	if paren [append paren/children branch]
	branch
]

; --

test1: [1 + 2]
test2: [1 + 2 * 3]

parse-test: func [source][

	tree: make-branch none none
	pointer: tree

	match-operator: [
		set symbol ['+ | '- | '* | '/]
	]
	process-operator: [
		match-operator
		(print "operator matched")
		(pointer/data/value: symbol)
	]
	match-value: [
		set val integer!
	]
	process-value: [
		match-value
		(print "value matched")
		(make-branch context [type: 'value value: val] pointer)
	]
	expression: [
		ahead [match-value match-operator]
		(print "expression ahead")
		(pointer: make-branch context [type: 'expression value: none] pointer)
		process-value
		process-operator
		[expression | process-value]
	]

	probe parse source [
		expression
	]

	; root has just one child, so we can ignore the root and return the child
	tree/children/1
]

; -- render

output: copy {}

render-branch: func [branch /local children][
	switch branch/data/type [
		expression [
			append output "( "
			children: branch/children
			forall children [
				child: first children
				render-branch child
				unless tail? next children [
					repend output [branch/data/value space]
				]
			]
			append output ") "
		]
		value [
			repend output [branch/data/value space]
		]

	]
]

render-tree: func [tree][
	output: copy {}
	render-branch tree
	output
]
