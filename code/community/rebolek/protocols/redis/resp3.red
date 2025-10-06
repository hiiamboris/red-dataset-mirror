Red[]

; -- RESP3 parser

p: context [

	; -- values

	output:
	attributes:
	length:
	value:
	format:
	type:
		none

	; -- support

	digit: charset "0123456789"
	get-length: [
		copy length [some digit]
		(length: load length)
		crlf
	]
	string-char: charset [not "^M^/"]

	; -- simple data types

	!blob-string: [
		#"$" not #"0"
		get-length
		copy value [length skip]
		crlf
		(type: 'blob-string)
	]

	!simple-string: [
		#"+"
		copy value some string-char
		crlf
		(type: 'simple-string)
	]

	!simple-error: [
		#"-"
		copy value some string-char
		crlf
		(type: 'simple-error)
	]

	!number: [
		#":"
		copy value [
			opt #"-"
			some digit
		]
		(value: load value)
		crlf
		(type: 'number)
	]

	!null: [#"_" crlf (type: 'null)]

	!double: [
		#","
		[
			copy value [
				opt #"-"
				some digit
				opt [#"." some digit]
			]
			(value: load value)
		|	"inf" (value: 1.#INF)
		|	"-inf" (value: -1.#INF)
		]
		crlf
		(type: 'double)
	]

	!boolean: [
		#"#" [
			#"t" (value: true)
		|	#"f" (value: false)
		]
		crlf
		(type: 'boolean)
	]

	!blob-error: [
		#"!"
		get-length
		copy value length skip
		crlf
		(type: 'blob-error)
	]

	!verbatim-string: [
		#"="
		get-length
		copy format 3 skip
		(length: length - 4)
		#":"
		copy value length skip
		crlf
		(type: 'verbatim-string)
	]

	!big-number: [
		#"("
		copy value [
			opt #"-"
			some digit
		]
		crlf
		(type: 'big-number)
	]

	!simple-type: [
		!blob-string
	|	!simple-string
	|	!simple-error
	|	!number
	|	!null
	|	!double
	|	!boolean
	|	!blob-error
	|	!verbatim-string
	|	!big-number
	]

	; -- aggregate data types

	array-stack: copy []
	array-data: copy []

	!array: [
		#"*"
		(array-data: copy [])
		get-length
		length [
			ahead #"*"
			(append/only array-stack array-data)
			!array
			(append/only array-data value)
		|	ahead #"%" !map (append/only array-data value)
		|	ahead #"~" !set (append/only array-data value)
		|	!simple-type (append array-data value)
		]
		(value: array-data)
		(array-data: take/last array-stack)
	]

	map-stack: copy []
	map-data: copy []

	!map: [
		#"%"
		(map-data: copy [])
		get-length (length: length * 2) ; NOTE: LENGTH is number of key/val pairs
		length [
			ahead #"%"
			(append/only map-stack map-data)
			!map
			(append/only map-data value)
		|	ahead #"*" !array (append/only map-data value)
		|	ahead #"~" !set (append/only map-data value)
		|	!simple-type (append map-data value)
		]
		(value: make map! map-data)
		(map-data: take/last map-stack)
	]

	set-stack: copy []
	set-data: copy []

	!set: [
		; TODO: result must behave like SET: unordered collection of unique elements
		#"~"
		(set-data: copy [])
		get-length
		length [
			ahead #"~"
			(append/only set-stack set-data)
			!set
			(append/only set-stack value)
		|	ahead #"*" !array (append/only set-data value)
		|	ahead #"%" !map (append/only set-data value)
		|	!simple-type (append set-data value)
		]
		(value: set-data)
		(set-data: take/last set-stack)
	]

	attribute-stack: copy []
	attribute-data: copy []

	!attribute: [
		#"|"
		(attribute-data)
		get-length
		length [
			ahead #"*" !array (append/only attribute-data value)
		|	ahead #"%" !map (append/only attribute-data value)
		|	ahead #"~" !set (append/only attribute-data value)
		]
		(append attributes attribute-data)
		(attribute-data: take/last attribute-data)
	]

	streamed-string: copy ""

	!streamed-string: [
		#"$" #"0"
		crlf
		(streamed-string: copy "")
		some [
		#";" [
				#"0" crlf break
			|	get-length
				copy value length skip
				(append streamed-string value)
			]
		]
		(value: streamed-string)
	]

	!aggregate-type: [
		!array
	|	!map
	|	!set
	|	!attribute
	|	!streamed-string
	]

	set 'parse-resp3 func [data][
		output: copy []
		attributes: copy []
		array-stack: copy []
		map-stack: copy []
		set-stack: copy []
		attribute: copy []
		parse data [
			some [
				!aggregate-type (append output value)
			|	!simple-type (append output value)
			]
		]
		reduce ['data output 'attributes attributes]
	]
]


; -- emitter

context [

	To-Do: [
		"Way to pass SET"
	]

	output:
	value:
		none

	!integer: [
		set value integer!
		(repend output [#":" form value crlf])
	]

	!string: [
		set value string!
		(repend output [#"$" form length? value crlf value crlf])
	]

	!logic: [
		set value logic! ; NOTE: support words (TRUE, FALSE,...) also?
		(repend output [#"#" first form value crlf])
	]

	!array: [
		ahead set block block!
		(repend output [#"*" form length? block crlf])
		into [some type] ; NOTE: Can ARRAY be empty?
	]

	!map: [
		ahead change only set map map! (body-of map)
		(repend output [#"%" form length? keys-of map crlf])
		into [some type]
	]

	!any-type: [
		set value any-type!
		(repend output [#"+" form value crlf])
		; NOTE: lossy conversion that turns `a:` into `"a"`
	]

	!any-type: [
		set value any-type!
;		(repend output [#"+" form value crlf])
		(value: form value)
		(repend output [#"$" length? value crlf value crlf])
		; NOTE: lossy conversion that turns `a:` into `"a"`
	]

	all-types: [
		!integer
	|	!string
	|	!logic
	|	!array
	|	!map
	|	!any-type
	]

	safe-types: [
		!array
	|	!any-type
	]

	set 'emit-resp3 func [data][
		output: copy {}
		type: all-types
		parse data: copy data [some type]
		output
	]

	set 'make-request func [data][
		output: copy {}
		type: safe-types
		parse data: copy data [some type]
		output
	]
]
