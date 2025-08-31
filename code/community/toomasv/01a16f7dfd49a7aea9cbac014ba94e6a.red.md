# 

**Gist ID:** 01a16f7dfd49a7aea9cbac014ba94e6a
**Created:** 2017-09-10T14:37:08Z
**Last updated:** 2017-09-12T08:39:58Z

## File: `chatbot.red`

```Red
Red [
  Original: "Gregg Irwin"
  Source: https://gitter.im/red/help?at=59b3040566c1c7c4772d4172
  Purpose: "Toy chatbot about Red functions"
  Needs: "info.red (https://gist.github.com/toomasv/eaac3829ac5e745f43121aa60b555d68)"
]

; See: http://www.red-lang.org/2016/03/060-red-gui-system.html blog entry
; Lots of name choices to consider.

subject-proto: object [
    _conns: copy []    ; observer connections

    on-deep-change*: func [owner word target action new index part][
        ; The _conns check here is something we could support, so you could
        ; observe the changes to the observer list.
        if word <> '_conns [
            foreach conn _conns [
                attempt [conn/on-change owner word target action new index part]
            ]
        ]
    ]

    observer?: func [obj [object!]][
        not none? find words-of obj 'on-change
    ]
    attach: func [obj [object!]][ ;  /with words [word! block!]
        either observer? obj [
            if not find _conns obj [append _conns obj]    ; single-entry registrar
        ][
            print mold obj
            return make error! "The given object doesn't look like an observer."
        ]
        obj
    ]
    detach: func [obj [object!]][ ;  /with words [word! block!]
        take find _conns obj
    ]

]

observer-proto: object [
    on-change: func [owner word target action new index part][
        print ['on-change owner word target action new index part]
    ]
    watch: func [obj [object!] "Subject"][obj/attach self]
    unwatch: func [obj [object!] "Subject"][obj/detach self]
]

;-------------------------------------------------------------------------------
do %../utils/info.red
gitter: make subject-proto [messages: copy []]
subscriber: make observer-proto [
    id: none
	partner: none
	remarks: none
	handle: none
	answer: none
    on-change: func [owner word target action new index part][
        if id = first new [
			handle new/2
			wait 0.1
			print switch id [
				 "Guru" [rejoin [space id ": " answer]] 
				"Newbe" [rejoin [id ": " answer]]
			]
			insert gitter/messages reduce [partner answer]
		] ; owner target 
    ]
]
elements: ["arguments" "refinements"]
funct: [to remove copy insert change clear move
	; action!
	poke put random reverse sort swap take trim add subtract divide multiply
	reflect form mold modify absolute negate power remainder round complement 
	append at back find	skip tail head next	pick select delete read write
	and~ or~ xor~ 
    ; native!
	log-2 log-10 log-e exp square-root construct as-pair break
	continue exit extend debase enbase to-local-file wait unset new-line
	set-env get-env list-env now call 
    ; function!
	collect quote on-parse-event math last source expand show input
	quit dir make-dir cause-error attempt body-of first second
	third mod clean-path to-red-file normalize-dir list-dir pad dirize
	what-dir expand-directives load	split-path change-dir to-file path-thru
	save load-thru View to-float charset probe q words-of replace repend
	react spec-of halt to-paren routine class-of size-text draw link-tabs-to-parent
	link-sub-to-parent on-face-deep-change*	update-font-faces do-actor 
	do-safe do-events foreach-face hex-to-rgb alter set-flag layout
	extract to-logic to-set-word to-block center-face dump-face request-font
	request-file request-dir rejoin ellipsize-at keys-of a-an also 
	parse-func-spec help-string what common-substr red-complete-file 
	red-complete-path unview comment fourth fifth values-of to-bitset
	to-binary to-char to-email to-get-path to-get-word to-hash to-integer 
	to-issue to-lit-path to-lit-word to-map to-none to-pair	to-path 
	to-percent to-refinement to-set-path to-string to-tag to-time 
	to-typeset to-tuple to-unset to-url to-word to-image to-date
	parse-trace modulo eval-set-path extract-boot-args flip-exe-flag 
	split do-file read-thru	do-thru cos sin tan acos asin atan atan2 sqrt
	clear-reactions dump-reactions get-scroller	insert-event-func 
	remove-event-func set-focus	help fetch-help about ls ll pwd cd 
	red-complete-input
]
funct-len: length? funct

Guru: make subscriber [
	id: "Guru" 
	partner: "Newbe"
	remarks: []
	limit: 10
	n: 0
	fun: none
	handle: func [response /local el es elem fn e][
		parse response [
			opt ["Hello!" (n: 0)] 
			(n: n + 1) [
				thru "How many " copy elem ["arguments" | "refinements"] " does `" copy fn to #"`" "` have?"
				(
					;probe reduce [elem fn]
					el: switch elem [
						"arguments"	['arg-num]
						"refinements" ['ref-num]
					]
					;probe compose ["limit, n: " (limit) (n) (to-path reduce ['info el]) (to-word fn)] 
					e: do reduce [to-path reduce ['info el] fun: to-word fn]
					if e = 1 [elem: head remove back tail elem]
					answer: rejoin ["`" fn "` has " e #" " elem "!"]
				)
			
			|	"And what " ["is this " | "are these "] copy elem to #"?" skip
				(
					el: case [
						find/match "arguments"   elem ['arg-names]
						find/match "refinements" elem ['ref-names]
					]
					e: do reduce [to-path reduce ['info el] fun]
					either 1 = (length? e) [
						answer: rejoin ["It is `" to-string first e "`."]
					][
						es: copy ""
						forall e [
							append es case [;probe reduce [index? e length? head e]
								1 = (index? e) [to-string e/1]
								(index? e) = (length? head e) [rejoin ["` and `" to-string e/1]]
								true [rejoin ["`, `" to-string e/1]]
							]
						]
						answer: rejoin ["These are `" es "`."]
					]
				)
			|	"What type?"; | ["Would you tell me the type of this " | "Can you tell me what types these "] copy elem to #" " to end]
				(answer: "Start")
			;	(
			;		el: case [
			;			find/match "arguments"   elem ['arg-types]
			;			find/match "refinements" elem ['ref-types]
			;		]
			;		e: do reduce [to-path reduce ['info el] fun]
			;		either 1 = (length? e) [
			;			answer: rejoin ["This " elem " is of type '" to-string first e "'."]
			;		][
			;			es: copy ""
			;			forall e [
			;				append es case [
			;					1 = (index? e) [to-string e/1]
			;					((index? e) + 1) = (length? e) [rejoin ["' and '" to-string e/1]]
			;					true [rejoin ["', '" to-string e/1]]
			;				]
			;			]
			;			answer: rejoin ["Type of these " elem " are '" es "'."]
			;		]
			;	)
			](
				if n = limit [ 
					answer: rejoin [
						"One newbe can ask more than 10 gurus can answer.^/"
						"       I have to do some work now. Have a nice day!^/"
						"       BTW " answer " :)"
					] 
					unwatch gitter
				]
			)
		]
	]
]
int: charset "0123456789"
Newbe: make subscriber [
	id: "Newbe" partner: "Guru"
	remarks: [
		"How many [elements] does [funct] have?"
		"What [is] [this] [elements]?"
		"Is [funct] of type [type]?"
		"How can I [funct] [arg1]?"
		"What type is [arg] of [funct]"
	]
	;n: 0
	fun: ele: none
	handle: func [response /local fn e elem str][
		;n: n + 1
		parse response [
			"Start" (
				;n: 1
				answer: copy rejoin [
						"Hello! How many " pick elements random 2 " does `" pick funct random funct-len "` have?"
				]
			)
		|	"One newbe can ask more" 
			(
				answer: copy rejoin [
					"You are " pick super random length? super
					"! Happy coding! Waiting for next release!"
				]
			)
		|	#"`" copy fn to #"`" "` has " copy e some int space copy elem to #"!" skip 
			[
				if (0 < (e: to-integer e))
				(
					fun: fn ele: elem
					answer: rejoin either e = 1 [
						["And what is this " elem "?"]
					][
						["And what are these " elem "?"]
					]
				)
			|	( 
					answer: rejoin ["But how many " pick elements random 2 " does `" pick funct random funct-len "` have?"]
				)
			]
		|	copy str ["It is " | "These are "] thru #"."
			(
				answer: rejoin [
					copy pick answer-bag random length? answer-bag
					"But how many " pick elements random 2 " does `" pick funct random funct-len "` have?"
				]
				;answer: switch str [
				;	"It is " 	 [rejoin ["Would you tell me the type of this " ele "?"]]
				;	"These are " [rejoin ["Can you tell me what types these " ele " are?"]]
				;]
			)
		;|	to ["is of type" | "Type of these"] to end
		;	(
		;		answer: rejoin [
		;			copy pick answer-bag random length? answer-bag
		;			" But how many " pick elements random 2 " does '" pick funct random funct-len "' have?"
		;		]
		;	)
		| 
			(
				answer: rejoin [
					copy pick answer-bag random length? answer-bag
					"But how many " pick elements random 2 " does `" pick funct random funct-len "` have?"
				]
			)
		]
	]
	answer-bag: [
		"Thank you! "
		"Wow! "
		"Cool! "
		"Amazing! "
		"Isn't that cute! "
		"I knew this! Thanks anyway. "
	]
	super: ["awsome" "amazing" "the man" "super" "my hero"]
]
Guru/watch gitter
Newbe/watch gitter


comment [
  ;To start:
  append gitter/messages ["Newbe" "Start"]
]
```

## Comments

### @toomasv on 2017-09-10T14:40:09Z

To start chatbot:
Adjust location of `%info.red` in code. (currently `%../utils/info.red`)
```
do %messages.red
insert gitter/messages ["Newbe" "Start"]
```

