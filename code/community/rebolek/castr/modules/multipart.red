Red[]

content-type:
multipart:
boundary: none

when: func [
	"Return value when COND is TRUE, otherwise return empty string"
	cond [logic!]
	value [any-type!]
][
	either cond [stringize value][""]
]

stringize: func [
	"Passes STRING! and rejoins BLOCK!"
	value [any-string! binary! block!]
][
	if block? value [value: rejoin value]
	value
]

keep: func [value][append multipart stringize value]

keep-boundary: func [
	/end "Final boundary"
][
	keep ["--" boundary when end "--" crlf]
]

keep-value: func [
	name
	value
	/type typename
	/local disps key val
][
	if set-word? name [name: compose [name: (name)]]
	collect/into [
		foreach [key val] name [
			keep rejoin ["; " key {="} val #"^""]
		]
	] disps: copy ""
	keep [
		"Content-Disposition: "
;			either type ["attachement"]["form-data"]
		"form-data"
		disps crlf
		when type ["Content-Type: " typename crlf]
		crlf
	]
	keep value ; NOTE: must be separate, otherwise REJOIN will FORM it, this way we can pass binary!
	keep crlf
]

make-multipart: func [
	parts [block!]	"Multipart dialect"
	; if content is `file!`, content-type is switched to multipart/mixed
	/local bin? name value type mode filename part-key-value part-file
][
	name: value: type: mode: filename: none
	multipart: copy #{}
	bin?: false
	boundary: make-nonce
	content-type: none

	part-key-value: [
		(type: none)
		set name set-word!
		set value [any-string! | number! | map!]
		opt set type path! (
			if map? value [
				value: to-json value
				type: 'application/json
			]
			keep-boundary
			either type [
				keep-value/type name value type
			][
				keep-value name value
			]
		)
	]
	part-file: [
		(mode: none)
		set name set-word!
		set filename file!
		opt set mode ['text | 'bin | 'binary] (
			keep-boundary
			switch/default mode [
				text [
					type: "text/plain"
					value: read filename
				]
				bin binary [
					bin?: true
					type: "application/octet-stream"
					value: read/binary filename
				]
			][
				value: read/binary filename
				type: either error? try [value: to string! value][
					bin?: true
					"application/octet-stream"
				][
					"text/plain"
				]
			]
			keep-value/type compose [name: (name) filename: (filename)] value type
		)
	]

	parse parts [
		some [
			part-file
		|	part-key-value
		]
	]
	content-type: rejoin ["multipart/form-data; boundary=" boundary]
	keep-boundary/end
	either bin? [multipart][to string! multipart] ; TODO: Is the conversion required? Probably not
]
