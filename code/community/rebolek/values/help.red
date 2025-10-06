Red[
	Note: "Uses simplified version of MarkDown (MicroDown) which may be gradually improved to match more and more features of MarkDown"
]

ve-help: read %help.md 

help!: context [
	out: []
	text: ""
	toc: []
	chapters: []
	char: none
	char-stack: []
	raw: ""
	toc?: true		; process chapters?

	add-chapter: func [value][if toc? [append toc value]]
	emit: func [value][
		append out copy text
		clear text
		repend out value
	]
	ws: charset " ^-^/"
	some-ws: compose [some ws]
	match-header1: [
		"##" space copy value to newline skip (
			add-chapter value
			emit ['bold 'fg 'yellow "  " value 'reset 'newline]
			; TODO split to chapters
		)
	]
	match-header2: [
		"###" space copy value to newline skip 
		(emit ['italic 'fg 'yellow "  " value 'reset])
	]
	match-code: [	; TODO: What about ` in code?
		"```" copy value to "```" 3 skip (emit ['fg 'green indent copy value 'reset])
	|	#"`" copy value to #"`" skip (emit ['fg 'green copy value 'reset]) ; NOTE: what about "`^/" ?
	]
	match-emphasis: [
		set char [#"*" | #"_"] copy value to char skip
		(emit ['italic copy value 'reset])
	]
	match-strong: [
		copy char ["**" | "__"] copy value to char 2 skip
		(emit ['bold copy value 'reset])
	]
	match-anything: [set value skip (append text value)]
	main: [
		some [
			match-header1
		|	match-header2
		|	match-code
		|	match-strong
		|	match-emphasis
		|	match-anything
		]
	]
	init: func [/only][
		clear out
		clear text
		clear char-stack
		unless only [
			clear toc
			clear chapters
		]
	]
	select-chapter: func [name /local chapter][
		unless chapter: find raw name [exit] ; TODO: report error?
		parse-help/only parse chapter [collect keep to "## "]
	]
	set 'parse-md func [
		dialect
	][
		toc?: false ; TODO: add a switch for it
		init/only
		parse dialect main
		out
	]
	set 'parse-help func [
		dialect 
		/only 
		/content 
		/local index
	][
		toc?: true
		unless only [
			raw: dialect
			init
		]
		parse dialect main
		either content [
			collect [
				index: 1
				foreach value toc [
					keep reduce [
						pad/left form index 3
						" - "
						'fg 'yellow 'bold value 'reset 'newline
					]
					index: index + 1
				]
				keep 'reset
			]
		][
			out
		]
	]
]

parse-led-rules: func [led-rules][
	cmd: ""
	char: subchar: value: add-value?: multi?: none
	result: clear []
	get-char: [set char char!]
	emit-single: quote (unless multi? [repend result [copy cmd value]])
	emit-multi: quote (
		repend result [copy cmd value]
		take/last cmd
	)
	paren-rule: [
		to paren! into [
			'emit-value (add-value?: true) set value skip
		|	'emit (add-value?: false) set value skip
		|	skip
		]	
	|	to '|
	|	to end
	]
	sanitize: quote (
		if block? value [value: copy value]
		if lit-word? value [value: to word! value]
		unless block? value [value: reduce [value]]
		if add-value? [append value <value>]
	)
	char-rule: [
		get-char (
			value: none
			multi?: no 
			append clear cmd char
		)
		opt [
			ahead block! into [
				(multi?: yes)
				some [
					get-char (append cmd char)
					paren-rule sanitize emit-multi
				|	'|
				]
			]
		]
		paren-rule sanitize emit-single
	]
	parse led-rules [
		some [
			char-rule
		|	'|
		]
	]
]

show-help: does [ansi/do parse-help ve-help]
