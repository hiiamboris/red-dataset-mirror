Red [
	Title:       "Format playground"
	Description: "Play with mask formats and learn"
	Author:      @hiiamboris
    License: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
    Needs:       [L10N View]
]

; #if object? :rebol [#include %split-float.red]

do [


#if all [
	not object? :rebol									;-- do nothing when compiling
	not block? :included-scripts						;-- do not reinclude itself
][
	;-- since it's now running in Red, we don't need R2 compatibility
	#do [verbose-inclusion?: yes]						;-- comment this out to disable file names dump
	
	#macro [#include] func [
		[manual] s e
		/local file data old-path path _ verb? processing? finished? also?
	][
		indent: ""
		unless file? :s/2 [
			do make error! rejoin [
				"#include expects a file argument, not " mold/part :s/2 100
			]
		]
		
		unless block? :included-scripts [included-scripts: copy []]
		file: clean-path to-red-file :s/2				;-- use absolute paths to ensure uniqueness
		if find included-scripts file [					;-- if already included, skip it
			return remove/part s 2
		]
		if verb?: true = :verbose-inclusion? [
			print rejoin ["including " mold file]
		]
		data: try [load file]
		if error? data [								;-- on loading error, report & skip
			print data
			return remove/part s 2
		]
		
		processing?: finished?: also?: []
		if verb? [
			processing?: compose/deep [
				print rejoin [append indent " " "processing " (mold file)]
			]
			finished?: compose/deep [
				print rejoin [head remove back tail indent "finished " (mold file)]
			]
			also?: [also]
		]

		old-path: what-dir
		set [path _] split-path file
		if 'Red == :data/1 [data: skip data 2]			;-- skip the header in case Red word is defined to smth else
		change/part s compose/deep [					;-- insert contents
			(to issue! 'do) [change-dir (path)]			;-- descend into paths for relative includes to work
			do [										;-- `do` makes it compatible with x: #include y expressions
				(processing?)
				(also?) do [(data)]						
				(finished?)
			]
			(to issue! 'do) [change-dir (old-path)]
		] 2
		; print ["===" file "expands into:^/" mold s]
		append included-scripts file
		s												;-- continue processing from contents itself
	]
]

; #script-to-compile %playground-comp.red





; #do [
; 	included: 1 + either all [value? 'included integer? :included] [included][0]
; 	print ["including assert.red" included "th time"]
; ]

#macro [#assert 'on]  func [s e] [assertions: on  []]
#macro [#assert 'off] func [s e] [assertions: off []]
#do [unless value? 'assertions [assertions: on]]		;-- only reset it on first include

#macro [#assert block!] func [[manual] s e] [			;-- allow macros within assert block!
	either assertions [
		change s 'assert
	][
		remove/part s e
	]
]

context [
	next-newline?: function [b [block!]] [
		b: next b
		forall b [if new-line? b [return b]]
		tail b
	]

	set 'assert function [
		"Evaluate a set of test expressions, showing a backtrace if any of them fail"
		tests [block!] "Delimited by new-line, optionally followed by an error message"
		/local result
	][
		copied: copy/deep tests							;-- save unmodified code ;@@ this is buggy for maps: #2167
		while [not tail? tests] [
			set/any 'result do/next bgn: tests 'tests
			if all [
				:result
				any [new-line? tests  tail? tests]
			] [continue]								;-- total success, skip to the next test

			end: next-newline? bgn
			if 0 <> left: offset? tests end [			;-- check assertion alignment
				if any [
					left < 0							;-- code ends after newline
					left > 1							;-- more than one free token before the newline
					not string? :tests/1				;-- not a message between code and newline
				][
					do make error! form reduce [
						"Assertion is not new-line-aligned at:"
						mold/part at copied index? bgn 100		;-- mold the original code
					]
				]
				tests: end								;-- skip the message
			]

			unless :result [							;-- test fails, need to repeat it step by step
				msg: either left = 1 [first end: back end][""]
				prin ["ASSERTION FAILED!" msg "^/"]
				expect copy/part at copied index? bgn at copied index? end		;-- expects single expression, or will report no error
				;-- no error thrown, to run other assertions
			]
		]
		()												;-- no return value
	]
]

;@@ `expect` includes trace-deep which has assertions, so must be included after defining 'assert'
;@@ watch out that `expect` itself does not include code that includes `assert`, or it'll crash






context [
	eval-types: make typeset! reduce [		;-- value types that should be traced
		paren!		;-- recurse into it

		; block!	-- never known if it's data or code argument - can't recurse into it
		; set-word!	-- ignore it, as it's previous value is not used
		; set-path!	-- ditto

		word!		;-- function call or value acquisition - we wanna know the value
		path!		;-- ditto

		get-word!	;-- value acquisition - wanna know it
		get-path!	;-- ditto

		native!		;-- literal functions should be evaluated but no need to display their source; only result
		action!		;-- ditto
		routine!	;-- ditto
		op!			;-- ditto
		function!	;-- ditto
	]

	;; this is used to prevent double evaluation of arguments and their results
	;@@ TODO: remove this once we have `apply` native
	wrap: func [x [any-type!]] [
		if any [										;-- quote non-final values (that do not evaluate to themselves)
			any-word? :x
			any-path? :x
			any-function? :x
			paren? :x
		][
			return as paren! reduce ['quote :x]
		]
		:x												;-- other values return as is
	]

	;; reduces each expression in a chain
	rewrite: func [code inspect preview] [
		code: copy code									;-- will be modified in place; but /deep isn't applicable as we want side effects
		while [not empty? code] [code: rewrite-next code :inspect :preview]
		head code										;-- needed by `trace-deep`
	]
	
	;; fully reduces a single value, triggering a callback
	rewrite-atom: function [code inspect preview] [
		if find eval-types type: type? :code/1 [
			to-eval:   copy/part      code 1			;-- have to separate it from the rest, to stop ops from being evaluated
			to-report: copy/deep/part code 1			;-- report an unchanged (by evaluation) expr to `inspect` (here: can be a paren with blocks inside)
			change/only code
				either type == paren! [
					as paren! rewrite as block! code/1 :inspect :preview
				][
					preview to-report
					wrap inspect to-report do to-eval
				]
		]
	]

	;; rewrites an operator application, e.g. `1 + f x`
	;; makes a deep copy of each code part in case a value gets modified by the code
	rewrite-op-chain: function [code inspect preview] [
		until [
			rewrite-next/no-op skip code 2 :inspect :preview	;-- reduce the right value to a final, but not any subsequent ops
			to-eval:   copy/part      code 3			;-- have to separate it from the rest, to stop ops from being evaluated
			to-report: copy/deep/part code 3			;-- report an unchanged (by evaluation) expr to `inspect`
			preview to-report
			change/part/only code wrap inspect to-report do to-eval 3
			not all [									;-- repeat until the whole chain is reduced
				word? :code/2
				op! = type? get/any :code/2
			]
		]
	]

	;; deeply reduces a single expression, recursing into subexpressions
	rewrite-next: function [code inspect preview /no-op /local end' r] [
		;; determine expression bounds & skip set-words/set-paths - not interested in them
		start: code
		while [any [set-path? :start/1 set-word? :start/1]] [start: next start]		;@@ optimally this needs `find` to support typesets
		if empty? start [do make error! rejoin ["Unfinished expression: " mold/flat skip start -10]]
		end: preprocessor/fetch-next start
		no-op: all [no-op  start =? code]				;-- reset no-op flag if we encounter set-words/set-paths, as those ops form a new chain

		set/any [v1: v2:] start							;-- analyze first 2 values
		rewrite?: yes									;-- `yes` to rewrite the current expression and call a callback
		case [											;-- priority order: op (v2), any-func (v1), everything else (v1)
			all [											;-- operator - recurse into it's right part
				word? :v2
				op! = type? get/any v2
			][
				rewrite-atom start :inspect :preview		;-- rewrite the left part
				if no-op [return next start]				;-- don't go past the op if we aren't allowed
				rewrite-op-chain start :inspect :preview	;-- rewrite the whole chain of operators
				rewrite?: no								;-- final value; but still may need to reduce set-words/set-ops
			]

			all [										;-- a function call - recurse into it
				any [
					word? :v1
					all [									;-- get the path in objects/blocks.. without refinements
						path? :v1
						also set/any [v1: _:] preprocessor/value-path? v1
							if single? v1 [v1: :v1/1]		;-- turn single path into word
					]
				]
				find [native! action! function! routine!] type?/word get/any v1
			][
				arity: either path? v2: get v1 [
					preprocessor/func-arity?/with spec-of :v2 v1
				][	preprocessor/func-arity?      spec-of :v2
				]
				end: next start
				loop arity [end: rewrite-next end :inspect :preview]	;-- rewrite all arguments before the call, end points past the last arg
			]

			paren? :v1 [								;-- recurse into paren; after that still `do` it as a whole
				change/only start as paren! rewrite as block! v1 :inspect :preview
			]

			'else [										;-- other cases
				rewrite-atom start :inspect :preview
				rewrite?: no								;-- final value
			]
		]

		if any [
			rewrite?									;-- a function call or a paren to reduce
			not start =? code							;-- or there are set-words/set-paths, so we have to actually set them
		][
			preview copy/deep/part code end
			set/any 'r either rewrite? [
				to-report: copy/deep/part code end
				inspect to-report do/next code 'end'
			][
				do/next code 'end'
			]
			;; should not matter - do (copy start end) or do/next, if preprocessor is correct
			unless end =? end' [
				do make error! rejoin [
					"Miscalculated expression bounds detected at "
					mold/flat copy/part code end
				]
			]
			change/part/only code wrap :r end
		]
		return next code
	]

	set 'trace-deep function [
		"Deeply trace a set of expressions"				;@@ TODO: remove `quote` once apply is available
		inspect	[function!] "func [expr [block!] result [any-type!]]"
		code	[block!]	"If empty, still evaluated once"
		/preview
			pfunc [function! none!] "func [expr [block!]] - called before evaluation"
	][
		do rewrite code :inspect :pfunc					;-- `do` will process `quote`s and return the last result
	]
]

; inspect: func [e [block!] r [any-type!]] [print [pad mold/part/flat/only e 20 20 " => " mold/part/flat :r 40] :r]

; #include %assert.red			;@@ assert uses this file; cyclic inclusion = crash

; 	() = trace-deep :inspect []
; #assert [() = trace-deep :inspect [()]]
; #assert [() = trace-deep :inspect [1 ()]]
; #assert [3  = trace-deep :inspect [1 + 2]]
; #assert [9  = trace-deep :inspect [1 + 2 * 3]]
; #assert [4  = trace-deep :inspect [x: y: 2 x + y]]
; #assert [20 = trace-deep :inspect [f: func [x] [does [10]] g: f 1 g * 2]]
; #assert [20 = trace-deep :inspect [f: func [x] [does [10]] (g: f (1)) ((g) * 2)]]


#localize []

expect: function [
	"Test a condition, showing full backtrace when it fails; return true/false"
	expr [block!] "Falsey results: false, none and unset!"
	/buffer buf [string!] "Print into the provided buffer rather than the console"
	/local r
][
	orig: copy/deep expr								;-- preserve the original code in case it changes during execution
	red-log: make block! 20								;-- accumulate the reduction log here
	err: try/all [										;-- try/all as we don't want any returns/breaks inside `expect`
		set/any 'r trace-deep
			func [expr [block!] rslt [any-type!]] [
				repend red-log [expr :rslt]
				:rslt
			]
			expr
		'ok
	]

	if all [value? 'r  :r] [							;-- `value?` if not unset, `:r` if not false/none (or error=none)
		return yes
	]

	;; now that we have a failure, let's report
	buf: any [buf make string! 200]
	append buf form reduce [
		"ERROR:" mold/flat/part expr 100
		either error? err [
			reduce ["errored out with^/" err]
		][	reduce ["check failed with" mold/flat/part :r 100]
		]
		"^/  Reduction log:^/"
	]
	foreach [expr rslt] red-log [
		append buf form reduce [
			"   " pad mold/part/flat/only expr 30 30
			"=>" mold/part/flat :rslt 50 "^/"
		]
	]
	unless buffer [prin buf]
	no
]


; #include %localize-macro.red
; #localize [#assert [
; 	a: 123
; 	not none? find/only [1 [1] 1] [1]
; 	1 = 1
; 	100
; 	1 = 2
; 	; 3 = 2 4
; 	2 = (2 + 1) "Message"
; 	3 + 0 = 3

; 	2							;-- valid multiline assertion
; 	-
; 	1
; 	=
; 	1
; ]]




;; Note on numbering systems:
;; According to my study of CLDR, only Hawaiians are using mixed numbering systems in Gregorian dates (lower Roman months)
;; Rest of the world sticks to default numbering system for all digits
;; So no partial numbering system swapping is implemented: one system applies to everything

