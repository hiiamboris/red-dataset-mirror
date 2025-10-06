Red[]

#include %ws-common.red
#include %client-common.red

key: "dGhlIHNhbXBsZSBub25jZQ=="

example-request: {
GET /chat HTTP/1.1
Host: example.com:8000
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Sec-WebSocket-Version: 13
}

make-request: func [page host] [
	out: clear ""
	rejoin [
		"GET " page " HTTP/1.1" crlf
		"Host: " host crlf
		"Upgrade: websocket" crlf
		"Connection: Upgrade" crlf
		"Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==" crlf
		"Sec-WebSocket-Version: 13" crlf
		crlf
	]
]

; -- main function

open-url: func [
	url [url! block!]
	/local client
] [
	unless block? url [url: compose [GET (url)]]
	parse-request url

	client: open probe request/url
	client/awake: func [event] [
		debug ["=== Client event:" event/type]
		port: event/port
		switch probe event/type [
			connect [
				data: clear #{}
				make-request
				insert port probe payload
			]
			read [
				print "** READ **"
				print type? port/data
				append data port/data
				print length? data
				copy port
			]
			wrote [
				copy port
			]
		]
		false
	]
	wait client
	close client
	process-response
	response
]

; -- test

open-url ws://ws.ifelse.io/index.html:443
open-url ws://213.188.199.36/index.html:443


