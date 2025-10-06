Red[
	Title: "Common tools"
	File: %common-tools.red
	Author: "Boleslav Březovský"
	Description: "Collection of tools usable on both server and client-side"
	Date: 24-7-2020
	ToDo: [
		make-url:
			{When the word in dialect is object, treat it as dialect block
			(producing "foo=bar&baz=boo" string)}
		mime-decoder:
			"Use built-in one (probably needs adding custom codecs)" 
	]
]

#include %codepage.red

; -- support functions ------------------------------------------------------

make-word: func [
	"Make word! from binary!"
	value [binary! string!]
	/set "make SET-WORD!"
] [
	any [
		attempt [to either set [set-word!][word!] to string! value]
		to string! value
	]
]

enquote: func [
	"Decorate string with double quotes"
	value [any-type!] "Value to enquote"
	/single "Use single quote instead"
	/with   "Use custom decorator"
		quote
] [
	quote: any [all [with quote] all [single #"'"] #"^""]
	rejoin [quote value quote]
]

fix-quotes: func [
	"Change all quotes to single quotes"
	value [string!]
	/double "Change all quotes to double quotes"
] [
	replace/all value either double [#"'"] [#"^""] either double [#"^""] [#"'"]
]

make-nonce: function [] [
	nonce: enbase/base checksum form random/secure 2147483647 'SHA512 64
	remove-each char nonce [find "+/=" char]
	copy/part nonce 32
]

get-val: func [
	"Get value from object or map. Try also string! keys for a map"
	ctx	[object! map!]
	key	[word! string!]
	/local value word
] [
	word: attempt [to word! key]
	if all [object? ctx not word] [return none]
	if all [object? ctx string? key word] [key: word]
	if any [
		value: select ctx key
		object? ctx
	] [return value]
	key: either string? key [word] [to string! key]
	select ctx key
]

fill-in: func [
	"Fill in template with provided values"
	template	[any-string!]
	values		[map! object!]
	/with delim [string!] "Delimiter pair"
	/local name ds de
] [
	delim: any [delim {{}}]
	set [ds de] reduce [delim/1 delim/2]
	parse template: copy template [
		some [
			change [
				copy delim [ds copy name to de skip]
			] (
				any [
					get-val values name
					delim
				]
			)
		|	skip
		]
	]
	template
]

from: func [
	"Set words from object with simple dialect"
	ctx  [object!]
	data [block!]
	/local name value
] [
	foreach [name value] data [
		set name get first bind reduce [value] ctx
	]
]

print-bin: function [
	"Print binary data"
	value [binary!]
] [
	i: 0
	foreach char value [
		prin either all [char > 31 char < 128] [to char! char][#"."]
		if 32 = i: i + 1 [print "" i: 0]
	]
]

; == codecs == ---------------------------------------------------------------

; -- MIME handling -----------------------------------------------------------

make-codec: func [
	"Make codec object based of simple dialect"
	data [block!]
	/local
		codec name type types suffix suffixes
		encode decode decode-type source spec body
][
	#TODO "Support ENCODE DECODE in dialect"
	types: copy []
	suffixes: copy []
	encode: func [data [any-type!] where [file! url! none!]][data]
	decode: reduce [
		'text   func [data [any-type!]] [data]
		'data   func [data [any-type!]] [load data]
		'binary func [data [any-type!]] [data]
	]
	decode-type: 'text
	source: none
	parse data [
		set name set-word!
		some [
			set type path! (append/only types type)
		|	set suffix file! (append suffixes suffix)
		|	'encode set spec block! set body block!
			(encode: func spec body)
		|	'decode set spec block! set body block!
			(decode: func spec body)
		|	'binary (decode-type: 'binary)
		|	'from set source word!
		]
	]

	either source [
		source: select system/codecs source
		encode: :source/encode
		decode: :source/decode
	] [
		source: context []
	]
	codec: make source compose/deep [
		title: (copy "")
		name: (to lit-word! name)
		mime-type: [(types)]
		suffixes: [(suffixes)]
		; NOTE: ENCODE and DECODE are placeholders that just pass data
		encode: none
		decode: none
	]
	codec/encode: :encode
	codec/decode: either function? :decode [:decode] [select decode decode-type]
	codec
]

#example [
	make-codec [HTML: text/html %.html decode [data] [to string! data]]
]

add-codec: func [
	"Add new codec to system/codecs"
	codec [object! block!] "Codec object or dialect for MAKE-CODEC function"
	/local name
][
	if block? codec [codec: make-codec codec]
	name: to word! lowercase form codec/name
	unless find system/codecs name [
		put system/codecs name codec
	]
]

get-mime-type: func [
	"Return MIME type block based of file's suffix"
	filename  [file! url!]
	/local name codec
][
	foreach [name codec] system/codecs [
		if find codec/suffixes suffix? filename [return codec/mime-type]
	]
	either error? try [read filename] [
		[application/octet-stream]
	] [
		[text/plain]
	]
]

get-codec: func [
	"Select codec based on MIME type"
	type [path! block!]
	/local name codec
] [
	type: compose [(type)]
	remove-each name type [not path? name]
	foreach [name codec] system/codecs [
		unless empty? intersect codec/mime-type type [return codec]
	]
	none
]

mime-decoder: func [
	data
	type
	/local codec
][
	either codec: get-codec type [
		codec/decode data
	] [
		data
	]
]

text-type?: func [
	"Return TRUE if MIME type can be handled as text"
	mime-type [path! none!]
] [
	#NOTE "The list of text formats is certainly partial only"
	case [
		not mime-type [true]
		'text = mime-type/1 [true]
		find/only [application/json application/xml] mime-type [true]
		'else [false]
	]
]

; -- BASE64 URL encoding ----------------------------------------------------

add-codec [
	BASE64URL: application/base64url %.base64url
	decode [data /local padding] [
		unless zero? padding: 4 - (length? data) // 4 [
			append/dup data #"=" padding
		]
		data: to string! debase data
		if json [data: load-json data]
		data
	]
	encode [data where /local mark] [
		data: enbase/base data 64
		if mark: find data #"=" [data: head clear mark]
		replace/all data #"/" #"_"
		replace/all data #"+" #"-"
		data
	]
]

; -- WWW FORM encoding ------------------------------------------------------

context [
	cut-tail: function [
		"Remove value(s) from end of series"
		series
		/part
			length
	] [
		unless part [length: 1]
		head remove/part skip tail series negate length length
	]

	set 'to-www-form function [
		data
		/only "Ignore NONE values"
	] [
		if any [map? data object? data] [data: body-of data]
		pattern: [key #"=" value #"&"]
		output: collect/into [
			foreach [key value] data [
				if any [not only all [only value]] [
					value: to-pct-encoded form value
					keep rejoin bind pattern 'key
				] 
			]
		] make string! 1000
		cut-tail/part output either only [length? form last pattern] [1]
	]

	set 'load-www-form func [
		string	[any-string! none!]
		/local result key value
	][
		unless string [return none]
		result: make map! []
		if equal? #"?" first string [string: next string]
		parse string [
			some [
				opt #"&"
				copy key to #"=" skip
				copy value to [#"&" | end]
				(key: load-pct-encoded key)
				(attempt [key: to word! key])
				(put result key load-pct-encoded value)
			]
		]
		result
	]
]

; --- percent encoding -------------------------------------------------------

context [
	; RFC 3986 characters
	reserved-chars: union charset "!*'();:@&=+$,/?#[]" charset "%" ; RFCs are stupid
	unreserved-chars: charset [#"A" - #"Z" #"a" - #"z" #"0" - #"9" "-_.~"]
	set 'to-pct-encoded function [
		string [any-string!]
	] [
		value: none
		chars: unreserved-chars
		encode: func [value][head insert enbase/base form value 16 #"%"]
		result: copy {}
		parse string [
			collect into result [
				some [
					set value reserved-chars keep (encode value)
				|	space keep ("%20")
				|	keep skip
				]
			]
		]
		result
	]

	set 'load-pct-encoded function [
		string [any-string!]
	] [
		to string! collect/into [
			parse string [
				some [
					#"+" (keep space) ; should be here? or add some switch?
				|	copy value [#"%" 2 skip] (keep dehex value)
				|	set value skip (keep value)
				]
			]
		] make binary! 100
	]
	set 'url-encode :to-pct-encoded
	set 'url-decode :load-pct-encoded

	; Temporary function
	ansi-decode: function [
		string [string!]
	] [
		rejoin parse string [
			collect [
				some [
					#"+" keep space ; should be here?
				|	"%26%23" ; &#nnnn; encoding TODO: hexadecimal form
					copy value to "%3B" 3 skip keep (
						to char! to integer! value
					)
				|	#"%" 
					copy value 2 skip keep (
						to char! to integer! append value #"h"
					) 
				| 	keep skip
				]
			]
		]
	]
]
; == URL handling -----------------------------------------------------------

; -- MAKE-URL dialect -------------------------------------------------------

context [
	getters: make typeset! [word! path!]

	url-rule: [
		set value [set-word! | word! | string!] (
			append args rejoin [form value #"="]
		)
		set value any-type! (
			if find getters type? value [
				value: get value
			]
			append args rejoin [to-pct-encoded form value #"&"]
		)
	]

	args: make block! 20

	set 'make-url function [
		"Make URL from simple dialect"
		data
	][
		; this is basically like to-url, with some exceptions:
		; WORD! - gets value
		; BLOCK! - treated as key/value storage of after "?" parameters
		value: none
		clear args
		link: make url! 80
		args-rule: [ahead block! into [any url-rule]]
		parse append clear [] data [
			some [
				args-rule
			|	set value [set-word! | any-string! | refinement!]
				(append link dirize form value)
			; NOTE: Next rule exist just because Red forms lit-path! with '
			|	set value lit-path!
				(append link dirize next form value)
			|	set value [word! | path!]
				(append link dirize form get :value)
			]
		]
		unless empty? args [
			change back tail link #"?"
			append link args
		]
		head remove back tail link	
	]
]

parse-url: func [
	"Split URL into [server file-path data] parts"
	url [url! file!]
	/local server file data
	; TODO: return object with all fields
	;	[scheme userinfo host port part query fragment]
] [
	unless url? url [url: rejoin [http:// url]]
	url: decode-url url
	url/query: load-www-form url/query
	url
]


; -- MULTIPART handling -----------------------------------------------------

split-multipart: func [
	series [binary!]
	delimiter [string!]
	/local result value
][
	result: copy []
	delimiter: to binary! delimiter
	parse series [
		"--"
		delimiter
		some [
			#{0D0A}
			copy value to "--"
			"--"
			delimiter
			(append result value)
		]
		"--"
	]
	result
]

; TODO: merge PARSE-CONTENT-TYPE and PARSE-PART as they basicaly share same
;		rules. PARSE-CONTENT-TYPE looks more standard compliant

parse-part: func [
	"Parse part of multipart data"
	part [binary!]
	/local qt value
		fields field-rule field-name field-value 
		attrs attr-name attr-value
][
	qt: #"^""
	fields: copy []
	field-rule: [
		(attrs: copy #[])
		not crlf ; make sure we're not in VALUE already
		copy field-name to #":"
		#":" space
;		[copy field-value to #";" | copy field-value to crlf]
		copy field-value to [#";" | crlf]
		any [
			#";" space
			copy attr-name to #"=" #"="
			qt copy attr-value to qt qt
			(put attrs to string! attr-name to string! attr-value)
		]
		crlf
		(repend fields [to string! field-name to string! field-value attrs])
	]
	parse part [
		some field-rule
		crlf
		; NOTE: Instead of copying to CRLF, I copy to end and remove it
		;		as CRLF may be part of value, I guess
		copy value to end ; crlf crlf
		(take/last/part value 2)
		(append fields value)
	]
	fields
]

parse-content-type: func [
	data [string! binary!]
	/local type subtype parameters tspecials token not-token key value
][
	tspecials: charset {()<>@,;:\"/[]?=}
	; NOTE: `not-token` should also include control chars but I don't expect
	;		them to be used
	not-token: union tspecials charset space 
	token: [
		#"^"" copy value to #"^""
	|	copy value some [not not-token skip]
	]

	parameters: copy #[]
	parse data [
		copy type to #"/" skip
		copy subtype to [#";" | end]
		any [
			any space ; TODO: is it necessary?
			#";"
			any space
			token (key: value)
			#"="
			token (parameters/:key: value)
		]
	]
	reduce [to path! reduce [to word! type to word! subtype] parameters]
]

; -- date&time functions ----------------------------------------------------

parse-rfc5322-date: function [
	"Parse date in Internet Message Format (RFC5322)"
	data [string!]
	/local value
][
	digit: charset "0123456789"
	months: [
		"Jan" | "Feb" | "Mar" | "Apr" | "May" | "Jun"
	|	"Jul" | "Aug" | "Sep" | "Oct" | "Nov" | "Dec"
	]
	fws: [some space] ; FIXME: Proper folding white space
	date-time:		[opt [day-of-week #","] date time]
	day-of-week:	[opt fws day-name]
	day-name:		["Mon" | "Tue" | "Wed" | "Thu" | "Fri" | "Sat" | "Sun"]
	date:			[day month year]
	day:			[opt fws copy value 2 digit fws (result/day: load value)]
	month:			[
		copy value months
		(result/month: (index? find months value) + 1 / 2)
	]
	year:			[fws copy value 4 digit fws (result/year: load value)]
	time:			[time-of-day opt zone]
	time-of-day:	[hour #":" minute opt [#":" second]]
	hour:			[copy value 1 2 digit (result/hour: load value)]
	minute:			[copy value 2 digit (result/minute: load value)]
	second:			[copy value 2 digit (result/second: load value)]
	zone:			[
		fws opt [#"+" | #"-"] copy value 4 digit
		(result/zone: load insert skip tail value -2 #":")
	|	fws copy value [
			"UT" | "GMT" | "EST" | "EDT" | "CST" | "MST" | "MDT" | "PST" | "PDT"
		]
		(result/zone: select zones value)
	|	to end (result/zone: 0)
	]
	zones: [
		"UT" 0:00 "GMT" 0:00 "EST" -5:00 "EDT" -4:00 "CST" -6:00 "CDT" -5:00
		"MST" -7:00 "MDT" -6:00 "PST" -8:00 "PDT" -7:00
	]
	result: 1-1-1970/0:0:0
	parse data date-time
	result
]

to-rfc5322-date: func [
	"Convert date to RFC 5322 (Internet format) format"
	date [date!]
	/gmt "Return date in GMT zone"
	/local loc zone
][
	; FIXME: This assumes English locale which is a safe bet currently
	;		 but may change in the future
	loc: system/locale
	if gmt [date: to-UTC-date date]
	zone: either not zero? zone: date/zone [
		rejoin [
			pick "-+" negative? sign? zone/hour
			pad/left/with form zone/hour 2 #"0"
			pad/left/with form zone/minute 2 #"0"
		]
	] ["GMT"]
	rejoin [
		copy/part pick loc/days date/weekday 3
		comma space
		pad/left/with form date/day 2 #"0"
		space
		copy/part pick loc/months date/month 3
		space
		date/year
		space
		date/time
		space
		zone
	]
]

to-iso-date: func [
	"Convert date to ISO 8601 format"
	value [date!]
	/local sign char
][
	sign: charset "+-"
	value: form value
	parse value [
		thru #"-" thru #"-" 4 skip ; skip date part
		change #"/" #"T"
		8 skip ; skip time part
		opt change end #"Z"
	]
	value
]

diff-time: func [
	"Return difference between dates in hours"
	time1 [date!]
	time2 [date!]
	/local date-diff
; NOTE: Ignores DST and timezones
] [
	date-diff: time1/date - time2/date * 24:0:0
	unless time1/time [time1/time: 0:0:0]
	unless time2/time [time2/time: 0:0:0]
	time-diff: time1/time - time2/time
	date-diff + time-diff
	
]

load-non-utf: func [
	data [binary!]
] [
	collect/into [forall data [keep to char! data/1]] copy {}
]

; -- URL handling ------------------------------------------------------------

split-url: func [
	"Split URL into protocol, domains and path"
	url [url!] "Url to split"
	/local out value
] [
	out: copy []
	parse url [
		copy value [thru #":" opt "//"] (append out value)
		some [
			#"/" break
		|	copy value to [dot | #"/" | end]
			(append out to word! form value)
			opt dot
		]
		opt #"/"
		[
			end
		|	copy value to end
			(append out to file! value)
		]
	]
	out
]

domain?: func [
	"Return domain (SLD.TLD) from URL!"
	url [url!]
	/local domain
] [
	parse url [
		"http" opt #"s" "://"
		copy domain to [#"/" | end]
	]
	unless domain [return none]
	domain: split domain dot
	domain: take/last/part domain 2
	rejoin [domain/1 dot domain/2]
]

; -- setup -------------------------------------------------------------------

; TODO: Move to a separate file
add-codec [
	TEXT: text/plain %.txt
	decode [data /codepage cp] [
		either any [not cp cp = 'UTF-8] [
			to string! data
		] [
			read-cp data cp
		]
	]
]
add-codec [HTML:              text/html              %.html from TEXT]
add-codec [CSS:               text/css               %.css]
add-codec [JAVASCRIPT:        application/javascript %.js]
add-codec [WEBP:       binary image/webp             %.webp]
add-codec [ICO:        binary image/x-icon           %.ico]
add-codec [ZIP:        binary application/zip        %.zip]
add-codec [RED:        data   application/x.red      %.red]
add-codec [MIDI:       binary audio/midi             %.mid]
add-codec [MP3:        binary audio/mpeg3            %.mp3]
add-codec [PDF:        binary application/pdf        %.pdf]
add-codec [
	URL-ENCODED: application/x-www-form-urlencoded
	decode [data [string!]] [url-decode data]
]
; TODO: Move to LEST
add-codec [
	LEST: application/x.lest %.lest
	decode [data [string!]] [lest/page read data]
]
