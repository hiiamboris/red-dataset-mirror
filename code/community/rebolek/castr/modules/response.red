Red[]

response-proto: context [
	header:
	cookies:
	data:
	status:
		none
]

init: does [
	response: make response-proto []
	response/header: make map! 20
]

compress-response: func [data /local method] [
; TODO: Ignore compression for small data?
	either request/header/Accept-Encoding [
; FIXME: What if there are multiple methods?
		foreach method request/header/Accept-Encoding [
			if find [gzip deflate] method [break]
			method: none
		]
		if method [
			data: compress data to word! method]
			; TODO: Vary should support multiple values
			response/header/Vary: "Accept-Encoding"
			response/header/Content-Encoding: method
			debug ["RESP:" mold response]
		]
		data
	] [data]
]

make-header: func [port /local data status cookie] [
	status: response/status
	collect/into [
	; protocol info
		keep rejoin [
			"HTTP/1.1" space status space status-code/:status crlf
		]
	; collect headers
		foreach [key value] response/header [
			keep rejoin [key #":" space value crlf]
		]
	; collect cookies
		if response/cookies [
			foreach cookie response/cookies [
				keep rejoin ["Set-Cookie: " cookie crlf]
			]
		]
		keep crlf
	] data: clear ""
	; send data
	switch send-mode [
		simple [
			insert response/data data
		]
		parts [
			insert port data
			port/extra/state: 'header
		]
	]
]

process: func [port /local data] [
;	init
	data: compress-response files/process-file request/path
	response/header/Content-Length: length? data
	stats/served: stats/served + length? data
	debug ["MODserving" length? data "bytes"]
	switch send-mode [
		simple	[response/data: data]
		parts	[port/extra/data: data]
	]
	log reduce [#response response/header]
	make-header port
]