;; Note on literal format:
;; '' works as single quote both inside '...' range and outside it
;; this is unlike ICU and SQL which treat '' as empty string and '''' as single quote
;; they're using '' to enforce splitting of masks e.g. "m''m" is 2 patterns, not single "mm"
;; but I'm not sure we need this kind of behavior knowing we have a lot of pattern alternatives
			

; #include %../common/show-trace.red



; #include %locale.red


; recycle/off


#macro [#localize block!] func [[manual] s e] [			;-- allow macros within local block!
	remove/part insert s compose/deep/only [do reduce [function [] (s/2)]] 2
	s													;-- reprocess
]

















with: func [
	"Bind CODE to a given context CTX"
	ctx [any-object! function! any-word! block!]
		"Block [x: ...] is converted into a context, [x 'x ...] is used as a list of contexts"
	code [block!]
][
	case [
		not block? :ctx  [bind code :ctx]
		set-word? :ctx/1 [bind code context ctx]
		'otherwise       [foreach ctx ctx [bind code do :ctx]  code]		;-- `do` decays lit-words and evals words, but doesn't allow expressions
		; 'otherwise       [while [not tail? ctx] [bind code do/next ctx 'ctx]  code]		;-- allows expressions
		; 'otherwise       [foreach ctx reduce ctx [bind code :ctx]  code]	;-- `reduce` is an extra allocation
	]
]

#localize []
			;-- used by composite func to bind exprs




context [
	with-thrown: func [code [block!] /thrown] [			;-- needed to be able to get thrown from both *catch funcs
		do code
	]

	;-- this design allows to avoid runtime binding of filters
	;@@ should it be just :thrown or attempt [:thrown] (to avoid context not available error, but slower)?
	set 'thrown func ["Value of the last THROW from FCATCH or PCATCH"] bind [:thrown] :with-thrown

	set 'pcatch function [
		"Eval CODE and forward thrown value into CASES as 'THROWN'"
		cases [block!] "CASE block to evaluate after throw (normally not evaluated)"
		code  [block!] "Code to evaluate"
	] bind [
		with-thrown [
			set/any 'thrown catch [return do code]
			;-- the rest mimicks `case append cases [true [throw thrown]]` behavior but without allocations
			forall cases [if do/next cases 'cases [break]]	;-- will reset cases to head if no conditions succeed
			if head? cases [throw :thrown]					;-- outside of `catch` for `throw thrown` to work
			do cases/1										;-- evaluates the block after true condition
		]
	] :with-thrown
	;-- bind above binds `thrown` and `code` but latter is rebound on func construction
	;-- as a bonus, `thrown` points to a value, not to a function, so a bit faster

	set 'fcatch function [
		"Eval CODE and catch a throw from it when FILTER returns a truthy value"
		filter [block!] "Filter block with word THROWN set to the thrown value"
		code   [block!] "Code to evaluate"
		/handler        "Specify a handler to be called on successful catch"
			on-throw [block!] "Has word THROWN set to the thrown value"
	] bind [
		with-thrown [
			set/any 'thrown catch [return do code]
			unless do filter [throw :thrown]
			either handler [do on-throw][:thrown]
		]
	] :with-thrown

	set 'trap function [					;-- backward-compatible with native try, but traps return & exit, so can't override
		"Try to DO a block and return its value or an error"
		code [block!]
		/all   "Catch also BREAK, CONTINUE, RETURN, EXIT and THROW exceptions"
		/catch "If provided, called upon exceptiontion and handler's value is returned"
			handler [block! function!] "func [error][] or block that uses THROWN"
			;@@ maybe also none! to mark a default handler that just prints the error?
		/local result
	] bind [
		with-thrown [
			plan: [set/any 'result do code  'ok]
			set 'thrown either all [					;-- returns 'ok or error object ;@@ use `apply`
				try/all plan
			][	try     plan
			]
			case [
				thrown == 'ok   [:result]
				block? :handler [do handler]
				'else           [handler thrown]		;-- if no handler is provided - this returns the error
			]
		]
	] :with-thrown

]


attempt: func [
	"Tries to evaluate a block and returns result or NONE on error"
	code [block!]
	/safer "Capture all possible errors and exceptions"
][
	either safer [
		trap/all/catch code [none]
	][
		try [return do code] none						;-- faster than trap
	]
]




{
	;-- this version is simpler but requires explicit `true [throw thrown]` to rethrow values that fail all case tests
	;-- and that I consider a bad thing

	set 'pcatch function [
		"Eval CODE and forward thrown value into CASES as 'THROWN'"
		cases [block!] "CASE block to evaluate after throw (normally not evaluated)"
		code  [block!] "Code to evaluate"
	] bind [
		with-thrown [
			set/any 'thrown catch [return do code]
			case cases									;-- case is outside of catch for `throw thrown` to work
		]
	] :with-thrown
}
		;-- used by composite func to trap errors


context [
	non-paren: charset [not #"("]

	trap-error: function [on-err [function! string!] :code [paren!]] [
		trap/catch
			as [] code
			pick [ [on-err thrown] [on-err] ] function? :on-err
	]

	set 'composite function [
		"Return STR with parenthesized expressions evaluated and formed"
		ctx [block!] "Bind expressions to CTX - in any format accepted by WITH function"
		str [any-string!] "String to interpolate"
		/trap "Trap evaluation errors and insert text instead"	;-- not load errors!
			on-err [function! string!] "string or function [error [error!]]"
	][
		s: as string! str
		b: with ctx parse s [collect [
			keep ("")									;-- ensures the output of rejoin is string, not block
			any [
				keep copy some non-paren				;-- text part
			|	keep [#"(" ahead #"\"] skip				;-- escaped opening paren
			|	s: (set [v: e:] transcode/next s) :e	;-- paren expression
				keep (:v)
			]
		]]

		if trap [										;-- each result has to be evaluated separately
			forall b [
				if paren? b/1 [b: insert b [trap-error :on-err]]
			]
			;@@ use map-each when it becomes native
			; b: map-each/eval [p [paren!]] b [['trap-error quote :on-err p]]
		]
		as str rejoin b
		; as str rejoin expand-directives b		-- expansion disabled by design for performance reasons
	]
]


;; has to be both Red & R2-compatible
;; any-string! for composing files, urls, tags
;; load errors are reported at expand time by design
#macro [#composite any-string! | '` any-string! '`] func [[manual] ss ee /local r e s type load-expr wrap keep] [
	set/any 'error try [								;-- display errors rather than cryptic "error in macro!"
		s: ss/2
		r: copy []
		type: type? s
		s: to string! s									;-- use "string": load %file/url:// does something else entirely, <tags> get appended with <>

		;; loads "(expression)..and leaves the rest untouched"
		load-expr: has [rest val] [						;-- s should be at "("
			rest: s
			either rebol
				[ set [val rest] load/next rest ]
				[ val: load/next rest 'rest ]
			e: rest										;-- update the end-position
			val
		]

		;; removes unnecesary parens in obvious cases (to win some runtime performance)
		;; 2 or more tokens should remain parenthesized, so that only the last value is rejoin-ed
		;; forbidden _loadable_ types should also remain parenthesized:
		;;   - word/path (can be a function)
		;;   - set-word/set-path (would eat strings otherwise)
		;@@ TODO: to be extended once we're able to load functions/natives/actions/ops/unsets
		wrap: func [blk] [					
			all [								
				1 = length? blk
				not find [word! path! set-word! set-path!] type?/word first blk
				return first blk
			]
			to paren! blk
		]

		;; filter out empty strings for less runtime load (except for the 1st string - it determines result type)
		keep: func [x][
			if any [
				empty? r
				not any-string? x
				not empty? x
			][
				if empty? r [x: to type x]				;-- make rejoin's result of the same type as the template
				append/only r x
			]
		]

		marker: to char! 40								;@@ = #"(": workaround for #4534
		do compose [
			(pick [parse/all parse] object? rebol) s [
				any [
					s: to marker e: (keep copy/part s e)
					[
						"(\" (append last r marker)
					|	s: (keep wrap load-expr) :e
					]
				]
				s: to end (keep copy s)
			]
		]
		;; change/part is different between red & R2, so: remove+insert
		remove/part ss ee
		insert ss reduce ['rejoin r]
		return next ss									;-- expand block further but not rejoin
	]
	print ["***** ERROR in #COMPOSITE *****^/" :error]
	ee													;-- don't expand failed macro anymore - or will deadlock
]







;-- -- -- -- -- -- -- -- -- -- -- -- -- -- TESTS -- -- -- -- -- -- -- -- -- -- -- -- -- --








; #assert [			;-- this is unloadable because of tag limitations
; 	[#composite <tag flag="(form 1 + 2)">] == [
; 		rejoin [
; 			<tag flag=">	;-- result is a <tag>
; 			(form 3)
; 			{"}				;-- other strings should be normal strings, or we'll have <<">> result
; 		]
; 	]
; ]



									;-- doesn't make sense to include this file without #composite also

;; I'm intentionally not naming it `#error` or the macro may be silently ignored if it's not expanded
;; (due to many issues with the preprocessor)
#macro [
	p: 'ERROR
	(either "ERROR" == mold p/1 [p: []][p: [end skip]]) p		;@@ this idiocy is to make R2 accept only uppercase ERROR
	skip
] func [[manual] ss ee] [
	unless string? ss/2 [
		print form make error! form reduce [
			"ERROR macro expects a string! argument, not" mold copy/part ss/2 50
		]
	]
	remove ss
	insert ss [do make error! #composite]
	ss		;-- reprocess it again so it expands #composite
]

; #include %bind-only.red



; #include %assert.red


once: func [
	"Set value of WORD to VAL only if it's unset"
	:word [set-word!]
	val   [default!] "New value"
][
	unless value? to word! word [set word :val]
	:val
]

default: func [
	"If SUBJ's value is none, set it to VAL"
	:subj [set-word! set-path!]
	val   [default!] "New value"
][
	if set-path? subj [subj: as path! subj]				;-- get does not work on set-paths
	if none =? get/any subj [set subj :val]				;-- `=?` is like 5% faster than `=`, and 2x faster than `none?`
	:val
]

maybe: func [
	"If SUBJ's value is not strictly equal to VAL, set it to VAL (for use in reactivity)"
	:subj [set-word! set-path!]
	val   [default!] "New value"
][
	if set-path? subj [subj: as path! subj]				;-- get does not work on set-paths
	unless :val == get/any subj [set subj :val]
	:val
]

import: function [
	"Import words from context CTX into the global namespace"
	ctx [object!]
][
	set/any  bind words-of ctx system/words  values-of ctx
]

export: function [
	"Export a set of bound words into the global namespace"
	words [block!]
][
	foreach w words [set/any 'system/words/:w get/any :w]
]

anonymize: function [
	"Return WORD bound in an anonymous context and set to VALUE"
	word [word!] value [any-type!]
][
	o: construct change [] to set-word! word
	set/any/only o :value
	bind word o
]


;-- there's a lot of ways this function can be written carelessly...



;@@ BUG: this turns return/exit/break/continue into errors (when not caught) - they should be rethrown separately using their natives
selective-catch: func [
	"Evaluate CODE and return errors of given TYPE & ID only, while rethrowing all others"
	type	[word!]
	id		[word!]
	code	[block!]
	/default value [any-type!] "Return this value on successful catch instead of the error object"
	/local e r
][
	all [
		error? e: try/all/keep [set/any 'r do code  'ok]	;-- r <- code result (maybe error or unset);  e <- error or ok
		any [											;-- muffle & return the selected error only
			e/type <> type
			e/id <> id
			return either default [:value][e]
		]
		do e											;-- rethrow errors we don't care about
	]
	:r													;-- pass thru normal result
]

;;@@ catching it is all cool, but how to actually propagate it further up as `return`,
;;   not as an error, considering `return` will be caught by the function anyway?
catch-return:  func [
	"Evaluate CODE catching RETURN and EXIT (for use in loops)"
	code	[block!]
][
	selective-catch 'throw 'return code
]

;;@@ should this use some /default value or detection by error is okay?
catch-a-break:  func [
	"Evaluate CODE catching BREAK (for use in loops)"
	code	[block!]
][
	selective-catch 'throw 'break code
]

catch-continue: func [
	"Evaluate CODE catching CONTINUE (for use in loops)"
	code	[block!]
][
	selective-catch/default 'throw 'continue code ()	;-- return unset on continue, in accord with other loops
]




; #include %localize-macro.red
; #include %assert.red

;@@ TODO: implement it in R/S to be more useful
context [
	empty-types: make typeset! [none! unset!]
	check: func [x [any-type!]] [either find empty-types type? :x [[]][:x]]

	;; do/next (paren) evaluates whole paren
	;; parse requires series type to be unchanged
	;; so this function mediates these issues
	do-next: function ['p [word!]] [
		either block? s: get p [
			do/next s p
		][
			also do/next as block! s p
				set p as paren! get p
		]
	]

	set 'reshape function [
		"Deeply replace construction patterns in the BLOCK"
		block [block! paren!] "Will not be copied if does not contain any patterns"
		/local x
	][
		unless parse/case block [											;-- scan the block first - if no patterns are found, just return itself
			to [
				block! | paren! | '! | @ |
				/if | /else | /do | /use | /mixin ;| /skip
			] p: to end
		] [return block]

		while [not any [new-line? p head? p]] [p: back p]					;-- get back to the start of the line
		r: clear copy block													;-- preallocate the result
		append/part r block p												;-- copy the part that contains nothing special
		block: p															;-- start on the line of first found pattern

		=line-end=:   [p: [end | if (new-line? p) if (not line-start =? p)]]
		=bad-syntax=: [p: (do make error! rejoin ["Invalid syntax at: " mold/part p 40])]
		=update-end=: [p: opt if ((index? p) > index? line-end) line-end:]	;-- used after multiline expressions to ensure they are not repeated

		=expand+include-line=: [
			:line-start
			; (print ["INCLUDING:" mold/flat copy/part line-start line-end])
			while [
				p: if (p =? cond-start) break
			|	               set x [block! | paren!] (append/only r     reshape x)
			|	[['! | /use  ] set x           paren!] (append/only r  do reshape x)
			|	[[ @ | /mixin] set x           paren!] (append r check do reshape x)
			; |	[[     /skip ] set x skip            ] (append/only r :x)	@@ needs more design, I don't like it
			|	set x skip (append/only r :x)
			]
			:line-end
		]
		=global-conditions=: [
			while [
				=line-end= break
			|	/if   p: [if (include?: global-test: do-next p) :p =update-end=]
			|	/else    [if (include?: not :global-test)]
			|	/do   p: [(do-next p) :p =update-end=]
			|	ahead [/if | /else] :line-end break
			|	(print "GLOBAL") =bad-syntax=
			]
		]
		=line-conditions=: [
			while [															;-- `any` has a bad habit of stopping halfway, so using `while`
				/if   p: t: [if (last-test: do-next p) :p]					;-- not using set/any by design: conditions should not return unset
			|	/else p: [if (not :last-test)]
			|	/do   p: [(do-next p) :p]
			|	=line-end= =expand+include-line= break
			|	ahead [/if | /else] break									;-- condition failed, skip to the next line
			|	(print "LOCAL") =bad-syntax=
			]
			:line-end
		]

		include?: last-test: global-test: yes								;-- inclusion flags are true by default
		unless parse/case block [any [										;-- use /case or it will accept words for refinements
																			;-- can't use `collect into r` because `keep` works as `keep/only` always
			;; find the condition start and line end first
			line-start: to [
				=line-end= line-end:
			|	[/if | /else | /do] to [=line-end= line-end:]
			] cond-start:
			; (print ["||" mold/flat/only copy/part line-start cond-start "||" mold/flat/only copy/part cond-start line-end "||"])

			;; now process conditions and decide what to include
			[
				if (cond-start =? line-start) =global-conditions=			;-- empty line => process global conditions
			|	if (include?) [												;-- skip it if inclusion is forbidden by global condition
					if (cond-start =? line-end) =expand+include-line=		;-- no conditions in this line => include it
				|	=line-conditions=										;-- else process conditions and decide
				]
			|	none														;-- just skip it if it's not allowed to be included
			]
			:line-end
		] end] [do make error! rejoin ["Internal Error: " mold line-start]]	;-- should always process the whole block
		r
	]
]

#localize []

; #include %show-trace.red

context [
	;-- this should be straightforward and fast in R/S
	;-- one particular side effect of type checking is we can avoid/accept `none` we get when outside series limits
	types-match?: function [
		"Check if items in SERIES match TFILTER"
		ii [object!]
	][
		s: skip ii/series ii/offset
		foreach i ii/tfilter-idx [
			unless find ii/tfilter/:i type? :s/:i [return no]
		]
		yes
	]

	;-- this should also be a piece of cake
	;-- again, value can be used to filter in/out `none` values outside series limits
	values-match?: function [
		"Check if items in SERIES match VFILTER for all chosen VFILTER-IDX"
		ii [object!]
	][
		op: :ii/cmp
		s: skip ii/series ii/offset
		foreach i ii/vfilter-idx [
			unless :s/:i op :ii/vfilter/:i [return no]
			if tail? at s i [return no]					;-- special case: after-the-tail `none` should not count as sought value=none
		]												;@@ TODO: raise this design question in docs
		yes
	]
	; #assert [r: values-match? [1 2 3] [   ] [3 2 3] := 'r]
	; #assert [r: values-match? [1 2 3] [3  ] [3 2 3] := 'r]
	; #assert [r: values-match? [1 2 3] [2 3] [3 2 3] := 'r]

	ranges!:   make typeset! [integer! pair!]			;-- supported non-series types
	is-range?: func [x] [find ranges! type? :x]

	;; helpers for non-series types (ranges) iteration:
	int2pair: func [i [integer!] w [integer!]] [1x1 + as-pair  i - 1 % w  i - 1 / w]
	fill-with-ints: function [spec [block!] from [integer!] dim [integer!]] [
		foreach w spec [
			set w all [from <= dim  from]				;-- none after the 'tail'
			from: from + 1
		]
	]
	fill-with-pairs: function [spec [block!] from [integer!] dim [pair!]] [
		foreach w spec [
			xy: int2pair from dim/x
			set w all [xy/y <= dim/y  xy]				;-- none after the 'tail'
			from: from + 1
		]
	]
	append-ints: function [tgt [block!] from [integer!] count [integer!]] [
		loop count [
			append tgt from
			from: from + 1
		]
	]
	append-pairs: function [tgt [block!] from [integer!] count [integer!] dim [pair!]] [
		loop count [
			append tgt int2pair from dim/x
			from: from + 1
		]
	]

	;; `compose` readability helper - won't be needed in RS
	when: make op! func [value test] [either :test [:value][[]]]


	;-- this structure is required to share data between functions
	;-- (although it's one step away from a proper iterator type)
	;-- in R/S it will be set by foreach and used by foreach-next
	iteration-info!: object [
		matched?:    no
		offset:      0				;-- zero-based; cannot (easily) be series, as need to be able to point past the end or before the head
		iter:        0

		spec:        none
		series:      none
		code:        none
		cmp:         none
		fill:        none			;-- how many words to fill in the spec at every iteration - if series is shorter, fails
		width:       0				;-- how many words are in the spec (to fill)
		step:        none			;-- none value is used to detect duplicate pipes; <0 if iterating backward
		vfilter:     none			;-- none when filter is not used
		vfilter-idx: none
		tfilter:     none			;-- none when filter is not used
		tfilter-idx: none
		pos-word:    none
		idx-word:    none
	]

	fill-info: function [
		spec [word! block!]
		series [series! map! pair! integer!]
		code [block!]
		back-flag [logic!]
		case-flag [logic!]
		same-flag [logic!]
	][
		if case [
			integer? series [series <= 0]
			pair?    series [any [series/x <= 0 series/y <= 0]]
			'else [empty? series]
		] [return none]			;-- optimization; also works for /reverse, as we don't go before the current index

		on-series?: series? series
		if map? series [
			series: to hash! series
			forall series [								;@@ temporary adjustment - won't be needed in RS
				if set-word? :series/1 [series/1: to word! series/1]
			]
		]

		ii: copy iteration-info!
		ii/spec:   spec: compose [(spec)]
		ii/series: series
		ii/code:   copy/deep code						;-- copy/deep or binding will be shared on recursive calls!
		ii/cmp: get pick pick [[=? =?] [== =]] same-flag case-flag
		if all [same-flag case-flag] [
			ERROR "/case and /same refinements are mutually exclusive"
		]

		switch type?/word spec/1 [						;@@ TODO: consider supporting both iteration and position?
			set-word! [
				ii/pos-word: to word! spec/1
				unless on-series? [						;-- fail on ranges and maps (latter cannot be modified as series)
					ERROR "Series index can only be used when iterating over series"
				]
				remove spec
			]
			refinement! [
				ii/idx-word: to word! spec/1
				remove spec
			]
		]

		ii/vfilter:     copy []
		ii/tfilter:     copy []
		ii/vfilter-idx: copy []
		ii/tfilter-idx: copy []
		while [not tail? spec] [
			value: types: none
			switch/default type?/word spec/1 [
				paren! [
					if is-range? series [				;-- complicates filter and makes little sense
						ERROR "Cannot use value filters on ranges"
					]
					set/any 'value do spec/1
					append ii/vfilter-idx index? spec
					change spec anonymize '_ none		;-- at R/S side it will be just dumb loop rather than single `set`
				]
				word! [
					case [
						spec/1 = '| [
							if ii/step [ERROR "Duplicate pipe in spec"]
							ii/fill: yes
							ii/step: -1 + index? spec
							; if ii/step = 0 [ERROR ""]	;@@ error or not? one can use such loop to advance manually
							remove spec
							continue					;-- don't add this entry
						]
						block? spec/2 [
							if is-range? series [		;-- pointless: we always know the item type in ranges
								ERROR "Cannot use type filters on ranges"
							]
							;@@ TODO: use single typesets and types as is, without allocating a new typeset
							types: make typeset! spec/2
							append ii/tfilter-idx index? spec
							remove next spec
						]
					]
				]
			][
				ERROR "Unexpected occurrence of (mold spec/1) in spec"
			]
			append/only ii/vfilter :value
			append/only ii/tfilter :types
			spec: next spec
		]												;-- spec is now native-foreach-compatible
		spec: head spec
		if empty? spec [ERROR "Spec must contain at least one mandatory word"]

		
		

		if empty? ii/tfilter-idx [ii/tfilter: ii/tfilter-idx: none]		;-- disable empty filters
		if empty? ii/vfilter-idx [ii/vfilter: ii/vfilter-idx: none]

		ii/width: length? spec
		ii/step: any [ii/step ii/width]
		ii/fill: either ii/fill [ii/width][1]
		if all [0 = ii/step  not ii/pos-word] [
			ERROR "Zero step is only allowed with series index"			;-- otherwise deadlocks
		]

		ii/offset: 0
		if back-flag [									;-- requires step known
			n: case [
				integer? series [series]
				pair? series [series/x * series/y]
				'else [length? series]
			]
			n: n - ii/fill								;-- ensure needed number of words is filled
			; n: round/floor/to n max 1 ii/step			;-- align to step
			n: n - (n % max 1 ii/step)					;-- align to step
			if pair? p: series [n: as-pair  n % p/x  n / p/x]
			ii/offset: n
		]

		if back-flag [ii/step: 0 - ii/step]

		;@@ in R/S we won't need this, as `function` supports `foreach`:
		anon-ctx: construct collect [
			foreach w spec [keep to set-word! w]
			if ii/pos-word [keep to set-word! ii/pos-word]
			if ii/idx-word [keep to set-word! ii/idx-word]
		]
		bind ii/spec anon-ctx
		if ii/pos-word [ii/pos-word: bind ii/pos-word anon-ctx]
		if ii/idx-word [ii/idx-word: bind ii/idx-word anon-ctx]
		bind ii/code anon-ctx

		ii					;-- fill OK
	]


	more-of?: function [ii [object!] size [integer!]] [
		either ii/step < 0 [
			ii/offset >= 0
		][
			case [
				pair? ii/series [
					ii/series/x * ii/series/y - ii/offset >= size
				]
				integer? ii/series [
					ii/series - ii/offset >= size
				]
				'else [
					(length? ii/series) - ii/offset >= size	;-- supports series length change during iteration
				]
			]
		]
	]

	more-items?: function [ii [object!]] [more-of? ii 1]
	more-iterations?: function [ii [object!]] [more-of? ii ii/fill]

	copy-to: function [
		"Append a part of II/series into TGT"
		tgt  [series!]
		ii   [object!] "iterator info"
		ofs  [integer! series!] "from where to start a copy"
		part [integer! series! none!] "number of items or offset; none for unbound copy"
	][
		case [
			series? ii/series [
				src: skip ii/series ofs
				part: either part [
					copy/part src part					;@@ append/part doesn't work - #4336
				][	copy      src						;-- still need a copy so series is not shared (in case appending a string to block)
				]
				if vector? part [part: to [] part]		;@@ workaround: append block vector enforces /only
				append tgt part
			]
			integer? ii/series [
				unless part [part: ii/series - ofs - 1]
				append-ints  tgt 1 + ofs part
			]
			'pair [
				unless part [part: ii/series/x * ii/series/y - ofs - 1]
				append-pairs tgt 1 + ofs part ii/series
			]
		]
	]


	;@@ should maps iteration be restricted to [k v] or not?
	;@@ I don't like arbitrary restrictions, but here it's a question of how easy it will be
	;@@ to support unrestricted iteration in possible future implementations of maps
	;@@ leave this question in docs!

	{
		for-each allows loop body to modify `pos:` and then possibly call `continue`
		in R/S we'll be able to catch `continue` directly
		in Red it's tricky: need to not let `continue` mess index logic, and yet allow `break` somehow
		the only solution I've found is to save the pos-word, then check it for changes before each iteration
	}

	for-each-core: function [
		ii [object!] "iteration info"
		on-iteration [block!] "evaluated when spec matches"
		after-iteration [block!] "evaluated after on-iteration succeeds and offsets are updated"
		/local new-pos
	][
		upd-pos-word?: [								;-- code that reads user modifications of series position
			if ii/pos-word [
				set/any 'new-pos get/any ii/pos-word
				unless series? :new-pos [
					ERROR "(ii/pos-word) does not refer to series"
				]
				unless same? head new-pos head ii/series [	;-- most likely it's a bug, so we report it
					ERROR "(ii/pos-word) was changed to another series"
				]
				ii/offset: -1 + index? new-pos
			]
		]

		to-next-possible-match: [						;-- by default tries to match series at every step
			if more-iterations? ii [ii/iter: ii/iter + 1]
		]
		if all [										;-- however when vfilter is defined...
			ii/vfilter									;-- we can use find to faster locate matches, esp. on hash & map
			ii/step <> 0								;-- but step=0 means find direction is undefined and can't benefit from this optimization
		][
			val-ofs: ii/vfilter-idx/1
			val: ii/vfilter/:val-ofs
			if typeset? :val [							;@@ #4911 - typeset is too smart - this is a workaround
				val: compose [(val)]					;@@ however this still disables hash advantages
				no-only?: yes							;@@ to be removed once #4911 is fixed
			]
			|skip|: absolute ii/step

			if all [
				ii/step < 0									;-- when going backwards
				tail? at skip ii/series ii/offset val-ofs	;-- and sought value is after the tail
			][
				ii/offset: ii/offset - |skip|				;-- then we can skip this iteration already
				ii/iter: ii/iter + 1						;-- as after-the-tail `none` does not count as value `none`
			]
			;-- this special case may be disabled
			;-- but then `from` may be misaligned with `/skip` as Red doesn't allow after-the-tail positioning
			;-- so if disabled, it will require special index adjustment during first two iterations (should be easier in RS)

			find-call: as path! compose [				;-- construct a relevant `find` call
				find
				skip
				('reverse when (ii/step < 0))
				('only when not no-only?)				;@@ /only disables "type!" smarts, but not "typeset!" - #4911
				('case when (:ii/cmp =? :strict-equal))
				('same when (:ii/cmp =? :same?))
			]

			to-next-possible-match: reshape [
				all [
					pos: !(find-call) from: at skip ii/series ii/offset val-ofs :val |skip|
					ii/offset: (index? pos) - val-ofs
					more-iterations? ii
					ii/iter: add  ii/iter  (offset? from pos) / ii/step
				]
			]
		]

		catch-a-break [									;@@ destroys break/return value
			while to-next-possible-match [
				;-- do all updates before calls to `continue` are possible
				case [
					ii/pos-word [set ii/pos-word skip ii/series ii/offset]
					ii/idx-word [set ii/idx-word ii/iter]	;-- unfortunately with this design, image does not get a pair index
				]

				;-- do filtering
				if ii/matched?: all [
					any [not ii/tfilter  types-match? ii]
					any [not ii/vfilter  values-match? ii]
				][
					;-- fill the spec - only if matched
					case [
						series?  ii/series [foreach (ii/spec) skip ii/series ii/offset [break]]
						integer? ii/series [fill-with-ints  ii/spec 1 + ii/offset ii/series]
						'pair              [fill-with-pairs ii/spec 1 + ii/offset ii/series]
					]
					catch-continue [
						continued?: yes
						do on-iteration
						continued?: no
					]
				]

				do upd-pos-word?
				ii/offset: ii/offset + ii/step
				if all [ii/matched? not continued?] after-iteration
			]
		]
	]

	;-- the frontend
	set 'for-each function [
		"Evaluate CODE for each match of the SPEC on SERIES"
		'spec  [word! block!]                "Words & index to set, values/types to match"
		series [series! map! pair! integer!] "Series, map or limit"
		code   [block!]                      "Code to evaluate"
		/reverse "Traverse in the opposite direction"
		/case    "Values are matched using strict comparison"
		/same    "Values are matched using sameness comparison"
		/local r
	][
		unset 'r										;-- returns unset by default (empty series, fill-info failed)
		if ii: fill-info spec series code reverse case same [
			for-each-core ii [
				if ii/matched? [						;-- not matched iterations do not affect the result
					unset 'r							;-- in case of `continue`, result will be unset
					set/any 'r do ii/code
				]
			] []
		]
		:r
	]

	set 'map-each function [
		"Map SERIES into a new one and return it"
		'spec  [word! block!]                "Words & index to set, values/types to match"
		series [series! map! pair! integer!] "Series, map or range"
		code   [block!]                      "Should return the new item(s)"
		/only "Treat block returned by CODE as a single item"
		/eval "Reduce block returned by CODE (else includes it as is)"
		/drop "Discard regions that didn't match SPEC (else includes them unmodified)"
		/case "Values are matched using strict comparison"
		/same "Values are matched using sameness comparison"
		/self "Map series into itself (incompatible with ranges)"
		/local part
	][
		all [
			self
			scalar? series								;-- change/part below relies on this error
			ERROR "/self is only allowed when iterating over series or map"
		]

		;-- where to collect into: always a block, regardless of the series given
		;-- because we don't know what type the result should be and block can be converted into anything later
		buf: make [] system/words/case [				;-- try to guess the length
			integer? series [series]
			pair? series [series/x * series/y]
			'else [length? series]
		]
		if all [eval not only] [red-buf: copy []]		;-- buffer for reduce/into
		;@@ TODO: trap & rethrow errors (out of memory, I/O, etc), ensuring buffers are freed on exit

		;-- in map-each ii/step is never negative as it does not support backwards iteration
		add-skipped-items: [skip-bgn: skip-end]
		add-rest: []
		unless drop [
			add-skipped-items: [
				if skip-end > skip-bgn [				;-- can be <= in case of step=0 or user intervention - in this case don't add anything
					copy-to buf ii skip-bgn skip-end - skip-bgn
				]
				skip-bgn: skip-end
			]
			add-rest: [
				ii/offset: skip-bgn						;-- offset used by `more-items?`
				if more-items? ii [copy-to buf ii skip-bgn none]
			]
		]

		if ii: fill-info spec series code no case same [	;-- non-empty series/range?
			skip-bgn: ii/offset
			for-each-core ii [
				skip-end: ii/offset						;-- remember skipped region before ii/offset changes in iteration code
				set/any 'part do ii/code
				if all [eval block? :part] [			;-- /eval only affects block results by design (for more strictness)
					part: either only [					;-- has to be reduced here, in case it calls continue or break, or errors
						reduce      part				;-- /only has to allocate a new block every time
					][	reduce/into part clear red-buf	;-- else this can be optimized, but buf has to be cleared every time in case it gets partially reduced and then `continue` fires
					]
				]
			][
				do add-skipped-items					;-- by putting it here, we can group multiple `continue` calls into a single append
				either only [append/only buf :part][append buf :part]
				;-- `max` is used to never add the same region twice, in case user rolls back the position:
				skip-bgn: skip-end: max skip-end ii/offset
			]
			do add-rest									;-- after break or last continue, add the rest of the series

			;-- to avoid O(n^2) time complexity of in-place item changes (e.g. inserted item length <> removed),
			;-- original series is changed only once, after iteration is finished
			;-- this produces a single on-deep-change event on owned series
			;-- during iteration, intermediate changes will not be detected by user code
			if self [
				either map? series [
					extend clear series buf
				][
					change/part series buf tail series
				]
			]
		]												;-- otherwise, empty series: buf is already empty

		;@@ TODO: in R/S free the `red-buf` here (not possible in Red)
		either self [ 									;-- even if never iterated, a block or series is returned
			;@@ TODO: in R/S free the `buf` here (not possible in Red)
			series
		][
			buf											;-- no need to free it
		]
	]

	;@@ TODO: maps require a special fill function so keys don't appear as set-words, also to avoid a copy
	;@@ at RS level it's a hash so it'll be easier there
	;@@ so, map at least should be converted into a hash, not block
	set 'remove-each function [
		"Remove parts of SERIES that match SPEC and return a truthy value"
		'spec  [word! block!]                "Words & index to set, values/types to match"
		series [series! map! pair! integer!] "Series, map or range"
		code   [block!]                      "Should return the new item(s)"
		/drop "Discard regions that didn't match SPEC (else includes them unmodified)"
		/case "Values are matched using strict comparison"
		/same "Values are matched using sameness comparison"
		/local part
	][
		unless ii: fill-info spec series code no case same [	;-- early exit - series is empty
			return either any [series? series map? series] [series] [copy []]
		]

		;-- where to collect into: always a block, regardless of the series given
		;-- because we don't know what type the result should be and block can be converted into anything later
		buf: make [] system/words/case [				;-- try to guess the length
			integer? series [series]
			pair? series [series/x * series/y]
			'else [length? series]
		]
		;@@ TODO: trap & rethrow errors (out of memory, I/O, etc), ensuring `buf` is freed on exit

		skip-bgn: ii/offset
		for-each-core ii [
			skip-end: ii/offset							;-- remember skipped region before ii/offset changes in iteration code
			set/any 'drop-this? do ii/code
		][
			unless drop [copy-to buf ii skip-bgn skip-end - skip-bgn]
			unless :drop-this? [copy-to buf ii skip-end ii/step]
			skip-bgn: skip-end: ii/offset
		]
		unless drop [copy-to buf ii skip-bgn none]

		;-- to avoid O(n^2) time complexity of in-place item removal,
		;-- original series is changed only once, after iteration is finished
		;-- this produces a single on-deep-change event on owned series
		;-- during iteration, intermediate changes will not be detected by user code
		system/words/case [
			series? series [
				either any-string? series [
					change/part series rejoin buf tail series		;@@ just a workaround for #4913 crash
				][
					change/part series        buf tail series
				]
			]
			map? series [
				extend clear series buf
			]
			'ranges [
				return buf								;-- no need to free it
			]
		]
		;@@ TODO: in R/S free the buffer (not possible in Red)
		series
	]

]


#localize []

formatting: make formatting [
	charmaps: #[]										;-- new items added on locale change
	build-charmap: none
	update-charmap: none
]

context [
	digit-list:  "0123456789"
	superscript: "0⁰1¹2²3³4⁴5⁵6⁶7⁷8⁸9⁹+⁺-⁻(⁽)⁾"			;-- hardcoded
	; subscript: "0₀1₁2₂3₃4₄5₅6₆7₇8₈9₉+₊-₋(₍)₎"			;-- not used yet
	
	;; prepare charmap for 'testing' locale
	build-test-charmap: function [] [
		ct: #[]											;-- for testing: chars are fixed and differ from prototypes
		ct/superscript: to map! map-each/eval [x y] superscript [[x y]]
		ct/finance:     to map! map-each/eval x digit-list [	;-- fin digits should differ from default ones
			[x pick "𝟘𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡" x - #"0" + 1]
		]
		ct/finance/(#"$"): func [size] [
			pick ["¥" "CN¥" "CNY" "Chinese yuan"] size			;-- names should differ is the only requirement
		]
		ct/finance/(#"."): #","
		ct/finance/(#" "): #"."
		ct/default:     to map! map-each/eval x digit-list [
			[x pick "0123456789" x - #"0" + 1]
		]
		for-each [x y] "..EEx× '++--(())%%‰‰" [ct/default/:x: y]
		ct/default/(#"#"): ""									;-- empty for hash, used to remove `#`s
		ct/default/nan: "NaN"
		ct/default/inf: "INF"
		ct
	]
	
	;@@ TODO: only do this in debug mode?
	formatting/charmaps/testing: build-test-charmap
	
	formatting/build-charmap: function [
		"Fill char-map with data from system/locale"
		/for lc-name [word!] "Default: system/locale/locale"
	][
		lc-name: any [lc-name system/locale/locale]
		any [lc-name  ERROR "Unsupported locale (lc-name)"]
		loc: system/locale/list/:lc-name
		
		
		cm: make map! []
		cm/superscript:  to map! map-each/eval [x y] superscript [[x y]]
		
		sys: loc/numbers/system 
		dig: loc/numbers/:sys/digits
		fin: loc/numbers/:sys/fin-digits
		
		
		cm/finance:      to map! map-each/eval i 10 [[#"0" + i - 1  pick fin i]]
     	
		sym: loc/numbers/:sys/symbols
		cm/default: def: to map! map-each/eval i 10 [[#"0" + i - 1  pick dig i]]
		extend def reduce [
			#"." sym/decimal
			#"E" sym/exponential
			#" " sym/group
			#"-" sym/minus
			#"+" sym/plus
			#"%" sym/percent
			#"‰" sym/permille
			#"x" sym/superscripting-exponent
			#"#" ""										;-- used to remove absent digits
			'nan sym/nan
			'inf sym/infinity
     	]
     	charmaps/:lc-name: cm
	]
	
	;; called by format functions when they need this data
	formatting/update-charmap: function [
		"Fill char-map with data for chosen locale only if it's empty"
		/for lc-name [word!] "Default: system/locale/locale"
	][
		loc: any [lc-name system/locale/locale]
		
		any [
			charmaps/:loc								;-- this works for testing locale as well
			build-charmap/for loc
		]
	]
	
]




; #include %../common/new-each.red
; #include %locale.red

as-ordinal: function [
	"Format a number as ordinal quantity"
	number [integer!]									;@@ should we accept float?
	/in locale [word! none!] "Locale to express value in"
][
	sl: system/locale
	locale: any [locale sl/locale]
	sl/tools/expand-locale locale
	lang: to word! first split form locale #"_"			;-- maybe stash language in the locale data?
	quantity: sl/ordinal/:lang							;-- call ordinal function
		n: absolute number								;-- number itself
		1 + to integer! log-10 max 1.0 n  				;-- digit count
	rejoin [number sl/list/:locale/numbers/ordinal-suffixes/:quantity]
]








context [
	roman: [
		100000 "ↈ"
		90000  "ↂↈ"
		50000  "ↇ"
		40000  "ↂↇ"
		10000  "ↂ"
		9000   "Mↂ"
		5000   "ↁ"
		4000   "Mↁ"
		1000   "M"
		900    "CM"
		500    "D"
		400    "CD"
		100    "C"
		90     "XC"
		50     "L"
		40     "XL"
		10     "X"
		9      "IX"
		5      "V"
		4      "IV"
		1      "I"
		0      "N"
	]
	
	set 'as-roman function [
		"Convert integer number into a Roman numeral"
		num [integer!] "0 to 399'999"
	][
		case [
			all [0 < num num < 400000] [
				r: clear ""
				for-each [n s | _] roman [				;-- | to skip zero
					append/dup r s to integer! num / n
					num: num % n
				]
				copy r
			]
			num = 0 [copy select roman 0]
			'else [cause-error 'script 'invalid-arg [num]]
		]
	]
]






; #include %../common/new-each.red

; #include %../common/composite.red
; #include %../common/error-macro.red
; #include %../common/count.red

; #include %../common/profiling.red
; #include %../common/show-trace.red

;-- formatting context is defined by split-float.red
formatting: make formatting [
	date-time-ctx:    none
	date-time-rules:  none
	form-integer:     none								;-- user-facing wrapper
	form-integer*:    none								;-- zero-alloc version
	format-date-time: none
]

formatting/date-time-ctx: context [
	abs: :absolute
	digit!: charset "0123456789"						;-- localized using default numbering system
	
	
	;;=======  INDEPENDENT FUNCS  =======
	
	
	formatting/form-integer: function [
		"Format an integer number using min/max widths"
		int [integer!] "Nonnegative"
		/min w1 [integer!] "Minimum width (zero-padded)"
		/max w2 [integer!] "Maximum width (significant part truncated)"
	] with formatting [
		copy apply form-integer* 'int
	]
	
	;; this func is much faster than format-number-with-mask and can truncate (common for year formatting)
	form-integer*: formatting/form-integer*: function [
		"Format an integer number using min/max widths"
		int [integer!] "Nonnegative"
		/min w1 [integer!] "Minimum width (zero-padded)"
		/max w2 [integer!] "Maximum width (significant part truncated)"
	][
		if int < 0 [cause-error 'script 'invalid-arg [int]]
		
		;; routine-based variant, though it's abuse of split-float
		r: second formatting/split-float* 1.0 * int 0 0 ["" "" "" "" ""] 
		if w1 [insert/dup r #"0" w1 - length? r] 
		if w2 [remove/part r skip tail r negate w2]
		
		;; mezz variant that has no GC pressure, but is slower:
		; w1: any [w1 1]
		; r: tail "000000000"
		; while [int > 0] [
			; r: back r
			; x: int % 10
			; int: int - x / 10 
			; r/1: #"0" + x
		; ]
		; if w2 [r: skip tail r negate system/words/min length? r w2]
		; loop w1 - length? r [r: back r  r/1: #"0"]
		
		;; variant that uses 'form' which allocates RAM:
		; r: form int
		; if w1 [insert/dup r #"0" w1 - length? r] 
		; if w2 [remove/part r skip tail r negate w2]
		
		r
	]
	
	
	
	hour?: function [time [time!] type [integer!] "11, 12 or 23"] [
		switch/default type [
			23 [time/hour // 24]
			11 [time/hour // 12]
			12 [time/hour - 1 // 12 + 1]
		][cause-error 'script 'invalid-arg [type]]
	]
	
	
	
	;; always rounded down, otherwise have to modify seconds too,
	;; but what if there are no seconds in the mask?
	;; that would lead to invalid subseconds (with extra leading '1' digit)
	subsecond?: function [time [time!] size [integer!]] [
		f: time/second % 1.0 * (10 ** size) + 1e-6		;-- 1e-6 compensates for rounding error
		form-integer*/min round/to/floor f 1 size
	]
	
	
	
	;; translates from astronomical into BC/AD numbering
	;; see https://en.wikipedia.org/wiki/Astronomical_year_numbering
	abs-year?: function [year [integer!]] [
		either year >= 1 [year][1 - year]
	]
	
	
	
	;; implements 'popular' interpretation of the term 'century'
	;; according to: https://en.wikipedia.org/wiki/Century#Start_and_end_of_centuries
	century?: function [year [integer!]] [
		1 + to integer! (abs-year? year) / 100
	]
	
	
	
	era?: function [year [integer!] /religious] [
		pick pick [[BC AD] [BCE CE]] religious year <= 0
	]
	yearsign?: function [year [integer!]] [
		pick "-+" year <= 0
	]
	
	
	
	am-pm?: function [time [time!]] [
		pick [am pm] time < 12:00
	]
	
	
	
	zone?: function [date [date!] size [integer!] sep? [logic!] z? [logic!]] [
		
		all [z?  zero? date/zone  return "Z"]
		s: clear ""
		insert s pick "+-" date/zone >= 0:0
		append s form-integer*/min abs date/zone/hour size - 1 % 2 + 1
		if size > 2 [
			if sep? [append s #":"]	
			append s form-integer*/min date/zone/minute 2
		]
		s
	]
	
	
	
	
	;; combines roman numerals with ordinal suffix to get 'XXIst' etc
	;; this allocates (as-ordinal does) but I suppose it doesn't matter for this use case
	as-roman-ordinal: function [n [integer!] /in locale [word! none!]] [
		s: as-ordinal/in n locale
		t: find/last/tail s digit!
		change/part s as-roman n t
		s
	]
	
	
	
	;; non-allocating, but does not modify the original
	lowercase: function [s [string!]] [
		system/words/lowercase append clear "" s
	]
	uppercase: function [s [string!]] [
		system/words/uppercase append clear "" s
	]
	
	
	
	;;=======  LOCALE FUNCS  =======
	
	
	.locale: none
	
	localize-path: function [
		"Fetch a path from locale's calendar data (none if not found)"
		path [path!]
	][
		
		path: as path! compose/into [
			system locale list (.locale) calendar format (as block! path)
		] clear []
		widths: [char short abbr full] 
		while [
			all [
				not found: attempt [get path]
				2 <= length? widths
			]
		][
		replace path widths/1 widths/2
			widths: next widths							;-- try fall back widths if no such path
		]
		found
	]
	
	;; used to transform Red /weekday index into key in locale data
	weekdays: [mon tue wed thu fri sat sun]
	
	localize: function [
		"Fetch a named value from locale's calendar data (none if not found)"
		item        [word!] "e.g. month or AD"
		width       [word!] "one of [full abbr short char]"
		/pick index [integer!] "Index of month, quarter, day"
	][
		path: switch item [
			AD BC CE BCE [[eras     (width) (item) ]]
			am pm        [[periods  (width) (item) ]]
			month        [[months   (width) (index)]]
			day          [[days     (width) (system/words/pick weekdays index)]]
			quarter      [[quarters (width) (index)]]
		]
		
		localize-path as path! compose/into path clear []
	]

	; localize!: function [
		; "Fetch a named value from locale's calendar data (pass thru if not found)"
		; item        [word!] "e.g. month or AD"
		; width       [word!] "one of [full abbr short char]"
		; /pick index [integer!] "Index of month, quarter, day"
	; ][
		; any [apply localize 'item  item] 
	; ]
	
	local-era?: function [
		year       [integer!]
		width      [word!]
		religious? [logic!]
	][
		eras: [- -]
		eras/1: era?/religious year
		eras/2: era? year
		unless religious? [reverse eras]
		any [
			localize eras/1 width						;-- try to find translation
			localize eras/2 width
			select [AD "AD" BC "BC" CE "CE" BCE "BCE"] eras/1	;-- fall back to default
		]
	]
	
	local-quarter?: function [
		date  [date!]
		width [word!]
	][
		q: 1 + to integer! date/month - 1 / 3
		any [localize/pick 'quarter width q  q]			;-- fall back to number
	]
	
	
	
	;;=======  OTHER STATEFUL FUNCS  =======
	
	
	;; vars that persist between restarts
	.date:  none										;-- what is being formatted
	.ampm?: no											;-- AM or PM marker is present in the mask?
	
	;; state flags that are reset between restarts
	.prev-pat: none										;-- adjacent patterns
	.next-pat: none
	
	reset: does [
		set [.locale .date .prev-pat .next-pat] none
		.ampm?: no
	]
	
	;; changes time to UTC before it is emitted
	to-utc: does [.date: to-UTC-date .date]
	
	;; "12" and "012" patterns are ambiguous as there are 12 months and 12 hours
	;; the worst case is like this: "25th day at 12" - has only day and hour patterns
	;;   I don't think we can predict the meaning in this case, and will output day and month instead
	;;   "25th day at 12pm" (note "pm") OTOH is better: having pm marker hints that we want time
	;; another problematic case: "11th month, 25th day at 12": we want both month and hour, but they're symmetric 
	;;   "25th day of 11th month at 12" OTOH we can sort out: pattern that is closer to date pattern is month
	;; so the following parameters should be considered:
	;;  - count of 12/012 patterns - 1 or 2
	;;    if 1, we should ask: is there any time pattern in the mask? if so, we want time, otherwise month
	;;    if 2, we should ask: what comes first, date or time? and output in this order
	;;  - presence of any time-related pattern (only minute and AM/PM matter)
	;;  - adjacence to AM/PM or minute pattern = hour, otherwise month
	;; and implementation parameters:
	;;  - order: month-hour/hour-month, which we swap in case we got it wrong
	;;  - number of 12/012 patterns already encountered (what to choose next)
	;;  - prev and next patterns, so we can check if order is correct
	;; but this is all too complex, and instead I'm only considering adjacence to minute or am/pm, for now
	neighbors12: ["aaa" "a.m." "p.m." "aa" "am" "pm" "a" "p" "mi" "mm" "59"]   
	is-hour?: does [
		any [
			find neighbors12 .prev-pat
			find neighbors12 .next-pat
		]
	]
	hour-or-month: does [either is-hour? [hour? .date/time 12][.date/month]]
	
	;; similarly, 59 minutes and 59 seconds: disambiguated by adjacency to any hour pattern
	neighbors59: ["hh23" "023" "hhh" "h23" "23" "hh" "hh12" "012" "h12" "12" "hh11" "011" "h11" "11"]
	is-59-minute?: does [
		any [
			find neighbors59 .prev-pat
			find neighbors59 .next-pat
		]
	]
	minute-or-second: does [either is-59-minute? [.date/minute][to integer! .date/second]]
		
	;; "mm" pattern: primarily month, but after hour or before second or AM/PM it's minute
	;; goal here is to be smart enough to fix the likely mistake of `hh:mm:ss`
	left-of-mm: copy neighbors59
	right-of-mm: ["ss" "59"]
	is-mm-minute?: does [
		any [
			find left-of-mm  .prev-pat
			find right-of-mm .next-pat
		]
	]
	minute-or-month: does [either is-mm-minute? [.date/minute][.date/month]]
	
	;; map is used to speed up pattern lookup, given how many there are
	rule-map: #[]
	build-rule-map: function [] [
		clear rule-map
		foreach [pat prep emit] rules [
			key: pat/1 
			blk: any [rule-map/:key  rule-map/:key: copy []]
			repend blk [pat prep emit]
		]
		;; now sort rule-map longest-first, so we don't have to bother with pattern order
		cmp: func [a b] [(length? a) >= length? b]
		foreach [char blk] rule-map [
			sort/skip/compare blk 3 :cmp
		]
		; ?? rule-map
	]
	
	lookup-pattern: function [
		"Find pattern that matches given input mask at current offset"
		input [string!]
		;; returns [pattern code] or none
	][
		if all [
			key: input/1
			blk: rule-map/:key
		][
			;; simple way not used for performance reasons :(
			; locate blk [pat - - .. find/match/case input pat]
			forall blk [
				pat: blk/1
				if find/match/case input pat [return blk]
				blk: skip blk 2
			]
			none
		]
	]
	
	
	;; rules are open for modification, in case user wants some extended formats not available out of the box
	;; build-rule-map should be called after modification
	
	;; it is automatically sorted by length, but should be manually sorted by usefulness (most common first)
	;; format is: "pattern"  [what to do when found]  [what to do to emit]
	;; "found" stage is only used so far to set .ampm? presence flag and to-utc conversion
	rules: with formatting [
		"hh23"        [] [form-integer*/min hour? .date/time 23 2]
		"023"         [] [form-integer*/min hour? .date/time 23 2]
		"hhh"         [] [form-integer*/min hour? .date/time 23 2]
		"h23"         [] [hour? .date/time 23]
		"23"          [] [hour? .date/time 23]
		"hh12"        [] [form-integer*/min hour? .date/time 12 2]
		; "012"         [] [form-integer*/min hour? .date/time 12 2]	disambiguated below
		"h12"         [] [hour? .date/time 12]
		; "12"          [] [hour? .date/time 12]						disambiguated below
		"hh11"        [] [form-integer*/min hour? .date/time 11 2]
		"011"         [] [form-integer*/min hour? .date/time 11 2]
		"h11"         [] [hour? .date/time 11]
		"11"          [] [hour? .date/time 11]
		
		"mi"          [] [form-integer*/min .date/minute 2]
		"ss"          [] [form-integer*/min to integer! .date/second 2]
		
		"yyyy"        [] [form-integer*/min abs .date/year 4]		;-- year 0001, year 12345, year 0123 BC (always positive)
		"year"        [] [form-integer*/min abs .date/year 4]
		"1999"        [] [form-integer*     abs .date/year]			;-- year 1, year 12345, year 123 BC, always >= 0
		"yy"          [] [form-integer*/min/max abs .date/year 2 2]	;-- year 01, year 99, only within century, always >= 0
		"yr"          [] [form-integer*/min/max abs .date/year 2 2]
		"99"          [] [form-integer*/min/max abs .date/year 2 2]
		
		; "mm"          [] [form-integer*/min .date/month 2]			disambiguated below
		"m"           [] [.date/month]
		
		"Month"       [] [localize/pick 'month 'full .date/month]
		"December"    [] [localize/pick 'month 'full .date/month]
		"Mon"         [] [localize/pick 'month 'abbr .date/month]
		"Dec"         [] [localize/pick 'month 'abbr .date/month]
		"M"           [] [localize/pick 'month 'char .date/month]
		"D"           [] [localize/pick 'month 'char .date/month]
		
		"dd"          [] [form-integer*/min .date/day 2]
		"031"         [] [form-integer*/min .date/day 2]
		"d"           [] [.date/day]
		"31"          [] [.date/day]
		
		"7"           [] [.date/weekday]
		
		"wwww"        [] [lowercase localize/pick 'day 'full .date/weekday]
		"Wwww"        [] [          localize/pick 'day 'full .date/weekday]
		"sunday"      [] [lowercase localize/pick 'day 'full .date/weekday]
		"Sunday"      [] [          localize/pick 'day 'full .date/weekday]
		"day"         [] [lowercase localize/pick 'day 'full .date/weekday]
		"Day"         [] [          localize/pick 'day 'full .date/weekday]
		"www"         [] [lowercase localize/pick 'day 'abbr .date/weekday]
		"Www"         [] [          localize/pick 'day 'abbr .date/weekday]
		"sun"         [] [lowercase localize/pick 'day 'abbr .date/weekday]
		"Sun"         [] [          localize/pick 'day 'abbr .date/weekday]
		"dy"          [] [lowercase localize/pick 'day 'abbr .date/weekday]
		"Dy"          [] [          localize/pick 'day 'abbr .date/weekday]
		"ww"          [] [lowercase localize/pick 'day 'short .date/weekday]
		"Ww"          [] [          localize/pick 'day 'short .date/weekday]
		"su"          [] [lowercase localize/pick 'day 'short .date/weekday]
		"Su"          [] [          localize/pick 'day 'short .date/weekday]
		"w"           [] [lowercase localize/pick 'day 'char .date/weekday]
		"W"           [] [          localize/pick 'day 'char .date/weekday]
		"s"           [] [lowercase localize/pick 'day 'char .date/weekday]
		"S"           [] [          localize/pick 'day 'char .date/weekday]
		
		"aaa"  [.ampm?: yes] [lowercase localize am-pm? .date/time 'full]
		"AAA"  [.ampm?: yes] [uppercase localize am-pm? .date/time 'full]
		"a.m." [.ampm?: yes] [lowercase localize am-pm? .date/time 'full]
		"A.M." [.ampm?: yes] [uppercase localize am-pm? .date/time 'full]
		"p.m." [.ampm?: yes] [lowercase localize am-pm? .date/time 'full]
		"P.M." [.ampm?: yes] [uppercase localize am-pm? .date/time 'full]
		"aa"   [.ampm?: yes] [lowercase localize am-pm? .date/time 'abbr]
		"AA"   [.ampm?: yes] [uppercase localize am-pm? .date/time 'abbr]
		"am"   [.ampm?: yes] [lowercase localize am-pm? .date/time 'abbr]
		"AM"   [.ampm?: yes] [uppercase localize am-pm? .date/time 'abbr]
		"pm"   [.ampm?: yes] [lowercase localize am-pm? .date/time 'abbr]
		"PM"   [.ampm?: yes] [uppercase localize am-pm? .date/time 'abbr]
		"a"    [.ampm?: yes] [lowercase localize am-pm? .date/time 'char]
		"A"    [.ampm?: yes] [uppercase localize am-pm? .date/time 'char]
		"p"    [.ampm?: yes] [lowercase localize am-pm? .date/time 'char]
		"P"    [.ampm?: yes] [uppercase localize am-pm? .date/time 'char]
		
		"ffffff"      [] [subsecond? .date/time 6]
		"fffff"       [] [subsecond? .date/time 5]
		"ffff"        [] [subsecond? .date/time 4]
		"fff"         [] [subsecond? .date/time 3]
		"ff"          [] [subsecond? .date/time 2]
		"f"           [] [subsecond? .date/time 1]
		
		;; GMT patterns should affect time, even date, retroactively, so `to-utc` may restart the process
		"GMT"   [to-utc] ["GMT"]
		"UTC"   [to-utc] ["UTC"]
		"+ZZZZ"       [] [zone? .date 4 no  yes]
		"+0000Z"      [] [zone? .date 4 no  yes]
		"+ZZ:ZZ"      [] [zone? .date 4 yes yes]
		"+00:00Z"     [] [zone? .date 4 yes yes]
		"+zzzz"       [] [zone? .date 4 no  no]
		"+0000"       [] [zone? .date 4 no  no]
		"+zz:zz"      [] [zone? .date 4 yes no]
		"+00:00"      [] [zone? .date 4 yes no]
		"+z:zz"       [] [zone? .date 3 yes no]
		"+0:00"       [] [zone? .date 3 yes no]
		"+zz"         [] [zone? .date 2 no  no]
		"+00"         [] [zone? .date 2 no  no]
		"+z"          [] [zone? .date 1 no  no]
		"+0"          [] [zone? .date 1 no  no]
		
		;; date pattern only has era sign (and no other signs), as it does not deal with time intervals
		"+"           [] [yearsign? .date/year]
		
		"eee"         [] [          local-era? .date/year 'full yes]	;-- no case change by default
		"Anno Domini" [] [          local-era? .date/year 'full yes]
		"anno domini" [] [lowercase local-era? .date/year 'full yes]
		"Common Era"  [] [          local-era? .date/year 'full no]
		"common era"  [] [lowercase local-era? .date/year 'full no]
		"ee"          [] [          local-era? .date/year 'abbr yes]
		"AD"          [] [          local-era? .date/year 'abbr yes]
		"ad"          [] [lowercase local-era? .date/year 'abbr yes]
		"CE"          [] [          local-era? .date/year 'abbr no]
		"ce"          [] [lowercase local-era? .date/year 'abbr no]
		
		"20th"        [] [as-ordinal century? .date/year]
		"CRth"        [] [as-roman-ordinal century? .date/year]	;-- Ist century
		"XXth"        [] [as-roman-ordinal century? .date/year]
		"CR"          [] [as-roman   century? .date/year]			;-- I century
		"XX"          [] [as-roman   century? .date/year]
		"cr"          [] [lowercase as-roman century? .date/year]	;-- i century
		"cth"         [] [as-ordinal century? .date/year]			;-- 1st century, not 01st century
		"c"           [] [           century? .date/year]			;-- 1 century, not 01 century
		"20"          [] [           century? .date/year]
		
		"qqq"         [] [local-quarter? .date 'full]
		"4th quarter" [] [local-quarter? .date 'full]
		"qq"          [] [local-quarter? .date 'abbr]
		"q4"          [] [lowercase local-quarter? .date 'abbr]
		"Q4"          [] [local-quarter? .date 'abbr]
		"q"           [] [local-quarter? .date 'char]
		"4"           [] [local-quarter? .date 'char]
		
		;; we have both 60 seconds and 60 minutes, so need to disambiguate
		"59"          [] [form-integer*/min minute-or-second 2]
		
		;; ambiguous - see hour-or-month
		"012"         [] [form-integer*/min hour-or-month 2]
		"12"          [] [hour-or-month]
		
		;; ambiguous - see minute-or-month
		"mm"          [] [form-integer*/min minute-or-month 2]
		
		;; "hh" depends on AM/PM presence in the mask, and only 12/23 formats are supported 
		"hh" [] [
			form-integer*/min
				hour? .date/time
				pick [12 23] .ampm?
				2
		]
	]
	
	=emit-literal=: [
		#"'" [
			#"'" not #"'" keep (#"'")					;-- "x''x" case
		|	some [
				"''" keep (#"'")						;-- "x' '' 'x" case
			|	keep pick to #"'"
			] #"'"
		]
	]
	
	reserved!: charset [#"A" - #"Z" #"a" - #"z" #"0" - #"9"]
	
	;; this has to support lookahead and lookbehind (.prev-pat and .next-pat) for some patterns
	;; and it has to avoid allocations when possible, so is a bit involved
	formatting/format-date-time: function [
		"Format date or time (of today), using mask as a template"
		dt [date! time!]
		mask [string!] {e.g. "012:59:59 'of' Sunday December 31st, 1999"}
		/in locale [word! none!] "Override default locale"		;-- here affects digits only
		/local r
		/extern .date .prev-pat .next-pat .locale
	][
		reset
		.locale: any [locale system/locale/locale]
		system/locale/tools/expand-locale .locale
		charmap: formatting/update-charmap/for .locale
		.date: either date? dt [dt][now/date + dt]
		out: make string! 10 + length? mask
		
		sequence: clear []
		patterns: clear []
		parse mask [collect into sequence any [			;-- extract the masks used so we can look around in that space
			p: if (set [pat: prep: emit:] blk: lookup-pattern p)
			(do prep  repend patterns [pat emit])
			keep ('pattern)
			(n: length? pat) n skip
		|	=emit-literal=
		|	reserved! (ERROR "Invalid mask pattern at (mold p)")
		|	keep skip
		] mask:]
		
		.prev-pat: .next-pat: none
		for-each [p: pat code] patterns [				;-- eval pattern code and combine the output
			
			e: any [find s: sequence 'pattern  tail s]
			append/part out s e
			sequence: next e
			.prev-pat: p/-2
			.next-pat: p/3
			set/any 'r do code
			if integer? :r [r: form-integer* r]			;-- use internal form to avoid allocations
			
			if string? :r [
				forall r [								;-- localize digits in results only
					if find digit! r/1 [r/1: charmap/default/(r/1)]	;@@ this should be `map`
				]
			]
			append out r
		]
		append out sequence								;-- flush out the rest of literal text
		out
	]
	

	build-rule-map
	
	; probe formatting/format-date-time now "023:59:59"
	; trace/deep [
	; probe formatting/format-date-time/in now/precise "31/Dec/1999 'at' 023:59:59.ffff XXth" 'en
	; ]
]




;@@ TODO: for money: use default mask for given currency (not locale)?
;@@ supplementaldata.red doesn't have masks per se, but rounding and number of fractionals

;@@ TODO: cache masks and their analysis results, to speed formatting up





; #include %../common/new-each.red
; #include %../common/composite.red
; #include %../common/error-macro.red
; #include %../common/count.red

; #include %../common/profiling.red
; #include %../common/show-trace.red


;-- formatting context is defined by split-float.red
formatting: make formatting [
	format-number-with-mask: none 
]

exponent-of: function [
	"Returns the exponent E of number X = M * (10 ** E), 1 <= M < 10"
	x [number!]
	;; return: none for zero and +-inf/nan (to integer overflows)
][
	attempt [to integer! round/floor log-10 absolute x]
]


;@@ make this "formatting/number-format-ctx" or leave anonymous?
context [
	sign!:         charset "+-"
	brace!:        charset "()"
	digit!:        charset "0123456789"
	digit19!:      charset  "123456789"
	figure!:       charset "0123456789#"
	; figure+space!: charset "0123456789# "
	exponent!:     charset "Ex"
	separator!:    charset " ."
	indentation!:  charset [" ^(A0)^(202F)^(205F)^(3000)" #"^(2000)" - #"^(200A)"]
	hash:          #"#"
	dollar:        #"$"
	permille:      #"‰"
	
				;-- charsets case sensitive?
	
	
	;;=======  INDEPENDENT FUNCS  =======
	
	
	grouping?: function [
		"Extract all group sizes (reversed) from a mask with spaces"
		digits [string!] "only digits, # and spaces allowed"
		buf    [block!]  "where to extract (cleared)"
	][
		clear buf
		parse/case digits [collect into buf any [
			remove any #" " p1: some figure! p2: keep (offset? p1 p2)
		]]
		if 2 <= length? buf [buf/1: max buf/1 buf/2]	;-- 1st group is grown up to 2nd
		reverse buf										;-- now group before last is the primary one
	]
	
	rounding?: function [
		"Convert string of digits into integer rounding period"
		digits [string!] "may start with #s; no spaces"
	][
		
		either digits: find digits digit19! [to integer! digits][0]
	]
	
	split-money: function [
		"Split-float analog for money values"
		x [money!] base [integer!]
	][
		r: ["" "" "" "" ""]
		parse s: mold/all x [remove thru #"$" to #"." p:]	;-- an allocation we can't get rid of :(
		if all [base <> 0  x <> $0] [
			either base > 0 [							;-- separator moves left
				whole: -1 - base + index? p
				remove p
				if whole <= 0 [insert/dup s #"0" 1 - whole  whole: 1]
				insert p: skip s whole #"."
			][											;-- separator moves right 
				frac: -1 + base + length? p
				remove p
				if frac <= 0 [append/dup s #"0" 1 - frac  frac: 1]
				insert skip tail s negate frac #"."
				parse s [remove any [#"0" not #"."] to #"." p:]	;-- remove leading zeroes
			]
		]
		append      clear r/1 pick "-+" x < $0
		append/part clear r/2 s p
		append      clear r/3 next p
		append      clear r/4 pick "-+" base < 0
		append      clear r/5 absolute base
		r
	]
	
	
		
		
	;;=======  FUNCS USING SHARED DATA  =======
	
	
	;; modifiable shared data starts with `.` to avoid name collisions
	.head:     object [whole: frac: exp: none]			;-- before 1st digit/hash of each scope
	.tail:     object [whole: frac: exp: none]			;-- after last digit/hash of each scope
	.signs:    object [whole:       exp: none]			;-- yes => sign is present in the mask, don't emit default sign
	.groups:   object [whole: frac: exp: none]			;-- group sizes; 'frac' is used in significant mode only
	.min:      object [whole: frac: exp: none]			;-- min digits: count of digits
	.max:      object [whole: frac: exp: none]			;-- max digits: count of digits and '#'
	.split:    object [sign: whole: frac: exp-sign: exp: none]	;-- parts of the number after split-float
	.masks:    object [whole: "" frac: "" exp: ""]		;-- holds digits, hash & space only
	.mask:       none									;-- used for error reporting only
	.currency:   none									;-- pos of $$$ in the mask or none
	.got-frac?:  none									;-- whether fractional part is present in the mask
	.got-exp?:   none									;-- whether exponent part is present in the mask
	.multiplier: none									;-- 100 or 1000 - for percents
	.scope:      none									;-- scope of the mask currently processed: whole/frac/exp
	.context:    none									;-- localization context: default/superscript/finance
	.charmap:    none									;-- charmap (locale) chosen for current format run
	.locale:     none									;-- current locale for currency formatting
	.curr-name:  none									;-- current currency name
	.number:     none									;-- number being formatted
	.base:       none									;-- exponent of number in formatted output
	.out:        none									;-- output buffer
	
	reset: does [
		set .head set .tail set .signs set .groups
		          set .min  set .max   set .split  none
		foreach w [whole frac exp] [clear .masks/:w]
		set [.mask .currency .got-frac? .got-exp? .multiplier
			 .scope .context .charmap .locale .currname .out] none
	]
	
	localize-char: function [
		"Get localized version of a char or string"
		char [char!]
	][
		any [
			select .charmap/:.context :char
			.charmap/default/:char
			char
		]
	]
	
	get-currency: function [
		"Get currency name of given mask size"
		size [integer!]
	][
		; #assert [size <= 4]							;-- 4 removed per team decision
		
		list: system/locale/list/:.locale/currency-names/:.curr-name
		
		sizes: [
			list/char
			list/std
			.curr-name
			; 'cardinal									;-- removed per team decision
		]
		curr: any at sizes size
		; if curr = 'cardinal [							;-- removed per team decision
			; width: system/locale/cardinal/:.locale
				; n: absolute .number						;-- abs value
				; round/to/floor n 1.0					;-- int part before split: float because may overflow int32
				; max .min/frac length? .split/frac		;-- count of frac digits with trailing 0s
				; none									;-- unused
				; none									;-- unused
				; .base									;-- exponent in formatted value
			; curr: any [
				; list/:width
				; list/other								;-- fallback to other because currencies may not use all forms
				; list/name								;-- fallback to title for exotic currencies (no spelling data)
			; ]
			; #assert [curr] 
		; ]
		curr
	]
	
	get-sign: function ["Get sign for relevant (mantissa/exponent) scope"] [
		either .scope = 'exp [.split/exp-sign/1][.split/sign/1]
	]
				
	get-lengths: function [
		"Count min/max digits and ensure they're in order"
		word [word!] token1 [char! word!] token2 [char! word!] name [word!]
	][
		parse/case digits: .masks/:word compose/into [
			any (token1) p: any (token2)
			[end | (ERROR "(token1) cannot follow (token2) in the (name) part of (mold .mask)")]
		] clear []
		.min/:word: either token1 = hash [length? p][-1 + index? p]
		.max/:word: length? digits
	]
	
	;@@ this is an interesting func to tackle in morph: 2 sources, one is also target
	regroup: function [
		"Insert .groups/:scope separators into reversed .split/:scope"
		scope [word!] "whole/frac/exp"
		/after len [integer!] "Skip first LEN digits"
	][
		g2: pick tail .groups/:scope -2					;-- get primary group
		unless g2 [exit]								;-- do nothing if mask has no groups
		len: any [len 0]
		s: .split/:scope
		gs: .groups/:scope
		s: skip s gs/1
		while [not tail? s] [
			if len < index? s [s: insert s #" "]		;-- separator will be localized, not here
			g: any [first gs: next gs  g2]				;-- use primary group once exhausted the others
			s: skip s g
		]
	]
	
	
	
	;;=======  MASK MERGING  =======
	
	
	{	Some memo here, but it's only the idea, doesn't cover all the intricacies:
		
		significant (applies to mantissa only):
			ignore all #s
			insert non-significant zeroes (and dot) before the first 0
			insert significant digit (maybe zero) for each 0
			switches to frac part when exhausts wholes, automatically, and this inserts "."
			separators in the mask are ignored (after inferring groups)
				formatted parts should be separated in advance and separators inserted
				for that, both whole and frac has to be padded with 0s up to total significants + leading zeros
		whole (applies to exp, whole in frac mode):
			does not emit "." because it exists in the mask
				yet "." disappears if empty fraction part 
			need .split/whole length >= number of figures (incl #)
				insert 0 for each extra 0 in the mask, then
				insert # for each extra # in the mask
			extra wholes are inserted before first figure is emitted,
			so need to know the lengths of all mask parts and length of formatted number parts
				part present in the mask doesn't have to be separated, e.g.:
				`0_ 00`: if we ignore space and insert our separator,
				we don't know if it's `0_ 00` or `0 _00` and mess it up
				so we both insert our separators and pass mask separators
		frac (applies to frac part in frac mode):
			need no separation (because formatted frac length <= frac mask length)
				just insert digit for each 0 and #
			# gets eaten if no more digits, while 0 emits 0
				so trailing 0s have to be removed from formatted frac
			separators have to check for more digits and get eaten too!
				for that, we have to extend formatted fraction to count of 0s
				separators after that should only be emitted if there's more digits to follow
	}
	
	;; quotation rule is shared between all merge* funcs:
	;; '' works as single quote both inside '...' range and outside it
	;; this is unlike ICU and SQL which treat '' as empty string and '''' as single quote
	;; I don't think their behavior is at all useful in numeric masks, because they're mostly single letter
	;; and use case of splitting "$$$" into two masks "$$''$" is of zero value
	=emit-literal=: [
		#"'" [
			#"'" not #"'" keep (#"'")					;-- "x''x" case
		|	some [
				"''" keep (#"'")						;-- "x' '' 'x" case
			|	keep to #"'"
			] #"'"
		]
	]
	
	merge-part: function [
		"Merge part of the mask outside whole, fraction and exponent"
		start [string!] "starting offset"
		end   [string!] "ending offset"
		/local x
		/extern
			.scope			;-- only need to know if we're in exp part or not, to emit sign of mantissa or exp
			.context		;-- may switch to superscript
	][
		out: tail .out
		local: :localize-char
		parse/case/part start [collect into out any [	;-- /case to not accept %O, X, e as %o, x, E
			=emit-literal=
		|	set x exponent! keep (local x) (.scope: 'exp)
			any keep indentation!						;-- let indentation go before `10`
			opt [
				if (x = #"x") keep (local #"1") keep (local #"0")
				(.context: 'superscript)				;-- superscript for the next sign and digits
			]
		|	s: some dollar e: keep (
				; if 4 < size: offset? s e [			;-- 4 removed per team decision
				if 3 < size: offset? s e [
					ERROR "Unsupported currency mask '(copy/part s e)' in (mold .mask)"
				]
				fn: any [
					:.charmap/finance/:dollar			;-- used by testing locale
					:get-currency						;-- by all the others
				]
				fn size
			)
		|	#"+" keep (local get-sign)					;-- kept sign depends on .scope
		|	#"-" opt [if (#"-" = get-sign) keep (local #"-")]
		|	set x brace! opt [if (.split/sign/1 = #"-") keep (local x)]		;-- braces ignore exponent sign
		|	[permille | "%o"] keep (local permille)
		|	#"%" keep (local #"%")
		|	#"." opt [
				(.scope: 'frac)
				if (any [								;-- only emit decimal separator if will be digits after
					all [
						x: .masks/frac/1				;-- non empty fraction mask?
						find digit! x					;-- got guaranteed digits
					]
					find .split/frac digit19!			;-- at least one of '#'s will emit a digit
				])
				keep (local #".")
			]
		|	keep skip 
		]] end
	]
	
	merge-significant: function ["Merge whole mask as significant digits" /local] [
		
		
					;-- we should be before 1st figure
		out: tail .out
		local: :localize-char
		;; operates on whole mantissa (whole + frac formatted)
		joined: clear ""
		unless tail? .split/frac [append append joined .split/frac "."]
		append joined .split/whole
							;-- only digits & separators expected
		
		parse/case/part .head/whole [collect into out [	;-- /case because faster
			;; insert sign first
			opt [if (not .signs/whole) if (#"-" = .split/sign/1) keep (local #"-")]
			;; insert non-significant zeroes
			opt [
				if (find joined digit19!)				;-- not all zeroes?
				while [
					if (find "0 ." last joined)			;-- may transcend into fraction part
					keep (local take/last joined)		;-- if it has no significant digits
				]
			]
			;; now we sub each '0' with a digit, optionally prepending group or decimal separator
			any [
				digit! while [
					()		;-- have to be grouped in advance, so should be long enough
					keep (local c: take/last joined)
					if (find separator! c)				;-- stop after a digit, repeat after any separator
				]
			|	[#" " | hash]							;-- ignored
			|	=emit-literal=
			|	keep skip
			]
			;; now we also emit the rest of whole if it's not ended, but mask is exhausted
			opt [
				if (any [
					find joined #"."					;-- decimal is ahead, so we haven't exhausted all wholes 
					tail? .split/frac					;-- no formatted decimal, so we only have wholes
				])
				while [
					if (c: take/last joined)
					if (#"." <> c)
					keep (local c)
				]
			]
		]] .tail/whole
	]
	
	merge-whole: function [
		"Merge whole mask as positional digits"
		name [word!] "'whole (of mantissa) or 'exp"
		/local
	][
		; if .head/:name =? .tail/:name [exit]			can happen on ".000" mask - and we still emit wholes
		
			;-- mask is empty or starts with a figure
					;-- mask should be devoid of separators here
		part: .split/:name
		local: :localize-char
		;; this cannot be within parse/part because won't run if part is empty:
		;; emit default sign?
		all [
			not .signs/:name							;-- no explicit sign in the mask
			#"-" = get-sign								;-- value is negative
			append .out local #"-"
		]
		;; insert non-significant zeroes before the mask
		extra: (length? part) - (length? .masks/:name)	;-- more digits than in the mask?
		loop extra [append .out local take/last part]
		;; process the mask now
		out: tail .out
		parse/case/part .head/:name [collect into out [	;-- /case because faster
			any [
				figure!
					()
					keep (local c: take/last part)
			|	#" " opt [if (c <> hash) keep (local #" ")]		;-- eat separators before 1st digit (c = hash) 
			|	=emit-literal=
			|	keep skip
			]
		]] .tail/:name
	]
	
	merge-frac: function ["Merge fractional mask" /local] [
		
		if .head/frac =? .tail/frac [exit]				;-- exit if always empty frac part (00.)
						;-- should start with a figure
					;-- mask should be devoid of separators here
		;; insert non-significant zeroes first
		out: tail .out
		frac: .split/frac
		local: :localize-char
		parse/case/part .head/frac [collect into out any [		;-- /case because faster
			digit! keep (local any [take/last frac  #"0"])
		|	hash   keep (local any [take/last frac  hash])		;-- only emit a digit if present (hash -> "")
		|	#" " opt [if (not tail? frac) keep (local #" ")]	;-- emit separators only if digits ahead
		|	=emit-literal=
		|	keep skip
		]] .tail/frac
	]
	
	merge-mask: function [
		"Merge specific mask (dispatch)"
		name [word!] "whole/frac/exp"
	][
		switch name [
			exp [
				merge-whole name
				self/.context: if .currency ['finance]		;-- turn off superscript if it was on
			]
			whole [
				either .got-frac? [merge-whole name][merge-significant]
			]
			frac [merge-frac]
		]
		.tail/:name											;-- return end of mask
	]
		
		
	;; extracts figures and separators from the mask - into .masks
	analyze-mask: context [
		p: x: none
		emit: func [c] [append .masks/:.scope c]
		=string=: [#"'" thru #"'"]						;-- just skipped, uninteresting
		=figure=: [
			set x figure! (
				unless .head/:.scope [.head/:.scope: p]	;-- first figure determines scope's head
				.tail/:.scope: next p					;-- last figure determines scope's tail
				emit x
			)
		]
		=currency=: [set .currency some dollar]			;-- used to switch digits & separators to monetary
		=curr-sep=: [
			if (.scope = 'whole) if (.head/whole)		;-- only recognized as separator after whole digits
			=currency=
		]
		=grpsep=: [set x #" " (emit x)]					;-- spaces later serve to extract group size
		=decsep=: [
			set .got-frac? [#"." | =curr-sep=]
			opt [if (.scope <> 'whole) (ERROR "Extra decimal separator detected in (mold .mask)")]
			(
				unless .tail/whole [.head/whole: .tail/whole: p]	;-- define whole part if it wasn't before
				.scope: 'frac
			)
		]
		=exp=: [
			set .got-exp? exponent!
			opt [if (.scope = 'exp) (ERROR "Extra exponent detected in (mold .mask)")]
			(
				unless .tail/whole [.head/whole: .tail/whole: p]	;-- define whole part if it wasn't before
				unless .tail/frac  [.head/frac:  .tail/frac:  p]	;-- define frac part if it wasn't before
				.scope: 'exp
			)
		]
		=sign=: [
			sign! (put .signs either .scope = 'exp ['exp]['whole] yes)	;-- needed to insert sign when unspecified
		]
		=braces=: [brace! (.signs/whole: yes)] 						;-- also needed to insert sign when unspecified
		=percents=: [
			["%o" | permille] opt [if (.multiplier) (ERROR "Extra permille marker in (mold .mask)")]
			(.multiplier: 1000)
		|	#"%"              opt [if (.multiplier) (ERROR "Extra percent marker in (mold .mask)")] 
			(.multiplier: 100)
		]
		
		return func [mask] [
			.scope: 'whole
			parse/case mask [any [
				p: =figure= | =string= | =grpsep= | =decsep= | =exp=
				| =sign= | =braces= | =currency= | =percents= | skip
			]]
			if any [
				not .head/whole
				all [.head/whole =? .tail/whole  .head/frac =? .tail/frac]
			] [ERROR "Mask (mold .mask) has no place for digits"]
			if all [.got-exp? .head/exp =? .tail/exp] [
				ERROR "Mask (mold .mask) is missing exponent digits"
			]
			if all [.got-frac? = #"$" .head/frac =? .tail/frac] [
				.got-frac?: none						;-- `$` only works as decimal separator if followed by fraction
			]
		]
	]
		
	;;=======  THE ENTRY POINT  =======
	
	formatting/format-number-with-mask: function [
		"Format a number, using a mask as a template" 
		num  [number! money!]
		mask [string!] {e.g. "# ##0.###"}
		/in locale [word! none!] "Override default locale"
		/local x 
		/extern .mask .scope .got-frac? .got-exp? .context .charmap .out .locale .curr-name .number .base
	][
		num: .number: to float! orig: num				;-- normalize input
		reset
		
		;; select (and prepare) charmap for localization
		.locale: any [locale system/locale/locale]
		unless .locale = 'testing [system/locale/tools/expand-locale .locale]
		.charmap: formatting/update-charmap/for .locale 
		
		.curr-name: any [
			if money? orig [orig/code]
			if .locale = 'testing ['USD]
			system/locale/list/:.locale/currency
		]
	
		;; fills .masks, sets .head .tail .got-exp? .got-frac? .signs .multiplier .currency 
		analyze-mask .mask: mask
		
		.out: result: clear copy mask
		
		;; special floats handled here because we still may want to keep prefix & suffix
		;; and higher level format doesn't know how to keep them
		if special: case [
			nan? num ['nan]
			1.#inf = absolute num ['inf]
		][
			.scope: 'whole  .context: none
			.split/sign: either num > 0 ["+"]["-"]
			merge-part mask .head/whole					;-- emit prefix
			if all [special = 'inf  not .signs/whole] [	;-- emit sign for inf
				append .out .split/sign
			]
			append .out .charmap/default/:special		;-- whole mask is replaced by nan/inf
			mask-end: any [.tail/exp .tail/frac .tail/whole]
			merge-part mask-end tail mask				;-- emit suffix
			return result
		]
		
		;; find all group sizes & remove spaces
		.groups/whole: grouping? .masks/whole []
		.groups/exp:   grouping? .masks/exp   []
		trim/all .masks/frac
		
		;; calc .min & .max; check order between 0s and #s
		get-lengths 'whole hash 'digit! 'whole      mask
		get-lengths 'frac  'digit! hash 'fractional mask
		get-lengths 'exp   hash 'digit! 'exponent   mask
		
		;; extract rounding from the mask
		rounding-exp: rounding? .masks/exp
		exp:  any [exponent-of num 0]
		base: round/floor/to either .got-exp? [exp][0] rounding-exp
		rounding-manti:									;-- mantissa rounding depends on exp rounding (base)
			either .got-frac? [							;-- fractional mode: join whole & frac rounding
				rf: rounding? .masks/frac
				rw: rounding? .masks/whole
				pow: 10.0 ** length? .masks/frac
				either rw + rf = 0 [					;-- no rounding defined
					1.0 / pow							;-- default rounding: to last frac digit
				][
					rf / pow + rw						;-- rounding as specified by the mask
				]
			][											;-- significant mode: no frac part
				(max 1 rounding? .masks/whole)			;-- default rounding: to last significant digit
				* (10.0 ** (exp - base - .min/whole + 1))
			]
		if .multiplier [
			num: num * .multiplier						;@@ modification should not cause issues if we use 15 digits only?
			orig: orig * .multiplier					;@@ mb forbid usage of % given money! value?
		]
		
		;; round the number
		prec: rounding-manti * (10 ** base)
		all [
			money? orig
			any [
				if prec <= 1e-5 [prec: $0]				;-- if it's below money precision
				attempt [prec: to money! prec]			;-- or if prec is convertible to money
			]
			num: orig									;-- we can feed original money value to `round`
		]
		rounded: any [
			attempt [round/even/to num prec]			;-- may overflow - see #5002
			round/even/to to float! num to float! prec	;-- /even is statistically neutral, ICU-recommended
		]
		;; rounding might have changed the exponent (e.g. 9.6 -> 10)
		;; so we have to repeat calculation before formatting it
		all [
			.got-exp?
			exp: exponent-of to float! rounded exp		;-- when rounds to zero, do not reset exponent to zero!
			base: round/floor/to exp rounding-exp
		]

		;; split the number into string
		;; fails on 17 digits: round/even/to 0.00263  10.0 * (10 ** -6)  -> 0.0026299999...
		;; fails on 16 digits: round/even/to 1.234E-30 1.0 * (10 ** -30) -> 9.9999999999...
		.base: base
		set .split any [
			if money? rounded [split-money rounded base]
			formatting/split-float* rounded base 15 ["" "" "" "" ""]
		]
		
		;; clean formatted parts from extra zeroes
		frac-hashes: skip .split/frac .min/frac
		clear any [										;-- clear trailing 0s from fraction
			find/last/tail frac-hashes digit19!
			frac-hashes
		]
		if all [
			.split/whole = "0"
			.got-frac?									;-- leave 0. in significant mode
			not tail? .split/frac						;-- leave 0. if fraction is also zero
		] [clear .split/whole]
			;-- sanity check
		
		;; pad formatted parts with 0s and #s as necessary
		reverse .split/whole							;-- reverse masks in order to use take/last
		reverse .split/exp
		either .got-frac? [
			append/dup .split/whole #"0" .min/whole - length? .split/whole 	;-- extend .split to masks lengths
			append/dup .split/frac  #"0" .min/frac  - length? .split/frac
			append/dup .split/whole #"#" .max/whole - length? .split/whole	;-- '#' serves as a vanishing digit
		][
			;; significant mode: whole & fractional parts should be processed as one
			total: (length? .split/whole) + length? .split/frac
			;; leading zeroes move the location of first significant digit:
			if .split/whole = "0" [						;-- can only have 1 leading zero in whole part
				total: total - index? any [find .split/frac digit19!  tail .split/frac]
			]
			append/dup .split/frac  #"0" .min/whole - total
			.groups/frac: .groups/whole					;-- separate groups for fraction aren't supported
			regroup 'frac								;-- so we just mirror whole groups onto fraction
		]
		reverse .split/frac
		if .got-exp? [
			append/dup .split/exp #"0" .min/exp - length? .split/exp
			append/dup .split/exp #"#" .max/exp - length? .split/exp 
		]
		
		;; regroup only after growing masks with 0s and #s
		either .got-frac? [
			regroup/after 'whole .max/whole
		][	regroup       'whole						;-- in significant mode we regroup full pattern
		]
		regroup/after 'exp .max/exp

		;; finally we can emit the mask parts
		.scope: 'whole									;-- tracks what kind of sign we're emitting: exp or mantissa
		.context: if .currency ['finance]				;-- affects digits: normal or monetary
		merge-part mask .head/whole
		pos: merge-mask 'whole
		if all [.got-frac? .head/frac] [
			merge-part pos .head/frac
			frac: tail result
			pos: merge-mask 'frac
		]
		if all [.got-exp? .head/exp] [
			merge-part pos .head/exp
			pos: merge-mask 'exp
		]
		merge-part pos tail mask
		result
	]
	
	; formatting/update-charmap							;@@ prebuild it for english or not?
]


#localize [] 



context [
	fetch-named-mask: function [name [word! path!] locale [word! none!] contexts [block!]] [
		locale: any [locale system/locale/locale]
		system/locale/tools/expand-locale locale
		loc-data: system/locale/list/:locale
		nums: loc-data/numbers
		hives: [nums/(nums/system)/masks loc-data/calendar/masks]
		if path? name [name: as [] name]
		if empty? contexts [contexts: [[]]]
		foreach hive hives [
			hive: get hive
			foreach ctx contexts [
				path: as path! compose/into [hive (ctx) (name)] clear []
				mask: attempt [get/any path]
				if any [string? :mask  any-function? :mask] [return :mask]
			]
		]
		none
	]
	
	set 'format function [ 
		"Format a value"
		value  [number! money! date! time!] "Other types TBD"
		format [word! path! string!] "Mask or named format, e.g. 'datetime/full"
		; value [any-type!]
		; fmt [word! string! block! function! object! map!] "Named or custom format"
		/in locale [word!]      "Locale to express value in"
	][
		switch type?/word value [
			integer! float! percent! money! [
				if any [word? format path? format] [
					format: any [
						fetch-named-mask format locale [number money []]
						ERROR "Unknown format name: (format)"
					]
					if any-function? :format [format: format :value]
				]
				formatting/format-number-with-mask/in value format locale
			]
			date! time! [
				if any [word? format path? format] [
					ctx: case [
						time? :value [[time [] datetime]]		;-- fallback to datetime formats when only time is given
						date? :value [[datetime date []]]
					]
					format: any [
						fetch-named-mask format locale ctx
						fetch-named-mask format locale: 'red ctx	;-- fallback for standardized formats
						ERROR "Unknown format name: (format)"
					]
					if any-function? :format [format: format :value]
				]
				formatting/format-date-time/in value format locale
			]
		]
	]
]



; #include %composite.red


num-legend: {Legend:
[.]    decimal separator
       switches from significant into fractional digits
[E]    switches from fixed decimal into exponent mode
[x]    same as E, but with user-friendly output
[#]    optional digit
[0]    required digit
[1-9]  required digit + rounding
[ ]    group (thousands) separator (space char)
[+]    place for minus or plus sign
[-]    place for minus sign
[( )]  place for accounting negative sign
[$]    single-letter currency identifier
[$$]   standard currency identifier (may equal $)
[$$$]  ISO currency code
[%]    output as percent
[%o]   output as permille
[' ']  insert quoted string, or if empty - apostrophe
}
; [$$$$] full currency name								;-- removed per team decision

dat-legend: {Legend:
         Era: +, Anno Domini, Common Era, AD, CE (+lower)
     Century: 20, 20th, c, cth, cr, XX, XXth, CR, CRth 
        Year: yyyy, yy, yr, 1999, 99
     Quarter: q..qqq, 4th quarter, Q4, q4
       Month: mm, m, 012, 12, Month, Mon, M, December, Dec, D
Day of month: dd, d, 031, 31
 Day of week: 7, W..Wwww, Sunday, Sun, Su, S, Day, Dy (+lower)
 Time of day: A..AAA, A.M., AM, P.M., PM, P (+lower)
        Hour: hhh, hh, hh23, hh12, hh11, h23, h12, h11,
              023, 012, 011, 23, 12, 11
      Minute: mi, mm, 59
      Second: ss, 59
    Fraction: f..ffffff
   Time zone: GMT, UTC, +ZZZZ, +ZZ:ZZ, +z:zz, +zz, +z,
              +00:00Z, +0000Z, +00:00, +0000, +0:00, +00, +0
}

nm-known: ["dec" "sci" "eng" "pct" "std" "acct"]
dm-known-str: {full long medium short (also prefixed by time/ date/ datetime/)
RFC3339 Atom W3C W3C-DTF ISO8601 ISO-8601 RFC822 RFC2822
RFC1123 RSS HTTP-Cookie RFC850 USENET RFC1036}
dm-known: [
	datetime/full datetime/long datetime/medium datetime/short
	date/full date/long date/medium date/short
	time/full time/long time/medium time/short
	full long medium short
	RFC3339 Atom W3C W3C-DTF ISO8601 ISO-8601 RFC822 RFC2822
	RFC1123 RSS HTTP-Cookie RFC850 USENET RFC1036
]

fixed: system/view/fonts/fixed
pnl-clr: any [attempt [system/view/metrics/colors/panel] white]		;@@ workaround for #3810
count: length? system/locale/list
langs: map-each/eval [k v] system/locale/list [
	system/locale/tools/expand-locale k
	v: either k = 'red ["red: Red"] [
		also s: rejoin [k ": " v/lang-name]
		if v/region-name [repend s [" (" v/region-name ")"]]
	]
	[k v]
]
copy-data: function [names] [
	r: copy #[]
	foreach w names [
		face: get w
		label: pick find/same face/parent/pane face -1 
		put r to set-word! label/text any [face/text face/data/(face/selected * 2)]
	]
	write-clipboard mold/only to [] r
] 
view compose/deep [
	title "Format masks playground"
	tab-panel pnl-clr [
		"dates" [
			text "Mask:" dm: field focus 250 "023:59:59 031/Dec/1999 'GMT'+00:00"
				on-key-down [if event/key = tab [set-focus dv]] return
			pad 30x-5 text 50x40 font-size 9 "Can be^/one of:"
				text 370 font-size 9 (dm-known-str) return
			pad 0x0 text "Date:" dv: field 250 (mold now/precise)
				on-key-down [if event/key = tab [set-focus dm]] return
			pad 90x-10 text "A date! or time! value" return
			pad 0x-10 text "Result:" dr: text 400 react [
				df: try/all [
					mask: either find/only/case dm-known w: attempt [transcode/one dm/text] [w][dm/text] 
					format/in load dv/text mask to word! pick dl/data dl/selected * 2 - 1
				]
				if error? df [parse form df [thru "***" opt [to "{"] copy df to "***"]]
				dr/text: df
			] return   
			pad 0x-10 text "Language:" dl: drop-list 250 select count on-change [face/selected: face/selected]
				data langs
				on-key-down [if event/key = tab [set-focus dm]] 
			button "Copy data" [copy-data [dm dv dl dr]] return
			pad 0x-25 db: box left font-name fixed dat-legend on-created [db/size: db/size + 40] 
		]
		"numbers" [
			text "Mask:" nm: field focus 150 "# #0.00"
				on-key-down [if event/key = tab [set-focus nv]] return
			pad 90x-10 text (`"Can be one of [(nm-known)]"`) return
			pad 0x-10 text "Number:" nv: field 150 "123.4567"
				on-key-down [if event/key = tab [set-focus nm]] return
			pad 90x-10 text "A number! or money! value" return
			pad 0x-10 text "Result:" nr: text 300x30 react [
				nf: try/all [
					mask: either find/case nm-known nm/text [to word! nm/text][nm/text] 
					format/in load nv/text mask to word! pick nl/data nl/selected * 2 - 1
				]
				if error? nf [parse form nf [thru "***" opt [to "{"] copy nf to "***"]]
				nr/text: nf
			] return   
			text "Language:" nl: drop-list 250 select count on-change [face/selected: face/selected]
				data langs 
				on-key-down [if event/key = tab [set-focus nm]]
			button "Copy data" [copy-data [nm nv nl nr]] return
			pad 0x-25 nb: box left font-name fixed num-legend on-created [nb/size: nb/size + 40] 
		]
	]
	origin 50x50
]

];;do