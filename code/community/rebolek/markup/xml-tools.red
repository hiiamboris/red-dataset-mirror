Red[]

context [
	formats: [triples compact key-val]
	meta-tags: [xml! doctype! comment! PI! cdata!]
	output: []

	triples: func [data /local tag content atts] [
		foreach [tag content atts] data [
			case [
				find meta-tags tag [
					repend output [tag content atts]
					new-line skip tail output -3 true
				]
				block? content [
					triples content
				]
			]
		]
	]

	compact: func [data /local rule] [
		parse data rule: [
			collect into output [
				any [
					keep pick [
						'xml! some [issue! skip]
					|	['doctype! | 'comment! | 'PI! | 'cdata!] skip
					]
				|	'attr! ; ignore
				|	word! ahead block! into rule
				|	skip
				]
			]
		]
	]

	key-val: func [data /local rule] [
		parse data rule: [
			collect into output [
				any [
					keep pick [
						['xml! | 'doctype! | 'comment! | 'PI! | 'cdata!]
						skip
					]
				|	'attr! ; ignore
				|	word! ahead block! into rule
				|	skip
				]
			]
		]
	]

	set 'get-meta func [
		"Get metadata only from converted XML data"
		data [block!] "Converted XML data"
		/as "Select data format [triples compact key-val]"
			format [word!]
	] [
		clear output
		format: any [format 'triples]
		unless find formats format [
			do make error! "Unknown format"
		]
		do bind reduce [format data] 'triples
		copy output
	]
]

context [
	output: []
	set 'find-element func [
		"Return block of positions in the data where an element is found"
		data [block!] "Data to search in"
		elem [word!]  "Element to search for"
		/local rule mark
	] [
		elem: to lit-word! elem
		clear output
		parse data rule: [
			some [
				mark: elem (append/only output mark)
			|	ahead block! into rule
			|	skip
			]
		]
		copy output
	]
]

find-root: func [
	"Return data at the position of root element (just after the prolog)"
	data [block!] "Data to search in"
		/as "Select data format [triples compact key-val]"
			format [word!]
] [
	switch format [
		triples [
			until [
				unless find [xml! doctype! comment! PI! cdata!] data/1 [return data]
				data: skip data 3
				tail? data
			]
		]
		compact key-val [
			parse data [
				'xml! | 'doctype! | 'comment! | 'PI! | 'cdata!
			|	data: word! to end
			|	skip
			]
			return data
		]
	]
]
