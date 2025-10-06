Red[
	Title: "HUB - request module"
	Author: "Boleslav Březovský"
	To-Do: [
	]
]

header-parser: context load %modules/header.red

value: none
token: header-parser/token*
method: [
	"OPTIONS"| "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "TRACE"
|	"CONNECT"| token
]

parse-request-line: func [data /local mark] [
	parse data [
		copy value method (request/method: to string! value)
		space
		copy value to space (request/uri: to file! value)
		space
		"HTTP/"
		copy value to crlf (request/http-version: to string! value)
		crlf
		mark:
	]
	mark
]

request-proto: context [
	header:
	data:
	method:
	uri:
	query:
	path:
	target:
	cookies:
	http-version:
		none
]

process: func [
	port
	/local key value data uri default method
] [
	stats/requests: stats/requests + 1
	status-page: none
	parse-request raw: port/data
	; NOTE: This sets some default cookies just for testing.
	;		Improve to make it more user firendly
	cookies/set-cookies response compose [kuk: "Hello world" token: "abc123" (now + 1)]
	debug ["--- request:^/" mold request]
	log reduce [request/method request/uri request/header body-of port/spec]
]

data-parser: context [

	content-type?: func [] [
		all [
			request/header/Content-Type
			request/header/Content-Type/1
		]
	]

	key: value:
	series?:
	boundary*: filename*: part-type*: none
	dq: #"^""
	eq: #"="
	not-name*: charset "^"["
	store-part*: quote (
		key: make-word key
		if binary? part-type* [part-type*: to path! load part-type*]
		case [
			filename* [
				unless empty? filename* [
					unless block? parts/:key [parts/:key: copy []]
					append parts/:key make map! reduce [
						'filename  to file! filename*
						'mime-type part-type*
						'content   either text-type? part-type* [
							to string! value
						] [
							value
						]
					]
				]
			]
			not series? [put parts key to string! value]
			parts/:key  [append parts/:key to string! value]
			'else       [put parts key reduce [to string! value]]
		]
		series?: filename*: part-type*: none
	)
	multipart*: [
		if (equal? content-type? 'multipart/form-data)
		(boundary*: request/header/Content-Type/boundary)
;			(if header/Content-Type [boundary*: header/Content-Type/boundary])
		(parts: request/data: make map! 0)
		some [
			"--" boundary* crlf
			"Content-Disposition: form-data; "
			(series?: filename*: part-type*: none)
			{name="}
			copy key [some [not [dq | #"["] skip]]
			[
				#"[" 2 skip (series?: true)
			|	#"^"" 
			]
			opt [
				{; filename} opt #"*" eq	; TODO: filename* is encoded using RFC 5987
				dq copy filename* to dq skip
				crlf
				"Content-Type: " copy part-type* to crlf
			]
			2 crlf
			copy value to [crlf "--" boundary*]
			crlf
			store-part*
		]
		"--" boundary* "--" crlf
	]

	store-form-value*:  quote (
		value: to string! value
		try [value: load value]
		put request/data make-word key value
	)

	key*: [copy key to eq skip]

	x-www-form*: [
		if (equal? content-type? 'application/x-www-form-urlencoded)
		(request/data: make map! 10)
		not #"<" ; prevent <?=md5("phpunit")?>
		any [
			key*
			copy value to #"&" skip
			store-form-value*
		]
		key*
		copy value to end
		store-form-value*
	]

	plain-text*: [
		if (equal? content-type? 'text/plain)
		(request/data: make map! 10)
		any [
			key*
			copy value to crlf 2 skip
			store-form-value*
		]
		key*
		copy value to end
		store-form-value*
	]

	parse-data: func [data] [
		parse data [
			crlf
			[
				x-www-form*
			|	multipart*
			|	plain-text*
			]
		]
	]

]

parse-request: func [
	data
	/local key value type uri supported? accepts
] [
	unless data [return none]
	request: make request-proto []
	request/header: make map! 20
; 1. parse request. If it's an error, request is invalid
	data: parse-request-line data
	data: header-parser/parse-header 'request data request/header request/cookies
	unless header-parser/parsed? [
		files/serve-status case [
			not request/http-version		[400]
			request/http-version/1 > #"1"	[505]
			'else							[400]
		]
		exit
	]
; 2. check for unsupported requests
	accepts: request/header/Accept
	unless any [
		not accepts		; header is missing, pretend everything is accepted
		empty? accepts	; header is empty, same as above
		find/only accepts '*/*
		not none? get-codec accepts
	] [
		files/serve-status 406
		exit
	]
	host: select-host request/header
	if uri: select host/alias request/uri [request/uri: uri]
	request/target: decode-url rejoin [http:// request/header/host request/uri]
	data-parser/parse-data data
	; Decode query for a GET request
	if request/method = "GET" [
		request/data: load-www-form request/target/query
	]
	resolve-path
]

resolve-path: func [] [
	request/path: copy host/root-dir
	all [
		request/target
		append request/path request/target/path
		request/target/target
		append request/path request/target/target
	]
]

#TODO "should be here?"
select-host: func [rqst /local srvs srv] [
print ["+++++select-host++++" mold rqst]
	srvs: select servers server/scheme
	srvs: select srvs server/port
	foreach srv srvs [
		if equal? probe srv/domain rqst/host [return srv]
	]
	default-host
]
