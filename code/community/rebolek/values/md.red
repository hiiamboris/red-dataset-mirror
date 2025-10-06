Red[]

tests: [
	["normal *italic* normal" ["normal " italic "italic" " normal"]]
	["normal **bold** normal" ["normal " bold "bold" " normal"]]
	["normal _italic_ normal" ["normal " italic "italic" " normal"]]
	["normal __bold__ normal" ["normal " bold "bold" " normal"]]
]

output: []
symbol-stack: []
string: ""
emph-type: func [symbol][switch symbol ["**" "__" ['bold] "*" "_" ['italic]]]
rules: context [
	add-char: [(append string value)]
	emph-start: [(
		insert symbol-stack symbol
		append output copy string
		clear string
	)]
	emit-emph: [(
		repend output [emph-type take symbol-stack copy string]
		clear string
	)]
	ws: [space | tab | newline]
	bold-symbol: ["**" | "__"]
	bold-start: [
		ahead [ws bold-symbol not ws] 
		default
		copy symbol bold-symbol 
		emph-start
	]
	bold-end: [
		(symbol: first symbol-stack) 
		ahead [not ws symbol ws]
		symbol
		emit-emph (print "bold-end matched")
	]
	bold: [
		bold-start (print "bold-start matched")
		default
		some [
			italic
		|	bold-end break
		|	default
		]
	]
	italic-symbol: ["*" | "_"]
	italic-start: [
		ahead [ws italic-symbol not ws] 
		default
		copy symbol italic-symbol 
		emph-start
	]
	italic-end: [
		(symbol: first symbol-stack) 
		ahead [not ws symbol ws]
		symbol
		emit-emph
	]
	italic: [
		italic-start (print "italic-start matched")
		default
		some [
			bold
		|	italic-end break
		|	default
		]
	]
	default: [set value skip add-char]
	content: [bold | italic | default]
	main: [
		some content
		(append output copy string)
	]
]

state: none
md: func [data][
	clear output
	clear string
	clear symbol-stack
	parse data rules/main
	output
]
