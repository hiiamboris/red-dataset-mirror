Red[]

hex-charset: func [
	data
	/local ws hex hex-number range stack output value
][
	ws: reduce ['any charset " ^-^/"]
	hex: charset "abcdefABCDEF0123456789"
	hex-number: [
		"#x" copy value 1 6 hex
		(append stack value)
	]
	range: [
		#"[" hex-number #"-" hex-number #"]"
		(
			repend output [
				to char! to integer! to issue! stack/1
				'-
				to char! to integer! to issue! stack/2
			]
			clear stack
		)
	]
	stack: clear []
	output: clear []
	parse data [
		some [
			range any [ws #"|" ws range]
		]
	]
	charset output
]

#TODO {ISSUE-CHARSET, like HEX-CHARSET, but will take block (needs adding spaces)} 

make-rule: func [replacements /local output name spec body][
	output: copy []
	foreach [name spec body] replacements [
		body: copy body
		until [
			change/only/part body to path! reduce [
				'args index? find spec body/1
			] 1
			tail? body: next body
		]
		body: head body
		repend output [
			'change
			reduce [to lit-word! name 'copy 'args (length? spec) 'skip]
			to paren! reduce ['reduce body]
		]
	]
	append output [| skip]
	reduce ['some output]
]

compile-rule: func [value replacements][
	value: copy value
	parse value make-rule replacements
	value
]
