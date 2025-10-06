Red[]

do %../values.red
do %../scan.red
do %../../red-tools/func-tools.red

; -- support ----------------------------------------------------------------

pick-random: func [
	probabilities	[map!]
	/local number treshold key value
][
	number: random 100%
	treshold: 0%
	foreach [key value] probabilities [
		treshold: treshold + value
		if number < treshold [
			return to word! key
		]
	]
]

inc-key: func [
	map	[map!]
	key	[any-type!]
	/by value
][
	value: any [value 1]
	map/:key: either map/:key [map/:key + value][value]
]

merge-maps: func [
	map1	[map!]
	map2	[map!]
][
	foreach [key value] map2 [
		inc-key/by map1 key value
	]
	map1
]

merge-blocks: func [
	block1	[block!]
	block2	[block!]
][
	foreach [key value] block2 [
		either block1/:key [
			mark: next find/only block1 key
			mark/1: block1/:key + value
		][
			repend block1 [key value]
		]
	]
	block1
]

convert-count: func [
	"Convert type counts to probabilities"
	data	[map!]
	/local total key value type count
][
; -- TODO: This expect old format map!, rewrite using new format
	foreach [key value] data [
		total: 0
		foreach [type count] value [
			total: total + count
		]
		foreach [type count] value [
			value/:type: to percent! count * 1.0 / total
		]
	]
	data
]

foreach-script: func [
	path
	body
	/omit dirs
	/local dir filename data
][
	dir: read path
	foreach file dir [
		filename: rejoin [path file]
		either dir? filename [
			unless find dirs filename [
				foreach-script/omit filename body dirs
			]
		][
			if all [
				equal? suffix? filename %.red 
				block? data: load filename
			][
				do bind body 'filename
			]
		]
	]
]

sort-map: func [
	map	[map!]
][
	sort/skip/compare/reverse body-of map 2 2
]

foreach-file: func [
	"Evaluates body for each file in directory"
	'word		[word!]
	path		[file!]
	body		[block!]
	/only	"Evaluate only for files fulfilling condition"
		cond	[block!]
	/local dir filename
][
	cond: any [cond true]
	dir: read path
	foreach :word dir [
		filename: rejoin [path get :word]
		either dir? filename [
			foreach-file/only :word filename body cond
		][
			set :word filename
			all [
				do bind cond :word
				do bind body :word
			]
		]
	]
]

; -- scanning ---------------------------------------------------------------

scan-dir: func [
	path	[file!]
	/omit
		dirs
	/local result key value
][
	result: copy #()
	foreach-script/omit path [
		data: vs filename
		foreach [key value] data/info/types [
			result/:key: either result/:key [
				result/:key + value
			][
				value
			]
		]
	] dirs
	result
]

scan-script: func [
	script [file! block!]
	/local result
][
	if file? script [script: load script]
	result: copy #()
	get-types script result
]

get-types: func [
	block	[block!]
	result	[map!]
	/local type block-results
][
	foreach value block [
		type: type?/word value
		inc-key result type
		if block? value [
			block-results: get-types value result
		]
	]
	result
]

; -- probabilities ----------------------------------------------------------

get-word-count: func [
	"Return number of what types follow each word"
	block [block!]
	/ahead steps "Look ahead steps. Default is 1"
	/with result
	/local value type follows mark count
][
	steps: any [steps 1]
	unless result [
		result: copy #()
		put result "count" copy #()
	]
	forall block [
		value: block/1
		switch type?/word value [
			block! [
				get-word-count/ahead/with value steps result
;				merge-blocks result count
			]
			word! [ ; TODO: path! also?
			; -- increase word count
				count: select result "count"
				count/:value: either count/:value [count/:value + 1][1]
			; -- update follow info
				unless result/:value [result/:value: copy []]
				follows: copy/part next block steps
				forall follows [follows/1: type?/word follows/1]
				either mark: find/only result/:value follows [
					mark/2: mark/2 + 1
				][
					repend result/:value [follows 1]
				]
			]
		]
	]
	result
]

get-count: func [
	"Return number of what types follow each type"
	block [block!]
	/ahead steps "Look ahead steps. Default is 1"
	/with result
	/local value type follows mark
][
	steps: any [steps 1]
	result: any [result copy #()]
	forall block [
		value: block/1
		type: type?/word value
		unless result/:type [
			result/:type: copy []
		]
		follows: copy/part next block steps
		forall follows [follows/1: type?/word follows/1]
;		print ["HERE:" block/1 newline "AFTR:" follows]
		either mark: find/only result/:type follows [
			mark/2: mark/2 + 1
		][
			repend result/:type [follows 1]
		]
		if equal? 'block! type [
			get-count/with block/1 result
		]
	]
	result
]

get-lengths: func [
	"Return lengths of blocks, object, maps in given block"
	block [block!]
	/with result
][
	result: any [
		result copy/deep #(
			block: []
			map: []
			object: []
		)
	]
	foreach value block [
		switch type?/word value [
			block!	[
				append result/block length? value
				get-lengths/with value result
			]
			map!	[
				append result/map length? value
				get-lengths/with values-of value result
			]
; -- NOTE: There is no literal format for `object!` so this condition
;			is never fullfiled
			object!	[
				append result/map length? keys-of value
				get-lengths/with values-of value result
			]
		]
	]
	result
]

get-dir-count: func [
	path
	/ahead steps
	/omit dirs
	/local result count key value
][
	steps: any [steps 1]
	result: #()
	foreach-script/omit path [
		count: get-count/ahead data steps
		foreach [key value] count [
			either result/:key [
				merge-blocks result/:key count/:key
			][
				result/:key: value
			]
		]
	] dirs
	result
]

