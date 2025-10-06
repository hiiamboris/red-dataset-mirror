Red [
	Title: "Load rules"
	About: "Function for extending parse rules"
]

context [
	ctxs: []
	locals: []
	extern: []
	rules: []
	names: []
	imports: []
	include: ctx-name:
	value: name: rule: none

	store-local: quote (
		value: to word! value
		if all [
			not find extern value
			not find locals value
		] [
			append locals value
		]
	)

	grab-locals: [
		some [
;pos: (print mold copy/part pos 5)
			['set | 'copy]
			set value word!
			store-local
		|	set value set-word!
			store-local
		|	ahead [block! | paren!] into grab-locals
		|	skip
		]
	]

	grab-extern: [
		'extern set value word!
		(append extern value)
	]

	grab-include: [
		'include set value file!
		(include: value)
	]

	grab-import: [
		'import set value word!
		'from set name word!
		(repend imports [name value])
	]

	grab-rule: [
		set name set-word!
		(append names name)
		set rule into grab-locals
	]

	store-rule: quote (append rules rule)

	set 'make-rules func [input /local ctx src word] [
		; -- initialization
		locals: make block! 10
		rules: make block! 100
		extern: make block! 10
		names: make block! 20
		imports: make block! 20
		include: none
		; -- parsign
		parse input [
			'name set ctx-name word!
			any [
				grab-extern
			|	grab-include
			|	grab-import
			]
			grab-rule
			store-rule
			any [
				grab-rule
				(append rules '|)
				store-rule
			]
		]
		; -- create rules context
		ctx: either include [
			unless exists? include [
				do make error! rejoin [
					"Include file " include " does not exist"
				]
			]
			skip load include 2
		] [make block! 50]
		foreach local locals [
			repend ctx [to set-word! local none]
		]
		; -- set imports as placeholders only
		foreach [src word] imports [
			repend ctx [to set-word! word none]
		]
		repend ctx [quote rules: rules]
		ctx: context ctx
		; -- now that context is created replace import placeholders
		foreach [src word] imports [
			src: ctxs/:src
			ctx/:word: :src/:word
		]
		repend ctxs [ctx-name ctx]
		ctx/rules
	]
]

load-rules: func [rules file] [
	unless exists? file [
		do make error! "File does not exist"
	]
	repend rules ['| make-rules skip load file 2]
]
