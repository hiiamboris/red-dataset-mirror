Red[]

colorize-ctx: context [
; -- settings
	flat?: false	; keep result on one line or not?
	short?: false	; are we in inline block?
	annotate?: true ; add type info after word
	length: none	; maximum number of chars in output (NONE for everything)
	count?: true	; add value index before word
	syntax?: true	; add syntax highlighting 
	max-depth: none	; maximal depth of nested blocks to display ( - all)
	colors: #(default: default set-word: cyan path: magenta string: green number: yellow func: [bright yellow] block: red)
	annotation: ""
	selection: none
	comments: none
	jump-points?: false ; show jump points

; -- internal stuff
	value: none		; for parse rules
	char: none		; local var for some rules
	end-char: none	; another local var, should do something about it
	type: none		; local var, type of word
	count: 0		; keep total char count
	line-count: 0x0	; keeps value and chars count
	depth: 1		; keeps current depth FIXME: should start at 0/1, not 2
	sel-end: none
	index: none		; index in data (path!)
	action: none
	out: copy []
	break-line: none
	block-stack: []
	color: none
	jump-point: none
	jump-table: []

	index+: func [/local len][
		len: length? index
		index/:len: index/:len + 1
	]

; -- indentation
	indent: ""
	indentation: "    "
	ind+: does [insert indent indentation]
	ind-: does [remove/part head indent length? indentation]
	indi: does [rejoin ["<" length? indent "-" short? ">"]]
; -- emiting
	emit-line: func [/local t][
		t: tail out
		if all [
			not flat?
			newline <> t/-1 
			newline <> t/-2
		][
			either break-line [
				insert break-line newline
				insert next break-line copy indent ; TODO: check for empty indent
				break-line: none
			][
				append out newline
				emit-indent
			]
			line-count: as-pair 0 length? indent
		]
	]
	emit-indent: does [
		unless empty? indent [append out copy indent]
	]
	emit: func [
		dialect	"Dialect block with * as placeholder for value, colors as get-words"
		value 	"Value to display"
		/only "Do not increase index (for emitting control characters)"
		/tight "Do not add space (/only also does not add space)"
		/local val reset?
	][
		either all [dialect syntax?][
			replace dialect: copy dialect '* value
		][
			dialect: reduce [value]
		]
		parse dialect [
			some [
				char! (line-count/y: line-count/y + 1)
			|	set val string! (
					line-count/y: line-count/y + length? val
					count: count + length? val
				)
			|	change set val get-word! (select colors val) 
			|	skip
			]
		]
		line-count/x: line-count/x + 1
		all [
			length
			count > length
			append dialect "…"
			action: 'stop
		]
		if line-count/y > 78 [emit-line]
		unless only [index+]
		append dialect 'reset 
		; -- emit index
		if count? [
			append out compose [fg black bg green (form index) bg default]
		]
		; -- emit jump-point
		if all [not only jump-points?] [
			jump-point: copy any [jump-point "a`"]
			jump-point/2: jump-point/2 + 1
			if jump-point/2 = #"{" [ ;} <- need to fool up stupid colorizer
				jump-point/1: jump-point/1 + 1
				jump-point/2: #"a" 
			]
			repend jump-table [jump-point copy index]
			append out compose [bg yellow fg black (jump-point) bg default]
		]
		; FIXME: this adds selection background
		;		but adds it multiple times
		;		and is needed once only
		; -- add start of selection
		all [
			block? selection
			not empty? selection
			sel-end: copy selection/1
			sel-end/(length? sel-end): sel-end/(length? sel-end) + selection/2 - 1
			index >= selection/1
			index <= sel-end
			append out [bg yellow]
		]
		; -- add reset - end of selection
		all [
			sel-end
			not tight
			(length? sel-end) = length? index
			index >= sel-end
			reset?: true
			take/part selection 2
			sel-end: none
		] 
		; -- emit value
		append out dialect
		; -- emit comment
		; TODO: use select/only here
		if comments [
			foreach [idx value] comments [
				if equal? index idx [
					append out compose [(space) italic fg yellow "“" (copy value) "”" reset] ; TODO: this resets all!!!
				]
				break
			]
		]
		if reset? [append out 'reset]
		unless tight or only [append out space]
	]
	cleanup: func [/local clean clean?][
		clean: [take/last out clean?: false]
		until [
			clean?: true
			if "" = last out clean
			if space = last out clean
			if (rejoin [indent indentation]) = last out clean
			clean?
		]
	]
; -- rules
	init: [(
		clear out
		clear indent
		block-stack: head clear skip reduce [none false] 2
		short?: false
		count: 0
		line-count: 0x0
		action: none
		index: make path! [0]
	)]
	open-block: [(
		insert block-stack reduce [
			either block! = type? value [char: #"[" #"]"][char: #"(" #")"]
			short?: 8 > select enumerate value 'length
		]
		if equal? [#"]" #" "] copy/part skip tail out -2 2 [take/last out]
		emit/tight [fg :block *] char ; NOTE: opening block increases index, closing does not
		append index 0
		depth: depth + 1
		unless short? [
			ind+
			emit-line
		]
	)]
	close-block: [(
		take/last index
		depth: depth - 1
		; TODO: this line can fix some problems but brings others
		;break-line: none
		;cleanup
		set [char short?] take/part block-stack 2
		; TODO: move to emit
		end-char: get pick [space newline] short? or flat?
		unless short? [
			ind-
			emit-line
		]
		cleanup
		emit/only [fg :block *] char
		emit/only none end-char
		if all [not flat? not short?] [emit-indent]
		short?: second block-stack
	)]
	match-block: [
		ahead set value [block! | paren!]
		[
			if (any [not max-depth depth < max-depth])
				open-block
				into [any code]
				close-block
		|	skip (emit [*] "[...]")
		]
	]
	match-set-word: [
		set value [set-word! | set-path!] 
		(unless short? [emit-line])
		(color: quote :set-word)
		emit-value
	]
	code: [
		match-set-word
	|	set value [any-string! | char!] (color quote :string) emit-value
	|	set value number! (color: quote :number) emit-value
	|	set value path! (color: quote :path) emit-value
	|	match-block
	|	set value skip select-color emit-value 
	]
	select-color: quote (
		color: either all [
			word? value
			value? value
			type: get value
			any [
				op? :type
				native? :type
				action? :type
				function? :type
			]
		][colors/func][colors/default]
	)
	emit-value: quote (
		if '| = value [ ; HC newline for parse rules
			if all [not short? not flat?][break-line: tail out]
		]
		type: attempt [type? get/any value]
		types: [
			string! "🗩a"
			native! "🖳a"
			action! "🔨"
			image! "🖼 "
		]
		annotation: if annotate? [
			rejoin [
				pick "🅐 🅑 🅒 🅓 🅔 🅕 🅖 🅗 🅘 🅙 🅚 🅛 🅜 🅝 🅞 🅟 🅠 🅡 🅢 🅣 🅤 🅥 🅦 🅧 🅨 🅩 "
					(to integer! (first form type) - #"a") * 2 + 1
				space
			]
		]
		emit trim compose [fg (color) * (annotation)] mold value
	)
	rule: [
		init
		some [
			code
			[
				if (action = 'stop) break
			|	then ()	
			]
		]
	]
]
; TODO: move to context
colorize-code: func [
	data
	/flat "Do not add newlines"
	/part "Return only LENGTH characters"
		length
	/mark
		selection
	/with
		ctx
	/local out
][
	comments: none
	colorize-ctx/flat?: flat
	colorize-ctx/length: length
	colorize-ctx/selection: either selection [copy selection][none]
	; TODO: do this automatically
	if with [
		colorize-ctx/comments: ctx/comments
		colorize-ctx/annotate?: ctx/annotate?
		colorize-ctx/count?: ctx/count?
		colorize-ctx/syntax?: ctx/syntax?
		colorize-ctx/max-depth: ctx/max-depth
		colorize-ctx/jump-points?: ctx/jump-points?
	]
	colorize-ctx/jump-point: none
	clear colorize-ctx/jump-table
	out: colorize-ctx/out
	if function? data [data: reduce [spec-of body-of]]
	parse data colorize-ctx/rule
	; some cleanup
	if newline = first out [remove out]
	append out 'reset	
	out
]