get-dir-lengths: func [
	path
	/ahead steps
	/omit dirs
	/local result lengths key value
][
	result: any [
		result copy/deep #(
			block: []
			map: []
			object: []
		)
	]
	foreach-script/omit path [
		lengths: get-lengths data
		foreach [key value] lengths [
			append result/:key value
		]
	] dirs
	result
]

get-dir-word-count: func [
	path
	/ahead steps "Look ahead steps. Default is 1"
	/with result
	/omit dirs
;	/local value type follows mark count
][
	steps: any [steps 1]
	unless result [
		result: copy #()
		put result "count" copy #()
	]
	foreach-script/omit path [
		count: get-word-count/ahead data steps
		foreach [key value] count [
			either result/:key [
				if block? result/:key [
					merge-blocks result/:key count/:key
				]
			][
				result/:key: value
			]
		]
		merge-maps select result "count" select count "count"
	] dirs
	result
]

; -- other funcs ------------------------------------------------------------

check-locals: func [
	"Check function for missing and extra local words"
	spec	[block!]
	body	[block!]
	; TODO: support for external words
][
	locals: copy []
	args: copy []
	words: copy []
	; -- get args and locals from spec
	parse spec [
		any [	;args
			set value word! (append args value)
			opt block!
			opt string!
		]
		any [	; refinements
			not /local refinement!
			opt string!
			any [
				set value word! (append args value)
				opt block!
				opt string!
			]
		]
		opt [
			/local
			copy locals to end
		]
	]
	locals: exclude locals args
	; -- guess locals from body
	set-rule: [
		'set
	|	set/any
	; TODO: /case, /only, /some and combinations
	]
	parse body rule: [
		some [
			set value set-word! (append words to word! value)
		|	'foreach set value [word! | block!] (append words value)
		|	set-rule set value lit-word! (append words to word! value)
		|	ahead [block! | paren!] into rule
		|	skip
		]
	]
	diff: difference exclude words args locals
	; -- return results
	to map! reduce [
		'args new-line/all args off
		'missing new-line/all intersect diff words off
		'extra new-line/all intersect diff locals off
	]
]

check-funcs: func [
	"Check functions in block for missing and extra local words"
	block	[block!]
	/local result rule func-rule
][
	result: copy #()
	func-rule: [
		set name set-word!
		'func
		set spec block!
		set body block!
		(result/:name: check-locals spec body)
	]
	parse block rule: [
		some [
			ahead block! into rule
		|	func-rule
		|	skip
		]
	]
	result
]

parse-checker!: context [

	parse-words: none
	value: none
	block: none

	parse-keywords: [
	; -- matching
		'ahead rule
	|	'end
	|	'none
	|	'not rule
	|	'opt rule
	|	'quote value
	|	'skip
	|	'to rule
	|	'thru rule
	; -- control flow
	|	'break
	|	'if expr ; TODO: it's actually (expr)
	|	'into rule
	|	'fail
	|	'then
	|	'reject
	; -- iteration
	|	'any rule
	|	'some rule
	|	'while rule
	; -- extraction
	|	'collect rule ; TODO: it's actually [rule]
	|	'collect 'set word rule ; dtto
	|	'collect 'into word rule ; dtto
	|	'copy word rule
	|	'keep expr ; TODO: it's actually (expr)
	|	'set word rule (print ["**SET" word-name])
	; -- modification
	|	'insert opt 'only value
	|	'change opt 'only value
	|	'remove rule
	; -- marking
	|	set-word!
	|	get-word!
	; -- matching
	|	[any-string! | lit-word!]
	|	set x word! (print ["panic at the streets of london!" x])
	; TODO: repeat (one or two numbers)
	; -- alternate rule
	|	['| rule]
	]

	word: [set word-name word!]

	expr: [paren!] ; TODO

	rule: [
		ahead block! (print "going one level deeper") into rule
	|	p: (print ["looking for keywords: " mold p]) any parse-keywords
	]

	parse-rules: [
		; TODO: just a dummy rule for testing
;		copy rules to end (probe rules)
		some [rule]
	]

	main-rule: [
		some [
			; NOTE: `ahead word!` required due to false postives because of Red bug
			p: ahead word! 'parse (print ["---------------------------------^/parse matched at '" trim/lines copy/part mold copy/part p 3 20 "'"])
			opt set-word!
			[word! | block!]	; parse input
			opt set-word!
			opt [				; if rules are word!, get them
				ahead set value word!
				mark:
				change only word! (get-word block value)
				:mark
			]
			(print "now parsing parse rules")
			into parse-rules
		|	ahead block! into main-rule
		|	skip
		]
	]

	set 'match-parse func [
		"Find parse rules in block"
		input	[block!]
		/local value
	][
		block: input
		parse-words: make block! 100
		parse input main-rule
		parse-words
	]
]

get-word: func [
	"Find word's value in a block recursively and return it"
	block	[block!]
	word	[word!]
	/local rule
][
	word: to set-word! word
	parse block rule: compose/deep [
		some [
			ahead set-word! quote (word) set value skip (to paren! [return value])
		|	ahead block! into rule
		|	skip
		]
	]
]

; -- generating -------------------------------------------------------------

generate-script: func [
	probabilities	[map!]
	length			[integer!]
	/local result type value
][
; -- TODO: This expect old format map!, rewrite using new format
	result: copy []
	type: random/only keys-of probabilities
	loop length [
		value: make-type compose [random (type)]
		append result value
		type: pick-random probabilities/:type
	]
	result
]
