Red[
	Note: [
		{Because ^^ is shitty delimiter in Red context, \ can be used as
		alternative inverted section character}
	]
	Bugs: [
{
	mustache "{{\user}}" none
	Error in GET-VALUE
	It probably should get just ignored
}
	]
]

true?: func [value][not not :value]
false?: func [value][not :value]

html-escape: func [data [string!]][
	data: copy data
	parse data [
		any [
			change #"&" "&amp;"
		|	change #"<" "&lt;"
		|	change #">" "&gt;"
		|	change #"^"" "&quot;"
		|	change #"^'" #"^(27)"
		|	skip
		]
	]
	data
]

m: context [

	ctx:
	ctx-stack:
	act:
	list:
	item:
	value:
	stack:
	output:
	result:
	section-name:
	section-content:
		none

	push-state: func [][
		insert stack result
		result: copy ""
		insert ctx-stack ctx
	]

	pop-state: func [/with action /local temp][
		temp: result
		if with [temp: action temp]
		result: take stack
		append result temp
		ctx: take ctx-stack
	]

	dlm-start: "{{"
	dlm-end: "}}"
	dlm-slen: 2
	dlm-elen: 2
	sec-end: "{{/" ;}}
	sec-elen: 3

	escaped-value: [
		[
			#"{" copy value to #"}" skip
		|	#"&" skip copy value to dlm-end
		]
		(append result get-value value)
	]
	normal-value: [
		copy value to dlm-end
		(append result html-escape form get-value value)
	]
	section: [
		dlm-start set sigil [#"#" | #"^^" | #"\"]
		copy section-name to dlm-end dlm-elen skip opt newline ; }
		(
			value: get-value section-name
			cond: switch sigil [
				; FIXME: relying on empty string is not the proper way to do this
				;		this would need a change in GET-VALUE (return NONE instead?)
				; TODO: Handling the condition can be certainly done in a simpler way
				#"#" [[not empty? :value]]
				#"^^" #"\" [
					[any [
						false? :value 
						all [block? :value empty? value]
						all [string? :value empty? value]
					]]
				]
			]
		)
		[
			if (probe do probe cond)
			copy section-content to sec-end sec-elen skip
			section-name dlm-end opt newline
			emit-section
		|	thru sec-end section-name dlm-end ; FALSE value (ignore content)
		]
	]
	emit-section: quote (
	;	print [type? value :value]
		switch/default type?/word :value [
			block! [
				push-state
				list: value
				foreach item list [
					ctx: item
					parse section-content rule
				]
				pop-state
			]
			function! [
				push-state
				act: :value
				parse section-content rule
				pop-state/with :act
			] 
			map! object! [
				push-state
				ctx: :value
				parse section-content rule
				pop-state
			]
		][parse section-content rule]
	)

	match-partial: [
		dlm-start #">" any space copy value to dlm-end dlm-elen skip
		(
			value: to file! rejoin [value %.mustache]
			value: read value ; TODO: Check for existence
			push-state
			parse value rule
			pop-state
		)
	]

	set-delimiter: [
		dlm-start #"="
		copy value to space skip
		(dlm-start: value)
		(dlm-slen: length? dlm-start)
		copy value to dlm-end dlm-elen skip
		(dlm-end: value)
		(dlm-elen: length? dlm-end)
		(sec-end: rejoin [dlm-start #"/"])
		(sec-elen: dlm-elen + 1)
	]

	match-comment: [dlm-start #"!" thru dlm-end]

	match-file: [
		dlm-start #"%" copy value to dlm-end dlm-elen skip
		(value: to file! value)
		(unless suffix? value [append value %.red])
		(ctx: context load value)
	]

	match-code: [
		dlm-start #":" copy value to dlm-end dlm-elen skip
		(append result do value)
	]

	match-value: [
		dlm-start [
			escaped-value
		|	normal-value
		] dlm-end
	]

	char: [set value skip (append result value)]

	rule: [
		some [
			section
		|	set-delimiter
		|	match-comment
		|	match-partial
		|	match-file
		|	match-code
		|	match-value
		|	char
		]
	]

	get-value: func [
		name
		/local elem value
	][
		#TODO "Should check context recursively from bottom up"
		either find name #"/" [
			name: load name
			value: ctx
			foreach elem name [value: select value elem]
		][
			set/any 'value select ctx to word! trim name
			unless value? 'value [value: none]
		]
		if name = '. [value: item]
		if none? :value [value: ""]
		:value
	]

	set 'mustache func [
		"Parse mustache data"
		data [string!]				"Mustache formated string"
		obj [object! map! none!]	"Object with mustache data"
	][
		ctx: any [obj system/words]
		ctx-stack: copy []
		stack: copy []
		output: result: copy {}
		parse data rule
		result
	]

; -- end of context
]

