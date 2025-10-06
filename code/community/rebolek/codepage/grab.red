Red [
	Links: [
		https://w3techs.com/technologies/history_overview/character_encoding
	]
	Usage: {
	Grab codepages from Wikipedia with GRAB-PAGE <link>
	Make binary blob with COMPILE-FILES, it scans current directory for
	%.codepage files and returns block with metadata and binary blob
}
]

.: context [
compile-rule: func [value /local rule tag][
	value: copy value
	parse value rule: [
		some [
			change ['thru-tag set tag word!] (
				compose [thru (rejoin [#"<" tag]) thru #">"]
			)
		|	change ['match-tag set tag word!] (
				compose [(rejoin [#"<" tag]) thru #">"]
			)
		|	ahead block! into rule
		|	skip
		]
	]
	value
]

result: []
title: none
index: 0

ws: charset " ^-^/"
ws*: [any ws]
hexnum: charset "1234567890ABCDEF"

rule: compile-rule [
; -- get name
	thru <title>
	copy title
	to " -"
	(replace/all title #"/" #"-")
; -- find table
	thru [
		<h2>
		[
			<span class="mw-headline" id="Character_set">{Character set}</span>
		|	<span class="mw-headline" id="Code_page_layout">{Code page layout}</span>
		]
	]
	p:
	thru-tag table
	thru <tbody>
; -- skip header
	thru-tag tr
	thru </tr>
; -- actual content
	some [
		ws* <tr>
		; -- skip line header
		thru </th>
		16 [
			(value: none)
			thru-tag td [
				ws* </td>
			|	p0: opt [
					match-tag span [
						match-tag link
						match-tag span
						opt [match-tag link]
						match-tag a
						thru <br />
					|	match-tag a
						thru <br />
					|	thru <br />
					]
				|	some [
						match-tag span
						opt [
							match-tag style
							thru </style>
						]
					]
					match-tag a
					thru <br />
				]
				p1:
				copy value to #"<"
				thru </td>
				(
					print value
					value: either parse value [4 hexnum][
						to char! to integer! to issue! value
					][
						; if it's not hexa number, it's probably HTML entity
						; in form &#160;
						take/last value
						to char! skip value 2
					]
				)
			]
			(repend result [index value])
			(index: index + 1)
		]
		ws* </tr> ws*
	]

]

set 'grab-page func [
	page
][
	clear result
	index: 0
	; TODO: to-url conversion needs support for "ISO/IEC 8859-x" format
	if word? page [page: rejoin [http://en.wikipedia.org/wiki/ page]]
	if url? page [page: read page]
	parse page rule
	save to file! rejoin [title %.codepage] result
	copy result
]

; -- end of context
]

page-to-bin: func [page /local _ value longest length][
	; Find longest char first
	longest: 0
	foreach [_ value] page [
		all [
			char? value
			longest < length: length? to binary! value
			longest: length
		]
	]
	; Create binary represantiton
	output: copy #{}
	foreach [_ value] page [
		either char? value [
			value: to binary! value
			if longest > length: length? value [
				insert/dup value #{00} longest - length
			]
		][
			value: append/dup copy #{} #{00} longest ; TODO: move to beginning as constant
		]
		append output value
	]
	reduce [longest output]
]

pick-cp-char: func [codepage [binary!] char [char!] /local index][
	index: 0
	until [
		if equal? copy/part codepage 2 to binary! char [return index]
		index: index + 1
		tail? codepage: skip codepage 2
	]
]

pick-utf-char: func [codepage [binary!] index [integer!]][
	to char! copy/part skip codepage index * 2 2
]

squeeze-page: func [codepage][
	squeeze?: true
	foreach [index value] codepage [
		if char? value [ ; NOTE: Ignore NONE
			squeeze?: squeeze? and ((to integer! value) <= 128)
		]
		if index = 127 [break]
	]
	squeeze?
]

compile-pages: func [
	"Returns binary with all provided codepages and block with list of offsets"
	pages [block!] "Block of page filenames to compile"
	/local output mapping type codepage binpage
][
	output: copy #{}
	mapping: copy []
	foreach page pages [
		type: 'full
		codepage: load page
		set [size binpage] page-to-bin codepage
		print [page length? codepage length? binpage size]
		if squeeze-page codepage [
			take/part binpage size * 128
			type: 'upper
		]
		page: first split page dot
		replace/all page space #"-"
		page: to word! form page
		repend mapping [page length? output type size]
		append output binpage
	]
	new-line/skip mapping true 4
	reduce [mapping output]
]

compile-files: func ["Compile all %.codepage files in current directory"][
	files: read %./
	remove-each file files [not equal? suffix? file %.codepage]
	compile-pages files
]

