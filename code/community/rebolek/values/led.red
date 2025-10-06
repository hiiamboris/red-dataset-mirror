Red[]

led!: context [
; --- rules
	value: none
	number: charset "1234567890"
	numbers: [some number]
; --- macro-specific rules
	char: none
	macro-char: charset [not ": ?>"]
	macro-name: [
		(value: clear "")
		some [set char macro-char (append value char)]
	]
; --- function-specific rules
	spec?:
	has?:
	name:
	spec:
	body: none
	name-chars: charset [not " ^-^//:;%^"{}()[]"]
	set-name: [copy name some name-chars]
	func-rule: [
		opt [
			set-name #":" (spec?: true)
		|	set-name #"%" (spec?: has?: true)
		|	set-name #";" 
		]
		opt [
			if (spec?) [
				copy spec to #"%" skip copy local to #";" skip (repend spec [" /local " local])
			|	copy spec to #";" skip
			|	copy spec to end
			]
		]
		opt [if (has?) (insert spec "/local ")]
		copy body to end
		(
			value: reduce [to lit-word! name load-block spec load-block body]
		)
	]
; -- plugin related rules
	plugin-rules: ['reserved]
; -- main rule
	led-rules: [
		#"i" get-value (emit-value 'insert)
	|	#"a" get-value (emit-value 'append)
	|	#"e" get-value (emit-value 'edit)	; TODO: store as `change` ?
	|	#"m" [
			#"s" get-value (emit-value [make structure])
		|	#"f" func-rule (emit-value [make function])
		]
	|	#"c" get-value (emit-value 'change)
	|	#"s" [ ; TODO: change to `select` ?
			#"c" (emit [clear mark])
		|	#"n" (emit [move mark next])
		|	#"b" (emit [move mark back])
		|	#"v" (emit [mark value])
		; TODO: mark block
		|	#"@" copy value to end  ; TODO: parse path properly here
			(emit-value [mark at])
		|	(emit [mark value])
	]
	|	#"z" (emit [clear mark])
	|	#"n" (emit [move mark next])
	|	#"b" (emit [move mark back])
	; TODO: r-replace, ???-poke,pick
	; TODO: n-next,b-back,N-into block,B-back from block
	;		^-should move selection
	|	#"x" (emit 'remove)
	|	#"/" get-value load-val (emit-value 'find)
	|	#"v" [
			#"s" (emit [view structure])
		|	#"f" get-value emit-function
		|	#"o" get-value emit-object
		]
	|	#"(" get-value (
			if #")" = last value [take/last value]
			emit-value 'do
		)
	|	#">" get-value (emit [call (value)])
	; TODO: translate all `run` commands
;	|	#":" get-value (emit compose [run (value)])
	|	#":" run-rules
	|	#"!" copy value to end (emit reduce ['ved load value])
	|	#"?" get-value (emit-value 'help) ; TODO: help
	|	#"#" [
			macro-name #":" (emit-value [record macro])
		|	#"?" end (emit [list macros])
		|	#"?" get-value (emit-value [show macro])
		|	#">" get-value (emit-value [set macro speed])
		|	macro-name (emit-value [play macro])
		|	(emit [store macro])
		]
	|	#";" get-value (emit-value 'comment)
	|	#"j" (emit [jump #[none]])
	|	#"q" (emit 'exit)
	|	plugin-rules
	|	get-value (emit-value 'fail)
	]
	run-rules: [
		; TODO: command on/command off
		; TODO: rewrite using value: SET <setting> ON/OFF
			["annotations" | "ann"] (emit [set annotate? true])
		|	["no annotations" | "nann"] (emit [set annotate? false])
		|	["index" | "i"] (emit [set count? true])
		|	["no index" | "ni"] (emit [set count? false])
		|	["syntax" | "sy"] (emit [set syntax? true])
		|	["no syntax" | "nsy"] (emit [set syntax? false])
		|	["depth" | "d"] copy value numbers (
				value: load value
				if zero? value [value: none]
				emit compose [set max-depth (value)]
			)
		; file operations
		|	["load" | "l"] match-filename (emit-value 'load)
		|	["save" | "s"] match-filename (emit-value 'save)
		; demo
		|	"demo" (emit reduce ['demo none])
	]
;--- support rules
	get-value: [copy value to end]
	load-val: [
		(
			if error? try [value: load value][
				report 'error 'syntax value
			]
			true
		)
		; TODO: break parsing
	]
	match-filename: [any space opt #"%" get-value] ; TODO: to delimiter
	emit-function: quote (
		emit compose switch/default last value [
			#"$" [[view function (load-value) tree]]
			#"%" [[view function (load-value) stats]]
		][
			either empty? value [
				[view functions]
			][
				[view function (load value)]
			]
		]
	)
	emit-object: quote (
		emit compose [view object (load value)]
	)
;--- support functions
	emit: func [data /local length][
		append out data
		length: either block? data [negate length? data][-1]
		new-line skip tail out length true
	]
	load-value: does [take/last value load value] ; TODO: error handling
	emit-value: func [code][
		if string? value [value: copy value] 
		emit compose [(code) (value)]
	]
	out: copy []
;--- main function
	set 'parse-led func [
		"Translated LED (Line Editor Dialect) to Values Editor Dialect"
		dialect
	][
		set 'ld dialect
		clear out
		parse dialect led-rules
		out
	]
]

