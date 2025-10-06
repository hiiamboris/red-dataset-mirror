Red[
	To-Do: [
		"Expressions should follow C priority rules"
	]
	Notes: [
		https://cdecl.org/ "Translate from/to C gibberish"
	]
]

c: context [

; -- settings
	main?: true

; -- stack funcs

	stack-mark: 0
	mark-stack: quote (stack-mark: 0)
	push: func [value][insert/only stack value stack-mark: stack-mark + 1]
	pop: func [][stack-mark: stack-mark - 1 take stack]
	pop-mark: func [][take/part stack stack-mark]

; -- type handling

	type-table: #(
		integer! int
	)
	get-type: func [types][
		probe types
		case [
			not types ["void"]
			2 = length? types [rejoin [select type-table types/2/1 " *"]]
			'else [select type-table types/1]
		]
	]

; -- includes

	includes: none

	add-include: func [name][
		append includes rejoin ["#include" space name newline]
	]

; -- locals

	name:
	spec: body: symbol: type:
		none
	output: stack: none
	var-names: func-names: arg-count: none
	funcs: none	; holds func arity (TODO: should hold other metadata also)
	vars: none	; holds vars type (TODO: see above)
	open-char: close-char: none

	emit: func [value][append output value]

	register-func: quote (
		name: stack/1/name
		funcs/:name: make map! compose [
			arity: ((length? stack/1/args) / 2)
		]
		value: stack/1/local
		pop
		push value
		repend func-names ['| to lit-word! name]
	)

	register-var: quote (
		print ["reg:" mold stack]
		unless vars/:name [
			name: stack/1/name
			type: stack/1/type
			vars/:name: make map! probe compose [type: (type)]
			repend var-names ['| to lit-word! name]
		]
	)

	open-block: quote (append output "{^/" ) ; }
	close-block: quote (append output "}^/")

	line-end: ";^/"

	!value: [integer! | word! | get-word!]

; -- functions

	render-args: func [args][
		probe collect/into [
			keep rejoin [get-type args/2 space args/1]
			foreach [name type] skip args 2 [
				keep rejoin [", " get-type type space name]
			]
		] copy ""
	]

	func-proto: #(name: none type: none args: [] local: [])

	func-spec: [
		; arguments
		some [
			set name word!
			set type block!
			(repend stack/1/args [name type])
		]
		; return value
		(type: none)
		opt [
			quote return:
			set type block!
		]
		(stack/1/type: get-type type)
		; emit func spec
		; local words
		opt [
			quote /local
			some [
				set name word!
				set type block!
			;	(append stack/1 rejoin [get-type type space name line-end])
				(repend stack/1/local [get-type type name])
			]
		]
	]

	match-return: [
		'return
		set value skip ; TODO: can return just one value (no expression)
		(emit rejoin ["return " value line-end])
	]

	emit-locals: quote (
		unless empty? stack/1 [
			emit collect/into [
				foreach [type name] stack/1 [
					keep rejoin [type space name line-end]
				]
			] clear ""
		]
		pop
	)

	match-function: [
		; STACK structure for func spec: [ARITY NAME]
		set name set-word! 'func
		(push copy/deep func-proto)
		(stack/1/name: to word! name)
		into func-spec
		(
			probe stack
			emit rejoin [
				stack/1/type
				space
				stack/1/name
				#"("
				render-args stack/1/args
				#")"
			]
		)
		register-func
		open-block
		emit-locals
		into [
			rule
			opt match-return
		]
		close-block
	]

	func-def: [
		#func
		set name word!
		(push copy/deep func-proto)
		(stack/1/name: name)
		into func-spec
		register-func
	]

	match-func-call: [
		set name func-names
		(arg-count: funcs/:name/arity)
		; TODO: support expressions in func calls
		copy value arg-count skip
		(
			emit rejoin [
				name #"("
				head remove/part skip tail collect/into [
					foreach arg value [keep rejoin [arg ", "]]
				] clear "" -2 2
				#")" line-end
			]
		)
	]

	match-assign: [
		; TODO: Add declaration
		set name set-word!
		(push copy/deep var-proto)
		(stack/1/name: to word! name)
		[expression | match-value]
		; TODO: check if value is already declared
		register-var
		(emit rejoin [stack/1/type space stack/1/name " = " stack/1/value line-end])
		(pop)
	]

	var-proto: #(name: none type: none value: none)

	match-value: [
		set value [!value | var-names] (
			stack/1/type: either word? value [
				vars/:value/type
			][
				select type-table type?/word value
			]
			; pointer handling
			stack/1/value: switch/default type?/word value [
				get-word! [rejoin [#"&" form value]]
			][value]
		)
	]

	math-op: ['+ | '- | '* | '/]

	expression: [
		ahead [!value math-op]
		mark-stack
		match-value
		(print ["exp-stor" mold stack])
		set value math-op (push value push 'op)
		[expression | match-value]
		(
			print ["exp" mold stack]
			if value: pop-mark [
				out: copy ""
				foreach [val typ] reverse value [
					append out rejoin [val space]
				]
				push out
				push typ
			]
		)
	]

; -- loops

	match-loop: [
		loop-loop
	]

	loop-loop: [
		'loop
		match-value
		(
			emit rejoin [
				"for(int __cred_counter__=0; __cred_counter__<" pop
				"; ++__cred_counter__)^/"
			]
		)
		open-block
		into rule
		close-block
	]

; -- conditions

	condition: [
		match-value
		set symbol ['< | '> | '>= | '<=]
		match-value
		(
			emit rejoin [#"(" stack/2 space form symbol space stack/1 #")"]
			take/part stack 2
		)
	]

	if-cond: [
		'if (append output "if ")
		condition
		open-block
		into rule
		close-block
	]

	either-cond: [
		'either (append output "if ")
		condition
		open-block
		into rule
		(append output "} else {^/")
		into rule
		close-block
	]

	match-condition: [
		if-cond
	|	either-cond
	]

; -- standard functions

	match-print: [
		'print
		match-value
		(
			add-include <stdio.h>
			; TODO: determine if quotes should be included
			print ["print" mold stack]
			open-char: pick ["" #"^""] word? stack/2
			close-char: pick ["" {\n"}] word? stack/2
			emit rejoin [{printf(} open-char stack/2 close-char {);^/}]
			take/part stack 2
		)
	]

	match-funcs: [
		match-print
	]

; -- main rule

	rule: [
		any match-function
		(if main? [emit "void main()^/{^/"])
		some [
			match-function
		|	match-assign
		|	match-condition
		|	match-loop
		|	match-funcs
		|	match-func-call
		|	func-def
		]
		(if main? [emit "^/}^/"])
	]

	init: does [
		output: copy ""
		includes: copy ""
		stack: copy []
		funcs: copy #()
		vars: copy #()
		func-names: copy ['easter-egg] ; TODO: proper empty rule
		var-names: copy ['easter-egg] ; TODO: proper empty rule
	]

	set 'cred func [
		script
		/only "Do not create main() func"
	][
		main?: not only
		init
		parse script rule
		insert output includes
		output
	]

	set 'ccred func [filename script][
		write %temp.c cred script
		call/wait/shell/console rejoin ["gcc -o " filename " temp.c"]
	]

]
