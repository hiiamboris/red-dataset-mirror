Red[]

#include %../common-tools.red

make-payload: func [
	data [any-type!]
	type [word!]
	compression [word! none!]
	/keep
] [
	unless find [#(none) zlib deflate gzip] compression [
		do make error! "Unknown compression type"
	]
	data: switch/default type [
		red [mold data]
		redbin [save/as make binary! 1000 data 'redbin]
	] [data]
	if compression [data: compress data compression]
	reduce [
		either keep [
			make-header/keep data type compression
		] [
			make-header data type compression
		]
		data
	]
]

make-header: func [
	data [any-type!]
	type [word!]
	compression [word! none!]
	/keep "Require reply in the same format"
	/local flags length
] [
	compression: either compression [
		(index? find [zlib deflate gzip] compression) << 2
	] [0]
	flags: to binary!
		(any [index? find [red redbin] type 0])
	or	compression
	or	((make integer! not not keep) << 5)
	length: to binary! length? data
	rejoin [
		#{}
		{RBDT}			; magic string (RedBin Data Transfer)
		#{01}			; RBDT version
		skip flags	2	; flags (we need just 16bits from 32bit number)
		length 			; data size
	]
]

process-header: func [
	header
	data
	/local flags result
] [
	; check for magic string
	unless equal? take/part header 4 #{52424454} [
		return false
	]
	result: reduce [
		'version		to integer! take header
		(
			flags: take/part header 2
			flags: reduce [
				 to integer! flags and #{0003}			; type
				(to integer! flags and #{001C}) >> 2	; compression
				(32 and to integer! flags)				; keep
			]
		'type		  ) pick [raw red redbin] 1 + flags/1
		'compression	pick [zlib deflate gzip] flags/2
		'keep			make logic! flags/3
		'length			to integer! take/part header 4
	]
	print [#rest-length length? header]
	append data header
	result
]

process-message: func [
	header
	message
] [
set 'msg message
	message/data: make binary! 100
	header: probe message/header: process-header header message/data
	if header/compression [
		message/data: decompress message/data header/compression
	]
	write/binary %client.rb message/data
	message/data: switch header/type [
		red [load message/data]
		redbin [load/as message/data 'redbin]
	]
	message
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
