parse-request: func [url] [

]
Red[]

; -- default values

response!: context [
	status:
	status-string:
	encoding:
		none
	headers: #()
	cookies: #()
	data: none
]

headers!: #(
	Accept-Charset: utf-8
	Accept-Encoding: gzip
	Connection: close
)

request!: context [
	method:
	url:
	decoded-url:
	headers: none
]

; -- functions

init-request: func [] [
	request: make request! []
	request/headers: copy headers!
]

make-request: func [/local headers] [
	headers: request/headers
	; TODO: support other methods
	collect/into [
		keep "GET / HTTP/1.1"
		keep crlf
		foreach [key value] headers [
			keep rejoin [
				key ": " value crlf
			]
		]
		keep crlf
	] payload: clear ""
]

parse-request: func [data /local value] [
	init-request
	parse data [
		set value ['GET | 'POST | 'DELETE]
		(request/method: value)
		set value url!
		(replace value ws:// tls://)
		(request/url: value)
		(request/decoded-url: decode-url value)
		(request/headers/Host: request/decoded-url/host)
	]
]
