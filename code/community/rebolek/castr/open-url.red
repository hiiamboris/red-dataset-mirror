Red [
	Title: "Basic HTTP(S) client"
	To-Do: [
Decompression: 	"get length: copy to crlf, convert from hex"
				"decomporess copy/part above-length"
	]
	Bugs: [
		https://www.aktualne.cz "SSL handshake error"
	]
	Dialect-Format: [
		METHOD [word!] optional	{
			HTTP method used for transfer. When no method is specified,
			GET is used.
		}
		URL [url!] required {URL to get}
		[HEADER-NAME [set-word!] HEADER-VALUE [any-type!]] optional {
			HTTP headers. Some headers are set automatically.
		}
		CONTENT-TYPE [path!] optional {
			Content type of the following data. Usually it’s determined
			automatically, but can be overridden.
		}
		CONTENT [string! block! map!] optional {
			Content to be send with the request.
		}
	]
]

; -- include required files

#include %common-tools.red
#include %codepage.red

http: context [

	load-module: func [path] [
		context bind load path self
	]

	cookie-parser: load-module %modules/cookies.red
	header-parser: load-module %modules/header.red

	; -- set some helpers

	protos: [
		sslv3	0300h
		tls1.0	0301h
		tls1.1	0302h
		tls1.2	0303h
		tls1.3	0304h
	]

	debug: :print
	;debug: :comment

	; -- default values

	response!: context [
		status:
		status-string:
			none
		header: #[]
		cookies: #[]
		data: none
	]

	header!: #[
		Accept-Charset: utf-8
		Accept-Encoding: gzip
		Accept: "*/*"
		User-Agent: "Red/open-url/0.0.1"
		Connection: close
	]

	request!: context [
		method:
		url:
		port:
		decoded-url:
		header:
		data: none
	]

	; -- internal variables

	redirs: 0
	max-redirs: 10
	response:
	data:
	key: value:
		none

	; -- support functions

	chunk-length: none
	get-length: func [data /local length] [
		if empty? data [return 0]
		length: take/part data find data crlf
		take/part data 2 ; get rid of crlf
		length: to string! length
		if odd? length? length [insert length #"0"]
		chunk-length: to integer! debase/base length 16
	]

	decode-chunked: func [data /length] [
		length: any [chunk-length get-length data]
		; Chunk is longer than available data
		if length > length? data [return data]
		chunk-length: none
		until [
			data: skip data length
			; now there should be crlf, get rid of it
			take/part data 2
			; get new length and repeat
			length: get-length data
			; Chunk is longer than available data
			if length > length? data [return data]
			chunk-length: none
			tail? data
		]
		tail data
	]

	make-request: func [
		request
		/local url path headers
	] [
		url: request/decoded-url
		path: case [
			all [url/path url/target]	[rejoin [url/path url/target]]
			url/path					[url/path]
			'else						[%/]
		]
		headers: collect [
			foreach [key value] request/header [
				keep rejoin [
					key ": " value crlf
				]
			]
		]
		rejoin [
			request/method space path space "HTTP/1.1" crlf
			headers crlf
			any [request/data ""]
		]
	]

	init-request: func [] [
		make request! [
			header: copy header!
		]
	]

	request-parser: context [

		key: value:
		request: none

		controls: [
			Cache-Control
		|	Expect
		|	Host
		|	Max-Forwards
		|	Pragma
		|	Range
		|	TE
		]

		conditionals: [
			If-Match
		|	If-None-Match
		|	If-Modified-Since
		|	If-Unmodified-Since
		|	If-Range
		]

		content-negotiation: [
			Accept
		|	Accept-Charset
		|	Accept-Encoding
		|	Accept-Language
		]

		authentication: [
			Authorization
		|	Proxy-Authorization
		]

		request-context: [
			From
		|	Referer
		|	User-Agent
		]

		other-header: [
			set key set-word!
			set value skip
			(put request/header key value)
		]

		content: [
			; TODO: Refuse content when method is GET (etc)
			set value [string! | block! | map!]
			(
				#TODO "Should probably really urlencode the data"
				request/header/Content-Type: 'application/x-www-form-urlencoded
				if block? value [
					value: collect/into [
						foreach [key value] value [
							keep rejoin [form key #"=" form value #"&"]
						]
					] clear ""
					take/last probe value ; remove last "&"
				]
				if map? value [
					value: to-json value
					request/header/Content-Type: 'application/json
				]
				request/data: probe value
			)
		]

		parse-request: func [
			"Parse request dialect and return request object"
			data [block!]
			/local url ctype
		] [
			request: init-request
			parse data [
				(request/method: 'GET)
				opt [
					set value ['GET | 'HEAD | 'POST | 'PUT | 'DELETE | 'CONNECT | 'OPTIONS | 'TRACE]
					(request/method: value)
				]
				set value url!
				(request/decoded-url: url: decode-url value)
				(request/header/Host: url/host)
				; header rule
				any [
					other-header
				]
				opt [
					set value path!
					(ctype: value)
				]
				content
				(if ctype [request/header/Content-Type: ctype])
			]
			if request/data [request/header/Content-Length: length? request/data]
			process-url url
			request/url: probe encode-url url
			probe request
		]
	]
	parse-request: :request-parser/parse-request

	process-url: func [
		"Change protocol and add port when needed"
		url [object!]
	] [
		unless find [tcp tls] url/scheme [
			url/scheme: select [http tcp https tls] url/scheme
		]
		url/port: any [
			url/port
			select [tcp 80 tls 443] url/scheme
		]
	]

	init-response: func [] [
		make response! [
			header: make map! 20
			cookies: make map! 10
		]
	]

	handle-redirection: func [
		response
		/local url value
	] [
		switch/default response/status [
			301 302 307 [
				print "** redirection **"
				redirs: redirs + 1
				value: probe copy response/header/Location
				if equal? #"/" value/1 [
					; redirection on same domain
					insert value request/decoded-url/ref
				]
				url: decode-url to url! value
				process-url url
				read-url/redirect encode-url url
			]
		] [response/data]
	]

	parse-response-line: func [
		target [object!]
		data [binary!]
		/local mark digit
	] [
		unless data [do make error! "No data were returned from the server"]
		digit: charset "1234567890"
		parse data [
			"HTTP/1." [#"0" | #"1"] space
			copy value 3 digit space	(target/status: to integer! to string! value)
			copy value to crlf			(target/status-string: to string! value)
			crlf
			mark:
		]
		mark
	]

	parse-response: func [
		target [object!]
		data [binary!]
		/local mark digit
	] [
		unless data [do make error! "No data were returned from the server"]
		digit: charset "1234567890"
		parse data [
			"HTTP/1." [#"0" | #"1"] space
			copy value 3 digit space	(target/status: to integer! to string! value)
			copy value to crlf			(target/status-string: to string! value)
			crlf
			mark:
		]
		target/data: header-parser/parse-header 'target mark target/header target/cookies
	]

	decode-data: func [
		"decode data based on MIME type"
		response
		/local type codec codepage
	] [
		unless response/data [return response]
		type: 'text/plain
		codepage: 'UTF-8
		if block? response/header/Content-Type [
			codepage: to word! any [
				select response/header/Content-Type 'charset
				'UTF-8
			]
			type: first response/header/Content-Type
		]
		codec: get-codec type
		
		response/data: either type/1 = 'text [
			codec/decode/codepage response/data probe codepage
		] [
			codec/decode response/data
		]

		response
	]

	client: none

	chunked?: func [
		"Return TRUE whe CHUNKED header is set"
		headers
	] [
		all [
			block? headers/Transfer-Encoding
			'chunked = headers/Transfer-Encoding/1
		]
	]

	awake-func: func [
		event
		/local port data mark extra parser header
		] [
		debug ["=== Client event:" event/type]
		port: event/port
		extra: port/extra
		data: extra/data
		parser: extra/parser
		header: extra/response/header
		switch probe event/type [
			connect [
				extra/data: make binary! 10000
				parser/header: extra/response/header
				parser/cookies: extra/response/cookies
				parser/cache-directive*: parser/cache-response-directive*
				print ["** REQUEST **"]
				insert port probe make-request extra/request
			]
			read [
				print ["** READ **" port/extra/count]

				append data port/data
				extra/mark: any [extra/mark data]
				if extra/state = 'response-line [
				; on first read event, parse response line
					mark: parse-response-line extra/response data
					remove/part data mark
					extra/state: 'headers
				]
				if extra/state = 'headers [
				; parse available headers
					until [
						parser/mark: data
						ret: parse data parser/header-rule
						remove/part data parser/mark
						equal? parser/mark data
					]
					if equal? #{0D0A} copy/part data 2 [
						take/part data 2
						extra/state: 'content
					]
				]
				if extra/state = 'content [
					if chunked? header [
						extra/mark: decode-chunked extra/mark
					]
				]
				port/extra/count: port/extra/count + 1

				copy port
			]
			wrote [
				copy port
			]
			close [
				print "*** CLOSE ***"
				; TODO: Once we have a streaming decompressor, move this to READ event
				if header/Content-Encoding [
					data: decompress data header/Content-Encoding
				]
				extra/response/data: data
				extra/response: decode-data extra/response
				; NOTE: Ask qtxie about this
				port/data: extra/response/data
			]
		]
		false
	]


	; -- main function

	extra: none

	set 'open-url func [
		"Create connection and return it"
		url [url! block! object!]
		/local client request
	] [
		; initialization

		case/all [
			url? url	[url: compose [GET (url)]]
			block? url	[request: parse-request url]
			object? url	[request: parse-request compose [GET (url/ref)]]
		]
print [":::open-url:::" request/url]
;	port-data/extra:
		client: system/words/open request/url
		client/extra: compose [
			accept-invalid-cert: #(true)
			min-protocol: (protos/tls1.1)
			max-protocol: (protos/tls1.3)
			domain: (request/decoded-url/host)
			request: (request)
			response: (init-response)
			header: #(none)
			data: #(none)
			mark: #(none)
			count: 0 ; NOTE: This can be replaced by a switch but let’s leave it for now
			state: response-line
			parser: (make header-parser [])
		]
		client/awake: :awake-func
		client
	]
	set 'read-url func [
		"Open given URL and return result"
		url [url!]
		/redirect "Do not reset redirection counter"
		/local client
	] [
		; check redirections
		unless redirect [redirs: 0]
		if equal? redirs max-redirs [
			do make error! "Redirection limit reached"
		]
		client: open-url url
		wait client
		close client
set 'c client
		client/data: handle-redirection client/extra/response
		client/data
	]

