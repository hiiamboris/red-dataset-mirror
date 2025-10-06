Red[]

#include %XML.red

trim-xml: func [
	"Remove all newlines and non-essential whitespaces from XML"
	xml [string!]
] [
	parse xml [
		some [
		;	pos: (print pos)
			change [any space newline] ("")
		|	change [some tab] ("")
		|	change [newline] ("")
		|	change [any space "/>"] ("/>")
		|	skip
		]
	]
	xml
]

; -- testing

count: 6

foreach format [triples compact key-val] [

	repeat index count [
		print ["Test:" index newline "Format:" format]
		raw: read rejoin [%data/test- index %.xml]
		print either try [red-data: load-xml/as raw format] [
			"Data loaded"
		] [
			"ERROR: Can't load data!"
		]
		print either try [xml-data: to-xml/as red-data format] [
			"Data converted"
		] [
			"ERROR: Can't convert data!"
		]
		data: to-xml load-xml raw
		result: equal? data xml-data
		print ["Same:" result newline]
	]

]
