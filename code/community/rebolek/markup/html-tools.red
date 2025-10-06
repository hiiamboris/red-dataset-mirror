Red[
	Title: "XML Tools"
	Author: "Boleslav Březovský"
]

probe-html: func [
	data
] [
	foreach [tag content attributes] data [
		print [tag length? content length? attributes]
	]
]

valid-html?: func [
	"Check if the return of LOAD-HTML is valid"
	data [block!]
	/local t c a error
] [
	error: [make error! "HTML data are invalid"]
	unless zero? mod length? data 3 [do error]
	foreach [t c a] data [
		unless all [
			any [word? t none? t]
			any [block? c string? c]
			map? a
		] [do error]
		if block? c [valid-html? c]
	]
	true
]

foreach-node: func [
	data
	code
	/local tag content attributes
] [
	z: data
	; FN takes three parameters: [tag content attribute]
	foreach [tag content attributes] data [
		do bind code 'tag
		if block? content [
			foreach-node content code
		]
	]
]

select-by: func [
	"Select element by its properties"
	data [block!]	"Data to select element from"
	type [word! path! string!]	"Type of property to select by (tag, content, attribute)"
	value [string!] "Value of property"
	/local action ret
] [
	action: compose switch/default type [
		tag       [[equal? tag (value)]]
		content   [[all [string? content find content (value)]]]
	] [[equal? (value) select attributes (type)]]
	ret: copy []
	foreach-node data compose [
		if (action) [
			append ret reduce [tag content attributes]
		]
	]
	ret
]

context [
	parent: none
	set 'parent? func [
		data
		value
		/inner
		/local tag content attributes
	] [
		unless inner [parent: none]
		foreach [tag content attributes] data [
			if equal? value reduce [tag content attributes] [
				return parent
			]
			if block? content [
				parent: reduce [tag content attributes]
				if parent?/inner content value [return parent]
			]
		]
		none
	]
]

children?: func [
	"Return children tag names"
	data
	/local tag content attributes
] [
	collect [foreach [tag content attributes] data [keep tag]]
]

get-text: function [
	data
] [
	if any [not data string? data char? data] [return data]
	ret: copy {}
	foreach-node data compose/deep [
		all [
			string? content
			append (ret) content
		]
	]
	ret
]