; -- scheme funcs

	port-data: none

]

http-scheme: context [
	open: func [port] [
		print "open called"
		port-data: port
		open-url probe port/spec
	]

	insert: func [port data ] [
		print "insert called"
	]

	close: func [port] [
		print "close called"
	]
]

register-scheme make system/standard/scheme [
	name: 'HTTP
	title: "HTTP scheme"
	actor: http-scheme
]

; -------------------------------------------------------------------------

;url: tls://172.217.23.238:443				; google.com (redirect)
;url: tls://138.201.158.76:443/lorem.lest	; rblk.eu
;url: tls://77.75.75.176:443					; seznam.cz
url: https://github.com
;url: tls://185.17.117.32:443				; idnes.cz
;url: tls://178.238.38.82:443				; irozhlas.cz
;url: tls://2.23.9.219						; amazon.com


test1: [
	url1: http://www.google.com
	url2: http://www.seznam.cz
	p1: open-url url1
	p2: open-url url2
	wait [p1 p2]
]

test2: [
	url: https://www.amazon.com
	p: open-url url
	wait p
]

test3: [
	p: open-url [
		POST http://reqbin.com/echo/post/json
		{"Id": 12345}
	]
	wait p
]

test4: [
	p: open-url [
		POST https://ptsv2.com/t/rebolek/post
		{hello world}
	]
]

test5: [
	p: open-url [
		POST https://httpbin.org/post
;		Content-Type: application/x-www-form-urlencoded
;		{custname="Foo Bar"^M^/}
;		{custname=klkl&custtel=&custemail=&delivery=&comments=}
;		#(custname: "Foo Bar" custtel: "123456")
		[custname "Foo Bar" custtel: 123456]
	]
	wait p
	close p
	probe p/extra/response
]

;p: open http://www.google.com
