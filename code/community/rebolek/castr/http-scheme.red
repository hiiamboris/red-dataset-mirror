Red[
	Title: "HTTP scheme"
	Author: "Boleslav Březovský"
	Notes: [
		status-codes: https://httpstat.us/
	]
]

#include %common-tools.red

http-proto: context [

	debug: :print
	;debug: :comment

	; TODO: Move to system/standard or something like that
	protos: [
		sslv3	0300h
		tls1.0	0301h
		tls1.1	0302h
		tls1.2	0303h
		tls1.3	0304h
	]

	load-module: func [path] [
		context bind load path self
	]

;	cookie-parser: load-module %modules/cookies.red
	header-parser: load-module %modules/header.red

; -- request
; NOTE: I probably may get rid of request as it’s passed in port/spec

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
		spec:
		header:
		data: none
	]

	init-request: func [specs] [
		make request! [
			method:	'GET
			header:	copy header!
			url:	specs/ref
			port:	any [
						specs/port
						all ['https = specs/scheme 443]
						80
					]
			spec:	specs
		]
	]

	make-request: func [
		request
		/local url path headers
	] [
		url: request/spec
		put request/header 'Host url/host
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
			#{}
			form request/method space path space "HTTP/1.1" crlf
			headers crlf
			any [request/data ""]
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

		auth-rule: [
			'basic set key skip set value skip
			(
				put request/header 'Authorization rejoin [
					"Basic" space enbase rejoin [key #":" value]
				]
			)
		|	'bearer set value skip
			(put request/header 'Authorization rejoin ["Bearer" space value])
		;	TODO: Digest authentiacion
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
					] clear #{}
					take/last value ; remove last "&"
				]
				if map? value [
					value: to-json value
					request/header/Content-Type: 'application/json
				]
				request/data: value
			)
		]

		parse-request: func [
			"Parse request dialect and return request object"
			req [object!]
			data [block!]
			/local url ctype
		] [
			request: req
			parse data [
				(request/method: 'GET)
				opt [
					set value ['GET | 'HEAD | 'POST | 'PUT | 'DELETE | 'CONNECT | 'OPTIONS | 'TRACE]
					(request/method: value)
				]
;				opt [set value url!]
;				(request/decoded-url: url: decode-url value)
;				(request/header/Host: url/host)
				; header rule
				any [
					other-header
				|	auth-rule
				]
				opt [
					set value path!
					(ctype: value)
				]
				content
				(if ctype [request/header/Content-Type: ctype])
			]
			if request/data [
				request/header/Content-Length: length? request/data
			]
;			process-url url
;			request/url: encode-url url
			request
		]
	]
	parse-request: :request-parser/parse-request

; -- response

	response!: context [
		status:
		status-string:
			none
		header: #[]
		cookies: #[]
		data: none
	]

	init-response: func [] [
		make response! [
			header: make map! 20
			cookies: make map! 10
		]
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
;		codec: get-codec type
		; get right codec, or return raw data, when no suitable is found
		unless codec: get-codec type [return response]
		; convert codepage when necessary
		either type/1 = 'text [
			response/data: read-cp response/data codepage
		] [
			; decode data and return whole object
			response/data: load/as response/data codec/name
		]
		response
	]

	chunked?: func [
		"Return TRUE whe CHUNKED header is set"
		headers
	] [
		all [
			block? headers/Transfer-Encoding
			'chunked = headers/Transfer-Encoding/1
		]
	]

	; chunk length must be stored separately, because to get it,
	; we remove it from the original data. But we may not have a full chunk
	; when trying to find the end of a chunk and must read another part
	; (becuase chunk length and read data length are two different things)
	; and when we get more data, the length isn't there anymore)
	; so that's why we're storing it
	chunk-length: none

	get-length: func [data /local length] [
		if empty? data [return 0]
		; get chunk length
		length: take/part data find data crlf
		; remove CRLF
		remove/part data 2
		; convert chunk length to integer
		length: to string! length
		if odd? length? length [insert length #"0"]
		chunk-length: to integer! debase/base length 16
	]

	decode-chunked: func [
		"Removes chunk metadata from data"
		data
		/local length
	] [
		while [
			not tail? data
		] [
			; get chunk length
			length: any [chunk-length get-length data]
			; chunk is longer than available data, read more
			; we need at least chunk length + 2
			if (2 + length) > length? data [return data]
			; move to the end of chunk (skip chunk length, remove crlf)
			data: skip data length
			remove/part data 2
			; reset length
			chunk-length: none
		]
		data
	]

; -- -- -- --

	init-port: func [port /local scheme request subport] [
		request: init-request port/spec
		scheme: select [https tls http tcp] port/spec/scheme
		subport: open to url! rejoin [
			scheme "://" port/spec/host #":" request/port
		]
		subport/awake: :awake-func
		subport/extra: compose [
			accept-invalid-cert: #(true)
			min-protocol: (protos/tls1.1)
			max-protocol: (protos/tls1.3)
			domain: (port/spec/host)
			spec: (port/spec)
			request: (request)
			response: (init-response)
			header: #(none)
			data: #(none)
			mark: #(none)
			parent: (port)
			count: 0 ; NOTE: This can be replaced by a switch but let’s leave it for now
			state: response-line
			parser: (make header-parser [])
		]
		port/extra: compose [
			subport: (subport)
			request: (request)
			response: #(none)
			timeout: 0:0:10
		]
	]
; -- -- -- --

	awake-func: func [
		event
		/local port data mark extra parser header request response user-handler
		] [
;		debug ["== Client event:" event/type]
		port: event/port
		extra: port/extra
		data: extra/data
		parser: extra/parser
		header: extra/response/header
		request: extra/request
		response: extra/response

		switch event/type [
			connect [
				extra/data: make binary! 10000
				parser/header: extra/response/header
				parser/cookies: extra/response/cookies
				parser/cache-directive*: parser/cache-response-directive*
				insert port make-request extra/request
			]
			read [
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
					if find/match data #{0D0A} [
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
				; TODO: Once we have a streaming decompressor, move this to READ event
				if header/Content-Encoding [
					data: decompress data header/Content-Encoding
				]
				extra/response/data: data
				extra/response: decode-data extra/response
				extra/parent/extra/response: extra/response
				extra/parent/data: extra/response/data
			]
		]
		if user-handler: select port/flags 'handler [
			switch event/type bind user-handler 'response
		]
		false
	]

	scheme: context [
		open: func [port] [
			http-proto/init-port port
		]

		copy: func [port] [
			; check for ASYNC flag
			unless find port/flags 'async [
				wait reduce [port/extra/subport port/extra/timeout]
			]
			; check for INFO flag
			either find port/flags 'info [
				port/extra/response
			] [
				port/data
			]
		]

		insert: func [port data] [
			http-proto/parse-request port/extra/request data
		]

		close: func [port] [
			port/data
		]
	]
]

; -- scheme funcs


register-scheme make system/standard/scheme [
	name: 'HTTP
	title: "HTTP scheme"
	actor: http-proto/scheme
]

register-scheme make system/standard/scheme [
	name: 'HTTPS
	title: "HTTPS scheme"
	actor: http-proto/scheme
]

;p: open http://www.example.org
;p: open http://www.google.com
;i: read https://www.fillmurray.com/640/360
example: http://93.184.216.34 ; example.com


;read https://www.baidu.com
