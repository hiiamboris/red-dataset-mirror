Red [
	Title: "Client tools"
	File: %client-tools.red
	Author: "Boleslav Březovský"
	Description: "Collection of tools to make using HTTP easier"
	Date: 24-7-2020
	Resources: [
		base64url: RFC4648 https://tools.ietf.org/html/rfc4648
	]
	Problems: [{
	Rebol system/options/cgi problems:

	1) Capitalized `Content-Type`

	The only capitalized key. Should be changed to `content-type`.

	2) Everything is `string!`

	At least ports and IPs should be converted.

	3) Query decoding

	`query-string` for GET or `input` for POST provide raw data,
	but it would nice to have Red form of the data available, 
	regardless of the request method.
}
	]
	To-Do: [{
`parse-headers` should return raw map or everything converted,
`other-headers is stupid concept.
}
{SEND-REQUEST should add at least `Accept-Charset` automatically.}
{Multipart should check if boundary is not part of data}
	]
	Notes: [
		{
MAKE-COOKIES accepts either map! created by PARSE-COOKIES or a block!
of key/value pairs.

}
	]
]

#include %common-tools.red

ct: context [
	value: none
	result: none
	content-type: none
	multipart: none
	boundary: none

	request!: context [
		method:
		url:
		port:
		spec:
		headers:
		data: none
	]

	url-rule: [
		set value [set-word! | word! | string!] (
			append result rejoin [form value #"="]
		)
		set value any-type! (
			append result either value [
				rejoin [to-pct-encoded form value #"&"]
			][#"&"]
		)
	]

	map-set: function [
		"Make map with reduce/no-set emulation"
		data
	] [
		value: none
		parse data: copy data [
			some [
				change set value set-word! (reduce ['quote value])
			|	skip	
			]
		]
		make map! reduce data
	]

	stringize: func [
		"Passes STRING! and rejoins BLOCK!"
		value [any-string! binary! block!]
	][
		if block? value [value: rejoin value]
		value
	]

	when: func [
		"Return value when COND is TRUE, otherwise return empty string"
		cond [logic!]
		value [any-type!]
	][
		either cond [stringize value][""]
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

	#TODO {temporarily exposed for testing, make internal later}
	#TODO {is #multi really required?}
	set 'parse-data func [
		data	[block!]
	][
		content-type: "application/x-www-form-urlencoded"
		parse data [
			#JSON	copy value to end (
				content-type: "application/json"
				result: to-json value
			)
		|	#multi	copy value to end (result: make-multipart value)
		|	#Red	copy value to end (result: mold value) ; FIXME: needs proper content-type etc
		|	(result: copy {}) any url-rule (take/last result)
		]
		result
	]

	set 'parse-cookies func [
		"Return map! of cookies"
		cookies [block! none!]
		/local result cookie name key value target mark get-value
	][
		unless cookies [return none]
		result: make map! []
		mark: [#";" | end]
		get-value: [copy value to mark]
		foreach cookie cookies [
			parse cookie [
				copy name to #"=" skip
				copy value to [#";" | end]
				(target: result/:name: make map! compose [value: (value)])
				any [
					 "; " some [
						"Secure" (target/secure: true)
					|	"HttpOnly" (target/http-only: true)
					|	(value: "None")
						"SameSite" opt [
							#"=" copy value ["Strict" | "Lax" | "None"]
						] (
							target/same-site: either "None" = value [
								none
							] [
								to word! value
							]
						)
					|	"Expires=" get-value
						(target/expires: parse-rfc5322-date value)
					|	"Domain=" get-value
						(target/domain: value)
					|	"Path=" get-value
						(target/path: to file! value)
					|	"MaxAge=" get-value
						(target/max-age: to integer! value)
					]
				]
			]
		]
		result
	]

	set 'make-cookies func [
		"Make cookies block! from map! of cookies"
		cookies [map! block!]
		/local key value
	][
		result: copy {}
		foreach [name value] cookies [
			repend result [
				form name
				#"="
				either map? value [select value 'value] [value]
				"; "
			]
		]
		take/part/last result 2
		result
	]

	set 'to-request func [
		"Convert dialect to request object"
		dialect [block!]
		/local request key value
			header-rule data-rule user-rule auth-rule
	] [
		header-rule: [
			set key set-word!
			set value skip
			(put request/headers key value)
		]
		data-rule: [ ;FIXME
			set value skip
			(request/data: value)
		]
		user-rule: [
			'user set value skip
			(request/user: value)
			opt [
				['pass | 'password]
				set value skip
				(request/password: value)
			]
		]
		auth-rule: [
			quote Authorization:
			[
				'Basic
				(key: copy "")
				set value skip
				(repend key [value #":"])
				set value skip
				(append key value)
				(put request/headers 'Authorization reduce ['Basic enbase key])
			|	'Bearer
				set value skip
				(put request/headeers 'Authorization reduce ['Bearer value])
			]
		]
		request: copy/deep request!
		parse dialect [
			set value word!
			(request/method: value)
			set value url!
			(request/url: value)
			any [
				auth-rule
			|	header-rule
			|	user-rule
			|	data-rule
			]
		]
		request
	]

	set 'load-request func [
		"Convert request object to dialect"
		request [object!]
		/local result key value
	] [
		result: reduce [
			request/method
			request/url
		]
		foreach [key value] request/headers [
			repend result [key value]
		]
		result
	]

	set 'make-request func [
		"Frontend for SEND-REQUEST using new format"
		data	[block! object!] "Dialect block or request object"
	][
		if block? data [data: to-request data]
		send-request/data/with/verbose ; verbose is for testing
			data/url
			data/method
			data/data
			data/headers
	]

	set 'send-request function [
		"Send HTTP request. Useful for REST APIs"
		link 		[url!] 	"URL link"
		method 		[word!] "Method type (GET, POST, PUT, DELETE)"
		/only 		"Return only data without headers"
		/data 		"Data to send with request (auto-converted to proper encoding)"
			content [string! block! map! object! none!]
		/mold		"Do not auto-convert data and send tham as MOLDed Red values"
		/with 		"Headers to send with request"
			args	[block! map! none!]
		/auth 		"Authentication method and data"
			auth-type [word!] "Basic, Bearer, TODO: Digest"
			auth-data
		/cookies	"Cookies to send with the request"
			cookie-data [block! map!]
		/raw 		"Return raw data and do not try to decode them"
		/verbose    "Print request informations"
		/debug		"Set debug words (see source for details)"
		/extern		content-type
	][
		content-type: none
		if all [find [POST PUT] method not data][
			do make error! rejoin [method " method needs data. Use /data refinement."]
		]
		mold?: mold
		mold: :system/words/mold
		if verbose [
			print ["SEND-REQUEST to" link ", method:" method]
		]
		header: copy #[] ; NOTE: CLEAR causes crash later!!!
		; NOTE: ^hopefuly that's fixed, need to check it
		if args [
		; NOTE: Because there are bugs in Red and distractions have higher
		;		priority than merging IO and some Red users rely on this
		;		I have to implement a fix for a broken behavior. Believe me,
		;		I already said I won't update this, because I wrote HTTP
		;		scheme for IO branch that's way better than this, but unless
		;		TPTB decide to finally merge IO branch, which is WAAAYYYYY
		;		better than this, usual users would depend on this.
		;		And let me tell you that this function started as a hack
		;		to get a better handle over HTTP but now it's monstrosity
		;		with NINE refinements and I want to let it go. But no,
		;		distractions are more important in Red that IO and 64bit
		;		so that's the excuse for converting all keys to `set-word!`
		;		and all values to `string!`, because otherwise Red would
		;		crash with Access violation and it won't be fixed (which
		;		I understand, there's much better IO branch).

			while [not tail? args] [
				args/1: to set-word! args/1
				args/2: form args/2
				args: skip args 2
			]
			extend header args: head args
		]
		if auth [
			if verbose [print [auth-type mold auth-data]]
			switch auth-type [
				Basic [
;					extend header compose [
;						Authorization: (rejoin [auth-type space enbase rejoin [first auth-data #":" second auth-data]])
;					]
					put header 'Authorization rejoin [
						auth-type space enbase rejoin [
							first auth-data #":" second auth-data
						]
					]
				]
				OAuth [
					; TODO: OAuth 1 (see Twitter API)
				]
				Bearer [
					; token passing for OAuth 2
;					extend header compose [
;						Authorization: (rejoin [auth-type space auth-data])
;					]
					put header 'Authorization rejoin [auth-type space auth-data]
				]
				Digest [
					<TODO>
				]
			]
		]
		; -- process data
		case [
			mold? [content: system/words/mold/all content]
			all [method = 'GET not content][
				content-type: none
				content: clear ""
			]
			all [method = 'GET block? content][
				if map? content [content: body-of content]
				link: rejoin [link #"?" parse-data content]
				content: clear ""
			]
			block? content [
				content-type: "application/x-www-form-urlencoded"
				content: parse-data content
			]
			any [map? content object? content][
				; if you're passing map/object, it's safe to assume it should be send as JSON
				content-type: "application/json"
				content: to-json content
			]
			string? content [
				put header 'Content-Type 'application/x-www-form-urlencoded
				put header 'Content-Length length? content
			]
			; TODO: string! Or is there anything needed for it?
		]
		; -- process cookies
		if cookies [
			header/Cookie: make-cookies cookie-data
		]
		; -- make sure all values are strings
		if content-type [put header 'Content-Type content-type]
		body: body-of header
		forall body [body: next body body/1: form body/1]
		data: reduce [method body]
		append data content
		; -- send prepared request and process reply
		if verbose [
			print [
				"Link:" link newline
				"Header:" mold header newline
				"Data:" mold data newline
			]
		]
		if debug [set 'req reduce [link data]]
		reply: write/binary/info link data

	; -- FIXME: Workaround for https://github.com/red/red/issues/4236
		headers: reply/2
		foreach [key value] headers [
			if all [
				block? value
				not equal? key "Set-Cookie"
			][
				headers/:key: unique value
				if 1 = length? headers/:key [
					headers/:key: first headers/:key
				]
				all [
					block? headers/:key ; NOTE: 
					find [Content-Type Content-Length] key
					headers/:key: last headers/:key
				]
			]
		]
	; -- end of workaround
		if debug	[set 'raw-reply copy/deep reply]
	; -- convert text from codepage to UTF-8
		content-type: charset: none
		if headers/Content-Type [
			; TODO: check if Content-Type is text/* (is it needed?)
			parse headers/Content-Type [
				copy content-type to [#";" | end]
				thru "charset=" copy charset to end
			]
		]
		case [
			charset = "UTF-8"	[reply/3: to string! reply/3]
			charset	[try [reply/3: read-cp reply/3 to word! charset]]
			'else	[try [reply/3: to string! reply/3]]
		]
	; --
		if debug	[set 'string-reply copy/deep reply]
		if raw		[return reply]
		if verbose	[print ["Headers:" mold headers]]

		reply: map-set [
			code: reply/1
			headers: reply/2
		#FIXME "parse-cookies expects block instead of string"
		;	cookies: parse-cookies reply/2/Set-Cookie
			cookies: reply/2/Set-Cookie
			raw: reply/3
			data: either reply/2/Content-Type [
				mime-decoder reply/3 load reply/2/Content-Type
			] [
				reply/3
			]
		]
		if debug [set 'parsed-reply reply]
;		cookies: 
		either only [reply/data] [reply]
	]
]
