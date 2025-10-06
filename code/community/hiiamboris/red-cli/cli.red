Red [
	Title:   "Simple & powerful command line argument validation system"
	Author:  @hiiamboris
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Bugs: {
		- Red supports system/script/header but only a very limited implementation,
		  so you may have to explicitly set header fields after all #includes
		- When compiled, words lose their case info, so
		  if program name is generated from a word, it will always be in lower case
	}
	Usage: {
		my-program: function [operands .. /switches /options arguments] [code]
		cli/process-into my-program
	}
	Bibliography: {
		[1] "Program Argument Syntax Conventions"
			https://www.gnu.org/software/libc/manual/html_node/Argument-Syntax.html
		[2] "POSIX Utility Syntax Guidelines"
			https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html#tag_12_02
		[3] "Portable character set"
			https://en.wikipedia.org/wiki/Portable_character_set
		[4] "Learning the Bash. Special Characters and Quoting"
			https://www.oreilly.com/library/view/learning-the-bash/1565923472/ch01s09.html
	}
]


;; for debugging needs /red-common repo
; #include %../common/debug.red
; #include %../common/assert.red

cli: context expand-directives [								;@@ expand = boring workaround for #4128
	#debug off

	;; ERROR CODES refer to themselves, in case one wants to print them
	error-codes: context [
		ER_FEW:    'ER_FEW			;-- not enough operands
		ER_MUCH:   'ER_MUCH			;-- too many operands
		ER_LOAD:   'ER_LOAD			;-- provided value is invalid
		ER_TYPE:   'ER_TYPE			;-- provided value is of wrong type
		ER_EMPTY:  'ER_EMPTY		;-- no value provided
		ER_VALUE:  'ER_VALUE		;-- value provided where no value expected
		ER_CMD:    'ER_CMD			;-- unknown command (during dispatching)
		ER_NOCMD:  'ER_NOCMD		;-- command is required but not provided
		ER_OPTION: 'ER_OPTION		;-- unknown option name
		ER_FORMAT: 'ER_FORMAT		;-- unknown option format
		ER_CHAR:   'ER_CHAR			;-- unsupported char in option name
	]

	;; supported argument FORMAT TYPES
	loadable!:  make typeset! [integer! float! percent! logic! url! email! tag! issue! time! date! pair!]
	
	;; supported DATATYPES in function typesets
	supported!: union loadable! make typeset! [string! file! block!]

	;; used when auto-adding --version in `syntax-for`; format is that of internal spec (see prepare-spec)
	version-option: make map! compose [
		operand?	(no)
		names		[/version]
		arg-name	(none)
		docstring	"Display program version and exit"
		types		(none)
	]
	help-option: make map! compose [
		operand?	(no)
		names		[/h /help]
		arg-name	(none)
		docstring	"Display this help text and exit"
		types		(none)
	]


	;; ████████████  DEFAULT HANDLERS  ████████████
	

	handle-error: function [
		"Default CLI error handler; returned value is passed down by process-into"
		state     [map!]   "State before failure"
		complaint [block!] "[error-code error-message]"
	][
		print next complaint									;@@ TODO: output to stderr (not yet in Red)
		quit/return 1											;-- nonzero code signals failure to scripts running this program
	]
	
	handle-help: function [
		"Default CLI help provider; should return true if provides help"
		state [map!]
	][
		print internal/help-for state
		quit/return 0											;@@ can I move quit somewhere? state/return: 0 ?
	]
	
	handle-version: function [
		"Default CLI version provider; should return true if provides version"
		state [map!]
	][
		print internal/version-for state
		quit/return 0
	]
	
	get-default-exename: function ["Get the executable/script name without path"] [
		any [
			attempt [form basename? system/options/script]		;-- when run as `red script.red`
			attempt [form basename? system/options/boot]		;-- when run as a compiled exe (options/script = none)
		]
	]

	get-default-title: function ["Get current script's title"] [
		any [
			attempt [system/script/title]
			attempt [system/script/header/title]
		]
	]
		
	get-default-version: function ["Get current script's version (falls back to date)"] [
		form any [
			attempt [system/script/header/version]				;-- from the header
			attempt [first query system/options/script]			;-- script modification date if interpreted
			#do keep [now/date]									;-- compilation date otherwise
		]
	]
		

	;; ████████████  GENERALLY USEFUL HELPERS  ████████████
	
	
	;; `complain` is used to signal an error in supplied command line
	;; unlike runtime errors which signify a bug, throws are meant to deliver CLI syntax errors to the user
	complain: function [
		"Throw a CLI processing exception"
		about [block!] "[error-code message tokens...]"
	][
		#assert [word? :about/1]
		code: bind about/1 error-codes
		msg:  form reduce next about
		throw/name reduce [code msg] 'complaint
	]
	
	fail: function [											;@@ use ERROR macro
		"Throw a script runtime error"
		spec [block!] "Rejoined as string"
	][
		do make error! append copy {} reduce spec
	]

	default: function [											;@@ should be generally available
		"If SUBJ's value is none, set it to VAL"
		'subj [set-word! set-path!]
		val   [default!] "New value"
	][
		if none =? get/any subj [set subj :val]
		:val
	]

	only: function [											;@@ should be generally available?
		"Turn falsy values into empty block (useful for composing Draw code)"
		value [any-type!] "Any truthy value is passed through"
	][
		any [:value []]		;-- block is better than unset here because can be used in set-word assignments
	]
			
	delimit: function [											;@@ should be generally available
		"Insert delimiter between all items in the list"
		list      [block!]
		delimiter [any-type!]
	][
		parse list [collect [keep skip any [end | keep (:delimiter) keep skip]]]
	]
	
	#assert [[1 - 2 - 3] = delimit [1 2 3] '-]
	
	join: function [											;@@ should be generally available
		"Delimit a list and join as a string"
		list      [block!]
		delimiter [any-type!]
	][
		to string! delimit list :delimiter
	]
	
	maximum-of: function [										;@@ should be generally available
		"Get peak value in the list"
		list [block!]
	][
		peak: :list/1
		foreach x next list [if :peak < :x [peak: :x]]
		peak
	]
		
	basename?: function [										;@@ should be generally available
		"Get filename without extension"
		file [file! string!]
	][
		also file: last split-path to-red-file file
			clear find/last file #"."
	]
				
	option?: func [
		"Check if ARG is an option name"
		arg	[string!]
	][
		all [
			arg/1 = #"-"		;-- [1] Arguments are options if they begin with a hyphen delimiter (‘-’)
			arg <> "-"			;-- [1] A token consisting of a single hyphen character is interpreted as an ordinary non-option argument
			arg <> "--"			;-- [1] The argument ‘--’ terminates all options
		]
	]
	
	compiled?: function ["Check if current script is compiled"] [
		none? system/options/script								;@@ is there a better way to check?
	]
		

	;; ████████████  DEFAULT FORMATTERS  ████████████

		
	version-for: function [
		"Returns version text for the PROGRAM"
		'program		[word! path! lit-word! lit-path!]
						"Name of a function, or of a context with functions"
		/name			"Override program name"
			name'		[string!] "By default inferred from script header or `program` argument"
		/version		"Override program version"
			version'	[float! tuple! date! string!] "Defaults to current date"
		/brief			"Include only the essential info"
	][
		internal/version-for/:brief internal/extract-state context? 'program
	]

	synopsis-for: function [
		"Return short synopsis line for the PROGRAM"
		'program		[word! path! lit-word! lit-path!]
						"Name of a function, or of a context with functions"
		/no-version		"Suppress automatic creation of --version argument"		;-- these do affect [options] presence
		/no-help		"Suppress automatic creation of --help and -h arguments"
		/exename		"Override executable name"
			exename'	[string!] "By default inferred from command line"
	][
		internal/synopsis-for internal/extract-state context? 'program
	]
	
	syntax-for: function [
		"Return usage text for the PROGRAM"
		'program		[word! path! lit-word! lit-path!]
						"Name of a function, or of a context with functions"
		/no-version		"Suppress automatic creation of --version argument"
		/no-help		"Suppress automatic creation of --help and -h arguments"
		/exename		"Override executable name"
			exename'	[string!] "By default inferred from command line"
		/below			"Add custom explanation after the syntax in help output"
			below'		[string!]
		/columns		"Specify 5 widths of columns: indent, short option, long option, argument, description"
			columns'	[block!] "Default: [2 3 13 13 44]"
	][
		internal/syntax-for internal/extract-state context? 'program
	]

	help-for: function [
		"Return help text (version and syntax) for the PROGRAM"
		'program		[word! path! lit-word! lit-path!]
						"Name of a function, or of a context with functions to dispatch against"
		/no-version		"Suppress automatic creation of --version argument"
		/no-help		"Suppress automatic creation of --help and -h arguments"
		/name			"Override program name"
			name'		[string!] "By default inferred from script header or `program` argument"
		/exename		"Override executable name"
			exename'	[string!] "By default inferred from command line"
		/version		"Override program version"
			version'	[float! tuple! date! string!] "Defaults to current date"
		/below			"Add custom explanation after the syntax in help output"
			below'		[string!]
		/columns		"Specify 5 widths of columns: indent, short option, long option, argument, description"
			columns'	[block!] "Default: [2 3 13 13 44]"
		;; default columns layout:
		;; "  -o, --long-option  <argument>    Docstring..."
		;;  0 2   6   10   15   20    26  30  34  <- offset
	][
		internal/help-for internal/extract-state context? 'program
	]

	process-into: function [
		"Calls PROGRAM with arguments read from the command line. Passes through the returned value"
		;; can't support `function!` here cause can't add refinements to a function! literal
		'program		[word! path! lit-word! lit-path!]
						"Name of a function, or of a context with functions to dispatch against"
		/no-version		"Suppress automatic creation of --version argument"
		/no-help		"Suppress automatic creation of --help and -h arguments"
		/name			"Override program name"
			name'		[string!] "By default inferred from script header or `program` argument"
		/exename		"Override executable name"
			exename'	[string!] "By default inferred from command line"
		/version		"Override program version"
			version'	[float! tuple! date! string!] "Defaults to current date"
		/below			"Add custom explanation after the syntax in help output"
			below'		[string!]
		/args			"Override system/options/args block"
			args'		[block!]
		/shortcuts		"Options that allow operands to be absent"
			shortcuts'	[block!] "Block of words, defaults to [help h version] unless /no-help or /no-version"
		/on-error		"Custom error handler: func [state [map!] complaint [block!]] [...]"
			on-error' 	[function!]	"Complaint is a block: [error-code error-message]; returned value is passed through"
			;;  error-codes are words listed in cli/error-codes
	][
		internal/process-into internal/extract-state context? 'program
	]
	
	
	;; ████████████  STUFF NOT FOR EXTERNAL USE  ████████████
	
	
	internal: context [
	
		dehyphenize: function [
			"Turn word into string, removing hyphens"
			word [word! lit-word!]
		][
			replace/all form word #"-" #" "
		]

		decorate-argument: function [							;-- x -> "<x>" or "[x]"
			"Get argument name in [square] or <triangle> brackets depending on accepted types"
			name  [word! refinement! string!]
			types [none! typeset!]
		][
			mold/flat to either find types block! [block!][tag!] name
		]
				
		str-to-ref: function [
			{Convert "string" into /refinement}
			string [string!]
		][
			;; portable charset is defined in [3] and prescribed by [2]
			;; it is however extended here to support whole Red word! syntax
			; optchar: charset [#"a" - #"z"  #"A" - #"Z"  #"0" - #"9"  "-"]
			if any [
				error? try [string: load string]				;-- unloadable?
				not word? :string								;-- unsupported spelling?
				; all [not integer? string not word? string]	;@@ TODO: integer options?
			][
				complain [ER_CHAR "Unsupported option character in" :string]	;-- using get-word for security (one day `load` may support serialized funcs)
			]
			; if integer? string [string: to word! rejoin ["_" string]]
			to refinement! string
		]
	
		#assert [/x = str-to-ref "x"]
		

		make-no-value: function [								;-- used by shortcuts to fill arguments
			"Create a dummy value of given type"
			type [datatype! typeset!]
		][
			if typeset? type [
				type: either find type block!
					[block!]									;-- if block is allowed, default to empty block
					[get first to block! type]
			]
			make type any [
				select #[issue! "" date! []] to word! type
				0
			]
		]
		
		#debug [
			foreach type to [] supported! [
				#assert [type = type?/word make-no-value get type]
			]
		]
		

		arity?: function [
			"Estimate base arity of a function from internal spec"
			spec [block!]
		][
			repeat n length? spec [								;@@ use for-each
				unless spec/:n/operand? [return n - 1]
			]
			any [n 0]
		]
	
		;; internal spec format is a block of maps for each argument:
		;; #(operand? [logic] names [block] arg-name [word/none] docstring [string] types [typeset]), where: 
		;; - names is either [operand-name] or [option-name ...] list
		;; - docstring is a string (maybe empty) that combines both option and argument's strings
		argument!: #[operand? #(false) names #(none) arg-name #(none) docstring #(none) types #(none)]
		
		find-refinement: function [
			"Fetch named refinement from internal spec, or none if not found"
			spec [block!]
			ref  [refinement!]
		][
			foreach map spec [if find/case map/names ref [return map]]	;@@ use locate
			none
		]
		
		add-spec-operand: function [
			"Add new operand to the internal spec"
			spec      [block!]
			arg-name  [word!]
			types     [typeset!]
			docstring [string! none!]
		][
			default docstring: copy {}							;@@ use advanced-function instead of adhoc 'default's
			append spec map: copy argument!
			map/operand?: yes
			foreach w [arg-name types docstring] [map/:w: get w]
		]
	
		add-spec-option: function [
			"Add new operand to the internal spec"
			spec      [block!]
			name      [refinement!]
			arg-name  [word! none!]
			types     [typeset! none!]
			docstring [string!]
		][
			append spec map: copy argument!
			map/names: reduce [name]
			foreach w [arg-name types docstring] [map/:w: get w]
		]
	
		add-spec-alias: function [
			"Add new alias to the internal spec"
			spec   [block!]
			alias  [refinement!]
			target [refinement!]
		][
			map: find-refinement spec target
			unless map [fail ["Target "target" of alias "alias" is not defined"]]
			append map/names alias
		]
		
		check-typeset: function [
			"Check if typeset contains only types supported by the CLI"
			types [typeset!]
		][
			unless empty? left: to block! exclude types supported! [
				fail ["Unsupported types in "mold to [] types" typeset: "left]
			]
		]
		
		;@@ would be preferable to use some kind of generalized spec parser available in the runtime
		prepare-spec: function [
			"Converts a function SPEC into internal format used for easier argument processing"
			spec [block! function!]
			/local name arg-name types doc doc1 doc2
		][
			if function? :spec [spec: spec-of :spec]
			
			result:   make [] 16
			aliases:  make [] 16
			
			=types?=: [set types opt block! (
				default types: [string!]
				if types = [block!] [append types 'string!]
				types: make typeset! types (check-typeset types)
			)]
			=operand=: [
				set name word! =types?= set doc opt string!
				(add-spec-operand result name types doc)
			]
			=option=: [
				set name refinement! set doc1 opt string! [
					set arg-name word! =types?= set doc2 opt string!
					opt [ahead word! (fail [name" can have no more than one argument"])]
				|	(arg-name: doc2: types: none)
				] (
					either target: find/match/tail doc1 "alias " [
						if arg-name [fail ["Alias refinement "name" cannot have an argument"]]
						repend aliases [name target]			;-- postpone aliasing to support look-ahead
					][
						doc: join compose [(only doc1) (only doc2)] "; "
						add-spec-option result name arg-name types doc
					]
				)
			]
			=local=: [/local to [refinement! | end]]			;-- skip /locals (/externs are never present in the spec)
			=fail=:  [end | p: (fail ["Unsupported token "(mold :p/1)" in CLI function spec"])]	;@@ use #expect
			
			parse/case spec [opt block! opt string! any =operand= any [=local= | =option= | =fail=]]
			
			foreach [alias target] aliases [					;-- apply aliases after all options are known
				type: type?/word attempt [target: load target]
				unless find [word! refinement!] type [
					fail ["Alias target "target" must be a word or refinement"]
				]
				add-spec-alias result alias to refinement! target
			]
			result
		]
	
		#assert [ (reduce [yes none    'x   ""    make typeset! [string!] 	]) = values-of first prepare-spec [x] ]
		#assert [ (reduce [yes none    'x   "doc" make typeset! [integer!]	]) = values-of first prepare-spec [x [integer!] "doc"] ]
		#assert [ (reduce [no  [/x /y] none ""    none						]) = values-of first prepare-spec [/x /y "alias x"] ]
		#assert [ (reduce [no  [/x /y] none ""    none						]) = values-of first prepare-spec [/y "alias x" /x] ]
		#assert [ (reduce [no  [/x /y] none ""    none						]) = values-of first prepare-spec [/y "alias /x" /x] ]
		#assert [ (reduce [no  [/x /y] 'z "doc1; doc2" make typeset! [integer! block!]])
			= values-of first prepare-spec [/x "doc1" z [integer! block!] "doc2" /y "alias x"] ]
		#assert [ error? try [prepare-spec [/x y /z "alias x" w]] ]
		#assert [ error? try [prepare-spec [/z "alias x" w]] ]
	
	
		empty-typeset: make typeset! []
		load-type: function [
			"Load and typecheck VALUE against a set of TYPES"
			value [string!]
			types [typeset! block!]
		][
			if block? types [types: make typeset! types]
			#assert [not empty? to block! types]
			check-typeset types
			
			set/any 'loaded try [load value]
			loadable: intersect types loadable!
			
			case/all [
				find loadable type? :loaded [return :loaded]	;-- normal case
				not error? :loaded [
					foreach [type target conversion] [			;-- try type conversion
						integer! float! [loaded: 1.0 * loaded]
						word!    logic! [logic? set/any 'loaded get/any loaded]
					][
						all [
							type = type?/word :loaded
							find loadable get target
							do conversion
							return :loaded
						]
					]
				]
				find types file!   [return to-red-file value]	;-- try fallbacks: file or string is accepted?
				find types string! [return value]
			]
			
			complain either error? :loaded [
				[ER_LOAD "Invalid value format:" value]			;-- load has failed and fallbacks are not applicable
			][
				;; loaded but didn't pass the type check...
				types:   to block! exclude types make typeset! [block!]
				a-an:    either find "aeiou" first form types/1 ["an"]["a"]	;-- `a-an` undefined outside of console
				allowed: pick [
					[ a-an types/1 "value"]
					["one of these types:" mold types]
				] single? types
				compose [ER_TYPE value "should be" (allowed)]	;-- tell which types are accepted
			]
		]
	
		#assert [1   = load-type "1" [ integer! ]]
		#assert [1   = load-type "1" [ string! integer! ]]
		#assert ["1" = load-type "1" [ string! ]]
		#assert [%1  = load-type "1" [ file! ]]
		#assert [%1  = load-type "1" [ string! file! ]]
		#assert [error? try     [load-type "1"   [typeset!]]]
		#assert [error? try/all [load-type "1 2" [integer!]]]
		#assert [error? try/all [load-type "1 2" [integer! block!]]]
		#assert [error? try/all [load-type "1"   [date!]]]
		#assert [error? try/all [load-type ")#!" [date!]]]


		;; unifies all refinements supported by the wrappers of internal funcs (help-for, syntax-for, ...)
		;; refinements and their values thus must be named consistently
		state-words: [
		;; state name, source name, allowed types once processed
			program		program		[function! object!]
			no-version	no-version	[logic!]
			no-help		no-help		[logic!]
			name		name'		[string!]
			exename		exename'	[string!]
			version		version'	[string!]
			below		below'		[string!]
			args		args'		[block!]
			shortcuts	shortcuts'	[block!]
			on-error	on-error'	[function!]
			columns		columns'	[block!]
		]
	
		extract-state: function [
			"Extract state from arguments of function FUN"
			fun [function!]
		][
			state: make map! 10
			foreach [target source _] state-words [
				if :fun =? context? source: bind source :fun [	;-- only extract words local to the function
					state/:target: get source
				]
			]
			#assert [state/program]
			state/call:     make path! 4						;-- word/path given as program argument and later extended
			state/operands: make [] 4							;-- filled by resolve-arguments
			state/refines:  make [] 8							;-- ditto
			default state/name: any [
				get-default-title
				dehyphenize either any-path? state/program
					[:state/program/1]							;-- 1st item in the path: program/command/...
					[state/program]
				;; reminder: do not use exe name as program name, as it can be renamed easily by the user
			]
			append state/call state/program
			state/program:           scope? state/call			;-- complains if not function or object
			state/allow-options?:    true						;-- will be disabled by '--' flag
			default state/args:      copy system/options/args
			default state/on-error:  :handle-error
			default state/version:   get-default-version
			state/version:           form state/version
			default state/shortcuts: [help h version]			;-- even if not auto-added, these are default shortcuts
			state/fixed-columns?:    none <> state/columns		;-- forbid adjustment in case value is user-set
			default state/columns:   [2 3 13 13 44]				;-- indent, short, long, argument, description
			default state/exename:   get-default-exename
			
			if function? :state/program [						;-- init arity and spec as soon as possible
				state/arity: arity? state/spec: prepare-spec :state/program
			]
			
			#debug [											;-- self assessment
				foreach [target _ types] state-words [
					if :state/:target [
						types: make typeset! types
						assert [find types type? :state/:target]
					]
				]
			]
			state
		]
		
		parse-option: function [
			"Parse option into name + (possibly) value pair"
			arg [string!]
			/local name value
		][
			parse arg [
				[	[	"--"        copy name [skip to ["=" | " " | end]]
					|	"-" not "-" copy name skip ahead [" " | end]
					] (str-to-ref name)							;-- validation
				|	(complain [ER_FORMAT "Unsupported option format:" arg])
				]
				[end | ["=" | some " "] copy value to end]		;-- allow weird "--opt val" format (in single argument)
			]
			reduce [name value]							;-- value may be none
		]
		
		form-option: function [
			"Add - or -- to the option name"
			name [string!]
		][
			rejoin [pick ["-" "--"] single? name name]
		]
		
		add-operand: function [
			"Add an operand to state"
			state [map!]    "Current argument processing state"
			value [string!] "Value of the operand"
		][
			#assert [state/spec]
			added: length? target: state/operands
			either block? target/:added [				;-- group multiple values into a block
				target: target/:added
				map:    state/spec/:added
			][
				if added >= state/arity [
					complain [ER_MUCH "Extra operand given:" value]
				]
				map:    state/spec/(added + 1)
				group?: find map/types block!
			]
			#assert [map/operand?]
			value: load-type value map/types
			if group? [value: reduce [:value]]
			append/only target value
		]
		
		add-option: function [
			"Add an option to state, return true if fallback is used"
			state    [map!]          "Current argument processing state"
			name     [string!]       "Option name"
			value    [string! none!] "Option immediate value, if given"
			fallback [string! none!] "Next argument, if exists"
		][
			map: find-refinement state/spec ref: str-to-ref name
			unless map [complain [ER_OPTION "Unsupported option:" form-option name]]	;-- may throw on automatic --help/version
			either map/arg-name [								;-- option expects an argument?
				unless value [
					unless value: fallback [complain [ER_EMPTY name "needs a value"]]
					consumed?: yes
				]
				value: load-type value map/types
				#assert [none <> value]
			][
				if value [complain [ER_VALUE "Option" form-option name "does not accept a value"]]
			]
			ref: map/names/1									;-- this relies on first name being not an alias
			either added: find/case state/refines ref [			;-- duplicate option
				if value <> none [								;-- group multiple values
					either block? :added/3
						[append added/3 :value]
						[added/3: :value]
				]
			][
				repend state/refines [ref on]
				if value <> none [								;-- false is valid, none is absent
					if find map/types block! [value: reduce [:value]]	;-- wrap the value if block is expected
					append/only state/refines :value
				]
				foreach ref next map/names [repend state/refines [ref on]]	;-- mark all aliases too
			]
			consumed?
		]
		
		dispatch-argument: function [
			"Dispatch next state/args argument (or two) into the function call"
			state [map!] "Current argument processing state"
		][
			arg: :state/args/1
			#assert [function? :state/program]
			#assert [state/spec]
			#assert [string? :arg]
			case [
				all [state/allow-options?  option? arg] [
					set [name: value:] parse-option arg
					extra?: add-option state name value :state/args/2
					if extra? [take state/args]
				]
				all [state/allow-options? arg = "--"] [
					state/allow-options?: no
				]
				'operand [add-operand state arg]
			]
			take state/args										;-- only remove it on success
		]
		
		dispatch-command: function [
			"Dispatch next state/args argument into the context"
			state [map!] "Current argument processing state"
		][
			ctx: :state/program
			arg: :state/args/1
			#assert [object? :ctx]
			#assert [string? :arg]
			if all [
				word? attempt [word: load arg]
				word:  in ctx word
				value: attempt [get word]
				any [function? :value object? :value]			;-- everything except object/func is ignored (data etc)
			][
				take   state/args								;-- only remove it on success
				append state/call word
				state/program: scope? state
				if function? :value [							;-- init arity & spec asap
					state/arity: arity? state/spec: prepare-spec :value
				]
				return word
			]
			complain [ER_CMD "Unknown command:" arg]
		]
		
		process-argument: function [
			"Process next argument (or two) in state/args"
			state [map!] "Current argument processing state"
		][
			either function? :state/program
				[dispatch-argument state]
				[dispatch-command  state]
		]
		
		process-arguments: function [
			"Process all CLI arguments but don't act upon them"
			state [map!] "Current argument processing state"
		][
			while [not empty? state/args] [process-argument state]
		]
		
		fill-operands: function [
			"Fill state/operands with empty values"
			state [map!] "Current argument processing state"
		][
			#assert [state/spec]
			added: length? state/operands
			repeat i state/arity - added [
				map: state/spec/(added + i)
				append/only state/operands make-no-value map/types
			]
		]
		
		shortcut-provided?: function [
			"Determine if a shortcut is among applied options"
			state [map!] "Current argument processing state"
		][
			foreach ref state/shortcuts [
				ref: to refinement! ref
				if find/case state/refines ref [return yes]
			]
			no
		]
		
		add-help-shortcut: function [
			"Try to add /help shortcut to state/call if supported; return success/failure"
			state [map!] "Current argument processing state"
		][
			to logic! if all [
				find state/shortcuts /help
				map: find-refinement state/spec /help
			][
				#assert [not find/case state/refines /help]		;-- /help should be dispatched as normal shortcut otherwise
				repend state/refines [/help on]
				if map/arg-name [								;-- synthesize argument if required (--help=stuff support)
					append state/refines make-no-value map/types
				]
				true
			]
		]
		
		call-cli-func: function [
			"Call the CLI function that state/call points to"
			state [map!] "Current argument processing state"
		][
			either function? scope: :state/program [
				#assert [state/arity]
				#assert [state/spec]
				ops-given: length? state/operands
				if ops-given < state/arity [
					any [
						shortcut-provided? state
						all [									;-- allow absent last operand if it is groupable
							ops-given = (state/arity - 1)
							find state/spec/(state/arity)/types block!
						]
						add-help-shortcut state
						complain [ER_FEW "Not enough operands given"]	;-- may still be caught by auto-help
					]
					fill-operands state
				]
			][
				either all [
					function? target: select scope 'help		;-- automatically default to 'help' function
					zero? arity: arity? spec: prepare-spec :target	;-- but only if it's nullary
				][
					append state/call 'help
					#assert [empty? state/operands]
					#assert [empty? state/refines]
				][
					complain [ER_NOCMD "A command expected"]
				]
			]
			call: either single? call: state/call [call/1][get call]	;-- apply can't accept a path
			if lit-word? :call [call: to word! call]					;-- apply can't accept a lit-word
			apply :call compose [(state/operands) (state/refines)]
		]
		
		;; auto-help conditions:
		;; at context scope:
		;; - no commands given automatically translates into 'help' function - ER_NOCMD
		;; - if no such function, it is simulated unless /no-help flag is set - ER_CMD
		;; - explicit and supported 'help' is handled normally
		;; at function scope:
		;; - no operands given but at least one required activates /help shortcut - ER_FEW
		;; - if no such refinement, it is simulated unless /no-help flag is set - ER_OPTION
		;; - explicit and supported --help is handled normally
		maybe-auto-help: function [
			"Automatically show help if reasonable to do so and allowed, return if succeded"
			state     [map!]   "Current argument processing state"
			complaint [block!] "Caught error"
		][
			to logic! all [
				not state/no-help								;-- auto help provision must be enabled
				switch complaint/1 [
					ER_FEW    [									;-- not enough (and no) operands and no /help refinement in the func
						all [
							empty? state/operands
							empty? state/refines
						]
					]
					ER_NOCMD  [true]							;-- command is needed and no nullary help command present
					ER_CMD    [state/args/1 = "help"]			;-- help command given, but not supported
					ER_OPTION [find ["-h" "--help"] state/args/1]	;-- --help option given, but not supported
				]
				handle-help state
			]
		]
		
		maybe-auto-version: function [
			"Automatically show version text if reasonable to do so and allowed, return if succeded"
			state     [map!]   "Current argument processing state"
			complaint [block!] "Caught error"
		][
			to logic! all [
				not state/no-version							;-- auto version provision must be enabled
				complaint/1 = 'ER_OPTION
				state/args/1 = "--version"						;-- --version option given, but not supported
				handle-version state
			]
		]
		
		scope?: function [
			"Return the current scope - function or object"
			path [map! path!] "Current argument processing state or custom path"
		][
			if map? path [path: path/call]
			target: get either single? path [:path/1][path]
			if any [function? :target object? :target] [return :target]
			fail [path" must refer to an object or function, not "type? :target]
		]
		
		process-into: function [
			"Process state/args and call the resulting function"
			state [map!] "Current argument processing state"
			/local result ok?
		][
			thrown: catch/name [
				process-arguments state
				set/any 'result call-cli-func state
				ok?: yes										;@@ can't `return :result` here, compiler bug #4202
			] 'complaint
			unless ok? [
				set/any 'result case [
					maybe-auto-help       state thrown [true]
					maybe-auto-version    state thrown [true]
					'else [state/on-error state thrown]
				]
			]
			:result
		]
		
		version-for: function [
			"Return version text for current state/call function"
			state [map!] "Current argument processing state"
			/brief       "Include only the essential info"
		][
			result: make string! 100
			if function? :state/program [
				parse spec-of :state/program [
					opt block! set desc string! (desc: trim desc)
				]
			]
			header:  any [system/script/header []]
			author:  attempt [join compose [(only header/author)] ", "]	;-- joined if multiple
			rights:  attempt [trim form only header/rights]
			license: attempt [trim form only header/license]	;-- trim most importantly removes indentation
	
			append result form compose [						;@@ use reshape
				(state/name) (state/version)					;-- "Program 1.2.3"
				(only desc)										;-- "long description ..."
				(only unless empty? author [rejoin ["by "author]])	;-- "by Yours Truly"
				#"^/"
				(only unless empty? rights [rejoin [rights "^/"]])	;-- "(C) Copyrights..."
			]
	
			unless brief [										;-- add detailed info
				commit: attempt [mold/part system/build/git/commit 8]
				#assert [system/version]
				#assert [system/platform]
				append result form compose [					;@@ use reshape
					(pick ["Built with" "Using"] compiled?)		;-- "Using"
					"Red" (system/version)						;-- "Red 0.6.4"
					(only if commit [rejoin ["("commit")"]])	;-- "(af11c3b4)"
					"for" (system/platform)						;-- for Windows
					"^/"
					(only if compiled? [rejoin ["Build timestamp: " #do keep [now] "^/"]])
					(only unless empty? license [rejoin [license "^/"]])	;-- "License text..."
				]
			]
	
			result
		]
	
		help-for: function [
			"Return help text for current state/call function or context"
			state [map!] "Current argument processing state"
		][
			rejoin [
				version-for/brief state
				"^/"
				syntax-for state
				"^/"
			]
		]
		
		synopsis-for: function [
			"Return short synopsis line for state/call (object or function)"
			state [map!] "Current argument processing state"
			/with "Provide an alternative path in place of state/call"
				path [path!]
		][
			default path: state/call
			scope: either with [scope? path][:state/program]
			either object? :scope [								;-- no spec needed, just the path
				form rejoin [as [] path "<command> ...^/"]
			][
				spec:      either with [prepare-spec :scope][state/spec]
				commands?: either single? path [{}][rejoin [{ } as [] next path]]
				options?:  either all [
					state/no-help
					state/no-version
					state/arity = length? spec
				][{ }][{ [options] }]
				operands:  clear copy spec
				foreach map spec [								;@@ use sift + map-each
					unless map/operand? [break]
					append operands decorate-argument map/arg-name map/types
				]
				rejoin [state/exename commands? options? operands "^/"]
			]
		]
	
		word-wrap: function [									;@@ should be generally available?
			"Split text by given width using word wrapping"
			text [string!]
			size [integer!]
		][
			collect [
				foreach line lines: split text #"^/" [
					while [(length? line) > size] [
						any [
							all [
								break: find/last/part line #" " size + 1
								not parse/part line [any #" "] break
							]
							break: skip line size
						]
						keep copy/part line break
						parse break [any #" " line:]
					]
					keep line
				]
			]
		]
		
		#assert [["abc def ghi"             ] = word-wrap "abc def ghi" 12]
		#assert [["abc def" "ghi"           ] = word-wrap "abc def ghi" 8]
		#assert [["abc def" "ghi"           ] = word-wrap "abc def ghi" 7]
		#assert [["abc" "def" "ghi"         ] = word-wrap "abc def ghi" 6]
		#assert [["abc" "def" "ghi"         ] = word-wrap "abc def ghi" 3]
		#assert [["ab" "c" "de" "f" "gh" "i"] = word-wrap "abc def ghi" 2]
		#assert [["  abc" "def" "ghi"       ] = word-wrap "  abc def ghi" 6]
		#assert [["  ab" "c" "def" "ghi"    ] = word-wrap "  abc def ghi" 4]
		#assert [["abc" "def" "ghi"         ] = word-wrap "abc^/def ghi" 5]
		#assert [["abc" "def" "ghi"         ] = word-wrap "abc^/def ghi" 4]
		#assert [["abc" "def" "ghi"         ] = word-wrap "abc^/def ghi" 3]
		#assert [["abc" "def ghi"           ] = word-wrap "abc^/def ghi" 7]
		#assert [["abc" "def ghi"           ] = word-wrap "abc^/def ghi" 9]
		
		format-columns: function [
			"Format tabular data into text columns"
			data   [block!]
			indent [integer!]
			widths [block!] "Column widths as integers"
		][
			ncells:  length? data: copy data
			ncols:   length? widths
			nrows:   round/ceiling/to ncells / ncols 1 
			result:  make {} nrows * ncols * 4
			repeat y nrows [
				row: skip data y - 1 * ncols
				rows: 0
				repeat x ncols [								;-- wrap all row items 
					row/:x: word-wrap form any [:row/:x {}] widths/:x
					rows: max rows length? row/:x				;@@ use accumulate
				]
				repeat i rows [									;-- form text lines out of the row
					append/dup result #" " indent
					repeat x ncols [
						append result pad copy any [row/:x/:i {}] widths/:x + 1
					]
					append trim/tail result #"^/"
				]
			]
			result
		]
		
		auto-adjust-columns: function [							;@@ ideally need to use table algorithm from Spaces
			"Try to adjust column widths for better readability"
			data   [block!] "Table of 4 columns"
			widths [block!] "Column widths as 4 integers"
		][
			#assert [parse widths [4 integer!]]					;@@ use advanced-function for arg tests
			#assert [(length? data) % 4 = 0]
			foreach column [2 3] [
				list:     extract at data column 4
				forall list [list/1: length? list/1]			;@@ use map-each
				required: maximum-of list
				to-add:   required - widths/:column
				if to-add < -6 [to-add: -6]						;-- limit how much to alter
				if to-add >  6 [to-add:  0]
				if to-add <> 0 [
					widths/:column: required
					widths/4: widths/4 - to-add
				]
			]
		]
		
		list-commands: function [
			"List commands available at given context as string"
			state [map!]  "Current argument processing state"
			path  [path!] "Path to the command (e.g. state/call)"
			/deep "Also list commands in all subcontexts"
		][
			#assert [object? get path]
			result: make {} 80
			foreach word words-of ctx: get path [
				subpath: append copy path word
				append result either all [deep object? :ctx/:word]
					[list-commands/deep state subpath]
					[synopsis-for/with  state subpath]
			]
			result
		]
		
		format-spec: function [
			"Format state/spec as text"
			state [map!] "Current argument processing state"
		][
			#assert [state/spec]
			cols: copy state/columns							;-- modified by auto-adjust
			unless parse cols [5 integer!] [
				fail ["/columns must be 5 integers, not "mold/flat/part cols 20]
			]
			spec: copy state/spec
			any [
				state/no-version
				find-refinement spec /version
				append spec version-option
			]
			any [
				state/no-help
				find-refinement spec /help
				append spec help-option
			]
			table: make [] (length? cols) - 1 * length? spec
			foreach map spec [
				all [map/operand?  empty? map/docstring  continue]	;-- skip operands without description
				short: copy []
				long:  copy []
				unless map/operand? [
					foreach name map/names [
						either 1 = length? form name
							[append short rejoin ["-"  name]]
							[append long  rejoin ["--" name]]
					]
				]
				short: join short ", "
				long:  join long  ", "
				any [empty? short  empty? long  append short ","]
				arg:   either map/arg-name
					[decorate-argument map/arg-name map/types]	;-- "<name>" or "[name]"
					[{}]
				repend table [short long arg map/docstring]
			]
			unless state/fixed-columns? [auto-adjust-columns table next cols]
			format-columns table cols/1 next cols
		]
		
		syntax-for: function [
			"Return usage text for current state/call function or context"
			state [map!] "Current argument processing state"
		][
			result: either object? :state/program [				;@@ add those extra newlines before and after, not here
				rejoin [
					"Supported commands:^/^/"
					list-commands/deep state state/call
				]
			][
				unless empty? text: format-spec state [
					text: rejoin ["Options:^/" text]
				]
				rejoin [
					"Syntax: " synopsis-for state "^/"
					text
				]
			]
			unless empty? state/below [repend result ["^/" state/below]]
			result
		]
    ]
    
];cli: context expand-directives [
