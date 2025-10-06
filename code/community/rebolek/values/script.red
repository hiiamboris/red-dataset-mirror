Red []

; TODO: redquire
do %../red-tools/ansi-seq.red

; ---

tack: func [series value][unless find series value [append series value]]

join: func [
	"Trim rejoin"
	value
][
	rejoin trim reduce value
]

cat: func ["Prints content of file" file][print read file]

load-block: func ["Load data from string!. Always return block!." string][append copy [] load string]

script: func [
	file 
	data 
	/init 
	/local cache
][
	cache: #() 
	if init [clear cache] 
	either block? data [
		save-script file data put cache file data
	][
		switch data [show [print mold select cache file]]
	]
]

save-script: func [
	file 
	data 
	/local output value
][
	output: copy [Red []] 
	do-rule: [set value block! (append output value)]
	insert do-rule to issue! 'do ; we need to fool preprocessor :(
	parse data [
		some [
			set value word! (repend output [to set-word! value get value] new-line back back tail output true) 
		|	do-rule
 		]
	] 
	save file output
]

recall: func [
	name /local found history
][
	found: clear [] 
	foreach line history: system/console/history [
		if equal? rejoin [name: form name #":"] copy/part line 1 + length? name [append/only found line]
	] 
	print [uppercase name "was found" length? found "times."] 
	append history found: first skip tail found -2 found
]

add-help: func [name text][insert spec-of :name text]

get-lines: func [
	"Return number of lines"
	text
	/local lines
][
	lines: 1
	parse text [any [thru newline (lines: lines + 1)]]
	lines
]

type-stats: func [
	types
	/local out bars len length
][
	out: copy []
	bars: "⡀⡄⡆⡇⣇⣧⣷⣿"
	types: sort/skip/compare/reverse types 2 2
	length: 0
	foreach [type count] types [
		if length < len: length? form type [length: len]
	]
	; TODO: Can I do it in one pass?
	len: length? form length
	foreach [type count] types [
		repend out [
			pad/left form count 3 space
;			pad/left form count len ; FIXME: Why not work??
			pad form type length + 1
			append/dup copy "" #"⣿" count / 8
			pick bars count // 8
			newline
		]
	]
	out
]

show-func: func [
	name
	data
	/stats
	/tree
	/mark
		selection
	/with
		ctx
	/local out spec body
][
	set 'sscc selection
	spec: spec-info data/spec
	body: data/body
	data/info: any [data/info enumerate data/body]
	if stats [stats: type-stats body-of data/info/types]
	refs: collect [
		foreach ref spec/refs [
			keep reduce ['fg 'green mold ref space 'fg 'blue form select spec ref space]
		]
	]
	out: compose [
		bold fg red (uppercase form name) reset ": " 
		(either string? first data/spec [first data/spec][""])
		(newline)
		"Args: " fg blue (form spec/args) reset (newline)
		"Refinements: " fg green (refs) reset (newline)
		"Locals: " fg yellow (form spec/locals) reset (newline)
		"Values: " fg yellow (form length? data/body) "/" (form data/info/length) reset (newline)
	]
	if stats [append out stats]
	either tree [
		append out vt data/body
	][
		append out reduce [
;			'bold "Source: " 'reset newline
			newline
		]
		append out colorize-code/mark/with data/body selection any [ctx ve!/viewport] ; TODO: pass in more correct way
	]
	out
]

desc-spec: func [
	name 
	data
	/local len
][
	spec: spec-info data/spec
	reduce [
		'fg 'red 
		'bold name 'reset " has " 
		form len: length? spec/args " argument" either 1 = len [""]["s"] #"."
		newline
	]
]

spec-info: func [
	"Return simple dialect with specs description"
	; dialect format: [args [block of args] refs [block of refs] locals [block of locals] (/refinement [block of args] ...)]
	spec
	/local flatten out val ref args args-rule
][
	flatten: func [block][new-line copy block false]
	out: copy/deep [args [] refs [] locals []]
	args: []
	args-rule: [
		(clear args)
		any [set val any-word! (append args val) | block! | string!]
	]
	parse spec [
		args-rule (out/args: flatten args)
		any [
			/local args-rule (append out/locals flatten args)
		|	set ref refinement! (append out/refs ref)
			args-rule (repend out [ref flatten args])
		]
	]
	new-line/all out/refs false
	out
]

form-spec: func [
	"Return human readable specs of function"
	spec
	/local emit indent output value types string
][
	emit: func [value][append output rejoin [indent value newline]]
	indent: ""
	output: clear {}
	append output "[^/"
	append indent tab
	arg: [
		(types: string: none)
		set value any-word! 
		any [set types block! | set string string!] (
			value: mold value
			if types [append value rejoin [space mold types]]
			if string [append value rejoin [space mold string]]
			emit value
		)
	]
	ref: [
		(string: none)
		set value refinement!
		opt [set string string!] (
			value: mold value
			if string [append value rejoin [space mold string]]
			emit value
			append indent tab
		)
		any arg
		(remove indent)
	]
	parse spec [
		opt set value string! (emit value) ; help string
		any [arg | ref] (
			remove indent
			append output #"]"
		)
	]
	output
]

form-code: func [
	data
	/spacey
	/local output open close emit emit-space emit-line indent str value new
][
	emit-line: func [/local t][
		t: tail output
		if all [
			newline <> t/-1
			newline <> t/-2
		][append output newline]
	]
	emit-space: func [pos][
		append output either newline = last output [indent][
			pick [#" " ""] to logic! any [
				spacey
				not any [find "[(" last output find ")]" first pos]
			]
		]
	]
	emit: func [from to][
		emit-space from
		append output copy/part from to
	]
	open: charset "[("
	close: charset ")]"
	indent: ""
	output: clear {}
	parse mold data rule: [
		some [
			str:
			newline (emit-line)
		|	space
		|	open (emit str 1 emit-line append indent tab) rule
		|	close (emit-line remove indent emit str 1 emit-line) break
		|	skip (value: load/next str 'new if any [set-word? value set-path? value][emit-line] emit str new) :new
		]
	]
	remove output
]

; some useful rules:

pass-string1: [#"^"" some ["^^^"" | not #"^"" skip ] #"^""]
pass-string2: [
	#"{" (print "ps2") ; } - fool not-so-smart colorizer
	some ["^^{" | pass-string2 | not #"}" skip]
	#"}"
]
pass-string: [pass-string1 | pass-string2]

arg-rules: context [
	value: none
	numbers: charset nrs: "0123456789"
	illegal-chars: charset ilch: "[](){}^":;/@#$%^^, ^-^/!" ; NOTE ! is technically legal, but is forbiden in this dialect. May be added later, not high priority
	word-start: charset reduce ['not append copy nrs ilch]
	word-chars: charset reduce ['not ilch]
	non-start: union numbers illegal-chars
	word: [word-start any word-chars]
	arg-delimiter: charset " ,"
	arg-type: [#"!" copy value word]
]

parse-args: func [
	"Parse dialect and return map describing function args"
	dialect
	/local arg args name type help ref refs
][
	args: #()
	arg: [
		(type: help: none)
		set name any-word!
		opt set type block!
		opt set help string!
		(
			leaf/:name: copy #()
			leaf/:name/type: type
			leaf/:name/help: help
		)
	]
	parse dialect bind [
		opt set help string!
		(put leaf: args "help" help)
		any arg
		any [
			(help: none)
			set ref refinement!
			opt set help string!
			(leaf: args/(form ref): copy #())
			(put leaf "help" help)
			any arg
			(leaf: args)
		]
	] arg-rules
	args
]
make-args: func [
	"Construct spec dialect from spec map!."
	data
	/local dialect val value args refs
][
	data: copy/deep data
	append-help: func [data /local value][
		if value: select data "help" [
			append dialect value
			put data "help" none
		]
	]
	append-args: func [data value /local val][
		append dialect value
		if val: data/:value/type [append/only dialect val]
		if val: data/:value/help [append dialect val]
	]
	dialect: copy []
	args: clear []
	refs: clear []
	append-help data
	parse words-of data [
		some [
			set value word! (append args value)
		|	set value string! (append refs value)
		]
	]
	foreach value args [append-args data value]
	foreach value refs [
		append dialect to refinement! value
		append-help data/:value
		foreach val words-of data/:value [
			append-args data/:value val
		]
	]
	dialect
]

indent: func [
	"Insert indentation (modifies)"
	value 
	/by amount
][
	amount: any [amount 4]
	indentation: #"^-"
	insert value indentation
	parse value [
		some [
			newline end
		|	newline insert indentation
		|	skip
		]
	]
	value
]

enumerate: func [
	"return number of values in block and its subblocks"
	value
	/local length rule values mark count add-type
][
;	value: copy/deep value
	add-type: func [type /local v][
		values/types/:type: either v: values/types/:type [v + 1][1]
	]
	values: make map! [length: 0]
	values/types: make map! []
	length: 0
	count: [(
		values/length: values/length + 1
		add-type type?/word value
	)]
	parse value rule: [
		any [
			mark: [object! | map!] (mark/1: body-of mark/1) :mark rule
		|	ahead set value [block! | paren!] count into rule
		|	set value skip count	
		]
	]
	values
]

count-lines: func [data /local count][
	count: 0
	parse data [
		some [
			newline (count: count + 1)
		|	set value string! (parse value [some [newline (count: count + 1) | skip]])
		|	skip
		]
	]
	count
]

select-comment: func [series index][
	foreach [idx value] series [
		if equal? index idx [return value]
	]
	none
]

find-block: func [
	"Return start of block and its length from given position in text"
	text 
	/local start end
][
	; TODO: This is pretty naive implementation...
	start: index? find/reverse text #"["
	end: index? find text #"]"
	as-pair start end - start + 1
]

