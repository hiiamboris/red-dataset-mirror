Red[
	Title: "Values - Red native developer environment"
	Notes: [
	]
	To-Do: [ 
{FIXME: Additional symbols (indexes, jump points, ... are not counted into max width.}
	]
	Quotes: [
		Feynman: {I learned very early the difference between knowing the name of something and knowing something.}
	]
	Resources: [
		https://www.greenfoot.org/frames/
		http://nickgravgaard.com/elastic-tabstops/
		http://leoeditor.com/
		https://www.microsoft.com/en-us/research/project/live-programming/
		http://www.pyxisystems.com/file/BoxerStructures.pdf
		https://shaunlebron.github.io/parinfer/#paren-how-it-works
	]
	
]

do %script.red
do %scan.red
do %colorize.red
do %help.red
do %tree.red
do %led.red 
do %demo.red

atd: func [series index][
	case [
		not path? index   [at series index]
		1 = length? index [at series index/1]
		true [
			; TODO: no error checking
			atd first at series first index next index
		]
	]
]

func!: context [
	spec:
	body:
	info:
	value:
	; TODO: stats, what else?
		none
]

ve!: context [
; -- internal stuff
mode: 'normal		; TODO: environment mode
action: none		; action to do after commands
selection: []
info: none
area: []
message: []
style: 'boring
max-width: 56
delay: 0			; delay after each command (for macro replay)
viewport: context [	; viewport related settings
	annotate?: false
	count?: false	; note: called COUNT to not clash with INDEX? function 
	syntax?: true
	comments: []
	max-depth: none
	jump-points?: false
]
log: []
; -- prompt management
prompts: context [
	default: "→"
	record-macro: "#"
]
prompt: prompts/default
	
; -- history
history: [] ; name of current history
histories: #(
	original: []
	main: []
	demo: []
)
select-history: func [name][
	history: system/console/history: histories/:name
]
; -- macro system
macro: []
macros: #()
record-macro?: false
macro-name: none
macro-speed: 0

; -- active script
script: []
filename: none
structure: []	; actual script structure [code, functions, objects]
code: []
functions: #()	; function cache 
objects: #()	; object cache

; -- active buffer
series: none	; actual edit buffer
active: none	; edited item
comments: viewport/comments

; -- plugins
plugins: []
plugin-cache: #()
plugin-rules: ['reserved]
load-plugin: func [
	name [word!]
	/local plugin filename rule
][
	filename: to file! rejoin [name %.red] ; TODO: add some prefix like %plugins/
	; TODO: some error checking
	plugin: context load filename
	plugin-cache/:name: plugin
	append plugins plugin
	append plugin-rules '|
	append plugin-rules bind plugin/ved-rule self
	if rule: select plugin 'led-rule [
		append led!/plugin-rules '|
		append led!/plugin-rules bind rule led!
	]
]

; -- support functions
report: func [type sub-type value /local show-value][
	show-value: [fg white " <" (form value) "> " fg red]
	message: copy switch type [
		error [[fg red bold "🙁 "]] 
		warn [[fg red bold "🚫 "]]
	]
	append message compose compose switch sub-type [
		no-value [[(show-value) "has no value."]]
		syntax [["Syntax error:" (show-value) "cannot be loaded."]]
		func-not-exists [["Function" (show-value) "does not exists."]]
		macro-not-exists [["Macro" (show-value) "does not exists."]]
		command-unknown [["Command" (show-value) "is unknown."]]
	]
	repend message ['reset newline]
]

numbers: charset "0123456789"
match-path: [some numbers any [#"/" some numbers]]

load-value: func [
	data
][
	parse data [
		match-path
	]	
]

make-find-rule: func [
	value 
	/local match
][
	match: copy/deep [
		(append selection copy/deep reduce [index 1]) ; TODO: expects length 1
	]
	insert match reduce ['quote value]
	match
]

view-active: func [/local name][
	unless active [exit]
	switch first active [
		functions [
			name: form second active
			area: show-func/mark/with name get active selection viewport
		]
		structure [
			area: commands/-view-structure
		]
	]
]

; TODO: rename and stabilize
update-view: func [
;	text
	/local lines
][
	lines: 1 + count-lines area
	ansi/do compose [
		cls 
		at 0x1 (area)
		at (as-pair 0 1 + lines) (status)
		at (as-pair 0 2 + lines) (message)
		at (as-pair 0 3 + lines)
	]
]

adjust-positions: func [
	"Adjust positions in selection when LENGTH values are inserted at INDEX"
	selection 
	index 
	length
][
	pos: length? index
	foreach [position len] selection [
		len: len
		if position >= index [position/:pos: position/:pos + length]
	]
]


; TODO: Make a map! - map does not provide context, so I can use same names without -prefix
commands: context [
	-append: func [value][]
	-insert: func [
		value 
		/local len
	][
		len: either block? value [length? value][1]
		foreach [position length] selection [
			insert atd series position value
			adjust-positions selection position len
		]
		view-active
	]
	-change: func [value /local index len type][
		unless selection [exit]
		index: 0
		len: either block? value [length? value][1]
		foreach [position length] selection [
			either 1 = len [
				type: type? first atd series position
				change atd series position to type value
				if length <> len [
					change at selection index * 2 + 2 len
				]
			][
				change/part atd series position value length
				if length <> len [
					change at selection index * 2 + 2 len
				]
			]
			index: index + 1
		]
		view-active
	]
	-remove: func [/local position length depth rest mark][
		while [not tail? selection][
			position: first selection
			length: second selection
			depth: length? position
			rest: skip selection 2
			while [not tail? rest][
				mark: first rest
				mark/:depth: mark/:depth + length
				rest: skip rest 2
			]
			remove/part atd series position length
			selection: skip selection 2
		]
		view-active
	]
	-make-structure: func [name][
		unless equal? %.red copy/part tail name -4 [
			append name %.red
		]
		filename: to file! name
		clear script
		clear structure
		clear code
		clear functions
		clear objects
		info: enumerate [] ; FIXME: stupid hack
		-view-structure
	]
	-make-function: func [
		"Value is block with [name spec body]"
		name
		spec
		body
		/local fn
	][
		fn: make func! []
		fn/spec: spec
		fn/body: body
		fn/value: func spec body
		functions/:name: fn 
		if not find structure active: to path! reduce ['functions name][
			append/only structure active
		]
		-view-function name
	]
	-mark-value: func [
		index
	][
		unless pair? index [index: as-pair index 1]
		unless selection [clear selection]
		repend selection [make path! reduce [index/x] index/y]
	]
	-clear-mark: does [
		clear head selection
		view-active
	]
	-move-mark: func [
		direction
		/local index back? passed? position depth move-mark
	][
		move-mark: does switch direction [
			back [back?: true [position/:depth: position/:depth - 1]]
			next [[position/:depth: position/:depth + 1]]
		]
		; TODO: move all selections?
		position: first selection
		depth: length? position
		index: atd series position
		case [
			any [ ; go level up
				all [not back? tail? next index]
				all [back? head? index]
			][
				passed?: false
				until [
					take/last position
					depth: depth - 1
					either back? [
						if all [
							block? first atd series position
							passed?: not head? atd series position
						][
							move-mark
						]
					][
						if passed?: not tail? next atd series position [
							move-mark
						]
					]
					passed?
				]
			]
			any [ ; go into nested block
				all [not back? block? index: first next index]
				all [back? block? index: first back index]
			][
				move-mark
				until [
					append position either back? [length? index][1]
					not block? index: first atd series position
				]
			]	
			true [move-mark]
		]
		selection/1: position
		view-active
	]
	-view-function: func [
		name	
		/stats
		/tree
		/local fun
	][
		unless fun: functions/:name [
			report 'warn 'func-not-exists name
			return area
		]
		active: to path! reduce ['functions name]
		series: fun/body
		case [
			stats	[show-func/stats form name fun]
			tree	[show-func/tree form name fun]
			true	[show-func/mark/with form name fun selection viewport]
		]
	]
	-view-functions: does [
		-view-structure/only [functions]
	]
	-view-object: func [
		value
		/local object text
	][
; NOTE: Objects are stored in `objects` as source code block, not as object.
;	That way we can inspect also additional code. However this function expects
;	object, not block. It should work with both.
		text: clear []
		either all [
			value
			object: context objects/:value
		][
			set 'o object
			; TODO: better view object source
			area: reduce ['fg 'yellow "Object: " form value newline 'reset]
			; TODO: error checking
			foreach word words-of object [
				set 'w word
				repend text [form word ": "]
				append text colorize-code/flat/with reduce [select object word] viewport
				append text newline
			]
			text
		][	; list objects
			-view-structure/only [objects]
		]
	]
	-view-structure: func [
		/only types
		/local text specs code keep keep? plural acts len number word fn
	][
		series: none
		types: any [types [functions objects code]]
		keep: func [value][
			if find types first word [
				append text compose head replace/all value 'newline #"^/"
			]
		]
		number: func [value][reduce ['fg 'yellow form value 'reset]]
		plural: func [string number][
			rejoin [
				string 
				either number = 1 [""]["s"]
			]
		]
		; TODO: Styling should be separate and cover more than one command
		boring: [
			bold fg cyan (form second word) "↦ " reset "["
			(trim/lines mold/only specs/args) "] "
			(number len: length? specs/refs) (space) (plural "ref" len) ", "
			(number len: length? specs/locals) (space) (plural "local" len) ", "
			(number len: length? code) "/" (number info/length) (space) (plural "value" len)
			"."
			(newline)
		]
		fancy: [
			bold fg cyan (form second word) "↦ " reset "["
			(trim/lines mold/only specs/args) "] "
			"🛠 " (number length? specs/refs) ","
			"🏡 " (number len: length? specs/locals) ","
			"📗 "(number len: length? code) "/" (number info/length) 
			"."
			(newline)
        ]
		acts: [
			functions [
				fn: functions/(second word)
				specs: spec-info fn/spec 
				code: fn/body
				fn/info: info: enumerate fn/body
				keep get style
			]
			objects [
				keep?: true
				specs: clear {}
				code: clear []
				info: enumerate get word
				foreach value get word [
					if all [keep? ((length? specs) + length? form value) >= max-width][append specs "…" keep?: false]
					if all [keep? set-word? value] [repend specs [form value space]]
					if set-word? value [append code to word! value]
				]
				keep [
					bold fg yellow "⊙ " (form second word) reset " has "
					(number len: length? code) "/" (number info/length) (space) (plural "value" len)
					": "
					(copy specs)
					(newline)
				]
			]
			code [
				specs: colorize-code/flat/part/with get word max-width viewport
				orig-spec: copy specs
				keep [
					fg green "❲" (form second word) "❳ " 
					(specs)
					(newline)
				]
			]
		]
		text: clear []
		foreach word structure [switch first word acts]
		append text 'reset
        save %text.tmp text
		text
	]
	-load: func [
		value 
		/local data dir
	][
		value: to file! value
		message: catch [
			case/all [
				empty? value [ ; return dir content
					throw form read %. ; do not continue with evaluation
				]
				not exists? value [ ; try to complete filename
					dir: read %./
					foreach file dir [
						if parse file [value to end] [
							value: file
							break
						]
					]
				]
				exists? value [ ; load file
					filename: value
					data: vs value
					script: data/script
					functions: data/functions
					objects: data/objects
					code: data/code
					structure: data/structure
					info: data/info
					; TODO: use `number` and `plural` here
					; TODO: 01F5AA would be better here but 128190 has better support
					throw reduce [
						'fg 'green "💾 " 
						'bold form filename 'reset " loaded, " 
						'fg 'cyan form length? words-of functions 'reset " func(s), " 
						'fg 'cyan form length? words-of objects 'reset " object(s), "
						'fg 'cyan form length? code 'reset " code block(s).^/"
					]
				]
				not exists? value [ ; still nothing, give up
					reduce ['fg 'red "💾 " 'bold form value 'reset " does not exist.^/"]
				] 
			]
		]
	]
	-save: func [value][
		; TODO: construct file from structure and save it
	]
	-find: func [
		value 
		/local match rule index index+ depth
	][
		unless series [
			; TODO: Return an error?
			return area
		]
		; TODO: does not search in object!/map!
		clear selection ; TODO: add refinemtnet to not clear selection
		index: make path! [1]
		depth: 1
		match: bind make-find-rule value 'index
		index+: [(index/:depth: index/:depth + 1)]
		block: [
			ahead [block! | paren!] (
				depth: depth + 1
				append index 1
			) into rule (
				take/last index
				depth: depth - 1
			) index+
		]
		; when matching block! by type, we need to reverse the rule
		; maybe there's simpler way, who knows...
		rule: pick [
			[any [[match | skip] index+ | block]]
			[any [block | [match | skip] index+]]
		] not not any ["block!" = value "paren!" = value]
		parse series rule
		view-active
	]
	-do: func [value /local out t][
		t: now/time/precise
		set/any 'out try [do value]
		unless value? 'out [out: ""]
		message: either error? out [
			out: form reduce bind system/catalog/errors/(out/type)/(out/id) out
			reduce ['fg 'red 'bold "😾 " out "." newline 'reset]
		][
			; NOTE: added newline at beginning to prevent problems in output
			reduce [newline 'fg 'green 'bold "😺 finished in " form now/time/precise - t "." newline 'reset]
		]
		reduce [out]
	]
	-call: func [value /local out][
		call/wait/output value out: clear ""
		message: out
	]
	-probe: func [value /local name modifieri ctx][
		; TODO: this modifier stuff should be somehow standartized
		modifier: all [find "%$" last value take/last value]
		either value? name: value [
			value: get value
			switch/default type?/word :value [
				function! [
					ctx: context [
						spec: spec-of :value 
						body: body-of :value
					]
					message: compose [
						cls
						at 0x0
						(
							; NOTE: This calls for APPLY
							switch/default modifier [
								#"%" [show-func/stats name ctx]
								#"$" [show-func/tree name ctx]
							][show-func name ctx]
						)
						(newline) reset
					]
				]
			][
				message: compose [
					(colorize-code/with reduce [value] viewport) (newline) reset
				]
			]
		][
			report 'error 'no-value value
		]
	]
	-comment: func [value /local path data][
		parse value [
			copy path match-path copy data to end ( ; set comment for specific path
			
			)
		|	copy data to end ( ; set comment for first selection or TODO: whole buffer
		)
		]
	]
	-help: func [value][
		compose [
			bg white fg black bold "VALUES - " italic "Red symbolic editor" reset newline
			(mold value)
		]
	]
	; TODO: this should be limited somehow
	-set: func [
		word 
		value
	][
		if word? value [value: get value]
		set in viewport word value
		view-active
	]
	-record-macro: func [name][
		record-macro?: true
		clear macro
		macro-name: name
		prompt: prompts/record-macro
	]
	-store-macro: func [][
		record-macro?: false
		take/last/part macro 2 ; remove this command
		macros/:macro-name: copy macro	
		save %macros.red macros
		; TODO: add message that macro was recorded and show length or something
		prompt: prompts/default
	]
	-remove-macro: func [name][
		macros/:name: none
		save %macros.red macros
	]
	-list-macros: func [/local out][
		out: clear []
		foreach value words-of macros [
			repend out [
				'bold form value ": " 'reset 
				mold macros/:value
				newline
			]
		]
		out
	]
	-show-macro: func [name][
		message: clear []
		repend message [
			'bold form name ": " 'reset 
			mold macros/:name
			newline
		]
	]
	-macro-speed: func [value][
		macro-speed: 10 - value / 10.0
	]
	-play-macro: func [name][
		either macros/:name [
			delay: macro-speed
			parse-ved macros/:name
			delay: 0
		][
			report 'error 'macro-not-exists name
		]
	]
	-demo: func [
		value
		/local data
	][
		case [
			not value [
				mode: 'demo
				select-history 'demo
			]
			mode = 'demo [
							
			]
		]
		data: demo!/process-led value
		switch first data [
			show [
				area: second data 
			]
			quit [
				mode: 'normal
				select-history 'main
				area: reduce [
					newline 'bold "PIP PIP! Demo mode ended!" 'reset
					newline
				]
			]
		]
		view-active
		update-view
	]
	-jump: func [
		value
	][
		; TODO: implement as plugin
		case [
			not value [
				mode: 'jump
				viewport/jump-points?: true
			]
			mode = 'jump [
				set 'jv value
				take/last history
				; TODO: jump-table should be part of ve!, not colorize-ctx (or both)
				repend clear selection [select colorize-ctx/jump-table value 1]
				mode: 'normal
				viewport/jump-points?: false
				view-active
				update-view
			]
		]
		view-active
	]
	-exit: func [][
		action: 'exit
		select-history 'original
	]
	-fail: func [value][
		report 'error 'command-unknown value
	]
]

ved!: context [
	ved-rules: [
		some [
			'insert	set-value	(area: -insert value)
		|	'append	set-value
		|	'edit	set-value
		|	'change	set-value	(area: -change value)
		|	'clear	'mark		(area: -clear-mark)
		|	'move	'mark set value ['next | 'back] (-move-mark value)
		|	'mark	'value
		|	'remove				(-remove)
		|	'find	set-value	(area: -find value)
		|	'view [
				'structure		(area: -view-structure)
			|	'function		(type: none) 
				set-value opt [set type ['stats | 'tree]] (
					area: switch/default type [
						stats	[-view-function/stats value]
						tree	[-view-function/tree value]
					][-view-function value]
				)
			|	'functions		(-view-functions)
			|	'object
				set-value 		(-view-object value)
		]
		|	'make	[
				'structure set-value (area: -make-structure value)
			|	'function copy value 3 skip (
					insert value '-make-function
					area: do value
				)
		]
		|	'do		set-value	(area: -do value)
		|	'call	set-value	(-call value)
		|	'ved	into ved-rules
		|	'probe	set-value ; TODO: help
		|	'load	set-value	(-load value)
		|	'save	set-value	(-save value)
		|	'record	'macro	set-value	(-record-macro value)
		|	'store	'macro				(-store-macro)
		|	'play	'macro	set-value	(-play-macro value)
		|	'show	'macro	set-value	(-show-macro value)
		|	'list	'macros				(area: -list-macros)
		|	'set 'macro 'speed set-value (-macro-speed value)
		|	'set	set type skip set-value (area: -set type value)
		|	'comment set-value
		|	'jump	set-value	(area: -jump value)
		|	'help	set-value	(area: -help value)
		|	'demo	set-value	(-demo value)
		|	'exit	(-exit)
		|	'fail	set-value	(-fail value)
		|	plugin-rules
		]
	]
	set-value: [set value skip]

	value: none
	type: none

	set 'parse-ved func [
		"Parse Values Editor Dialect"
		dialect
	][
		repend log [now copy dialect]
		new-line skip tail log -2 true
		; TODO: macro recording/replaying
		if record-macro? [
			append macro dialect
		]
		parse dialect bind ved-rules commands ; TODO: instead of binding, add commands to this context?
		update-view
	]
]

do-command: func [command][
	clear message
	if empty? command [command: last history]
	parse-ved parse-led command
]

status: does [
	either info [
		compose [
			bold
			(rejoin ["^/Script: " filename " (" length? script "/" info/length ") - " mold selection])
			reset
			(newline)
			(inspect-word)
		]
	]["No script loaded."]
]

inspect-word: func [
	/local word
][
	if any [
		empty? selection
		empty? series
		not word? word: first atd series first selection
	][return ""]
	reduce [
		"❓ "
		form :word
		'bold " [" mold type? get/any :word "] " 'reset
		form class-of context? :word
	]
]

load-macros: does [
	if exists? %macros.red [
		macros: load %macros.red
	]
]

init: func [
	/local command value
][
	action: none
	histories/original: system/console/history
	select-history 'main
	load-macros
	load-plugin 'git ; TODO: move elswhere
	ansi/do [reset cls at 1x1]
]
set 've func [][
	init
	forever [
		command: ask prompt
		switch mode [
			normal	[do-command command]
			insert	[]
			jump	[commands/-jump command]
			demo	[commands/-demo command]
		]
		switch action [
			exit [break]
		]
	]
]
]

