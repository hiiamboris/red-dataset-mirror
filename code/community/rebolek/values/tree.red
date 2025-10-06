Red[]

; NOTE: workaround for Core version
unless value? 'event! [event!: :object!]
unless value? 'image! [image!: :object!]

tree!: context [
	stem: []
	last-branch: none
	value: none
	max-length: 20
	max-indent: 0

	indent: "├"
	ind+: does [
		insert indent #"│"
		if max-indent < length? indent [max-indent: length? indent]
	]
	ind-: does [remove indent]

	form-type: func [type][rejoin [#"[" pad type 13 #"]"]]

	emit-indent: does [
		append stem form length? indent
		append stem copy indent 
	]
	emit: func [value /word /local type][
		type: form type? value
		if word [append type rejoin [#"/" copy/part form attempt [type? get/any value] 8]]
		value: mold/flat/part value max-length ; TODO: add ...
		repend stem [
			'fg 'yellow form-type type 'reset space #compensate
			form value newline
		]
	]

	init: [
		clear stem
	]
	compensate: func [/local length] [
		forall stem [
			if #compensate = first stem [
				; NOTE: The position (-6) may change, so watch this carefully!!!
				length: length? stem/-6
				stem/1: append/dup copy "" space max-indent - length
			]
		]
	]

	match-block: [
		ahead set value [block! | paren!] (
			emit-indent
			last-branch: back tail stem
			emit either block? value [[]][quote ()]
			ind+
		)
		into main-rule
		fix-last-branch
		(ind-)
	]
	match-word: [
		set value word! (
			emit-indent
			last-branch: back tail stem
			emit/word value
		)
	]
	match-anything: [
		set value skip (
			emit-indent
			last-branch: back tail stem
			emit value
		)
	]
	fix-last-branch: [(
		change back tail first last-branch #"└"
	)]

	main-rule: [
		any [
			match-block
		|	match-word
		|	match-anything
		]
		fix-last-branch
	]

	set 'vt func [
		dialect
	][
		init
		repend stem [#"🏠" newline]
		parse dialect main-rule
		compensate stem
		stem
	]
]

tc: [some "code" 'for testing: [here is block [another block] back] back #to %root #(map: is the: key)]
tt: does [ansi/do x: vt tc]
