Red[]

#include %ws-common.red

example-reply: {
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
}

parse-request: func [request] [
	req: copy #()
	parse request [
		"GET" space
		copy page to space skip
		"HTTP/1.1" crlf
		some [
			copy key to #":" 2 skip
			copy value to crlf crlf
			(put req load key value)
		]
		crlf
	]
]


make-reply: func [request] [
	rejoin [
		"HTTP/1.1 101 Switching Protocols" crlf
		"Upgrade: websocket" crlf
		"Connection: Upgrade" crlf
		"Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=" crlf
		crlf
	]
]

process-data: func [port /local response] [
	;debug ["port data:" port/data]
	debug "process-data enter"
	unless empty? port/data [


		clear port/data
		insert port response
	]
	debug "process-data exit"
]

new-event: func [event] [
	debug ["=== Subport event:" event/type]
	switch event/type [
		read  [process-data event/port]
		wrote [copy event/port]
		close [probe "close client port" close event/port]
	]
]

sessions: #()

new-client: func [port /local data] [
	debug ["=== New client ==="]
	port/awake: :new-event
	copy port
]

run-server: func [][

	clear sessions

	server: open tcp://:1883
	server: open tcp://:6455

	server/awake: func [event] [
		if event/type = 'accept [new-client event/port]
		false
	]

	print "WebSocket server: waiting for client to connect"

	if none? system/view [
		wait server
		print "done"
		close server
	]
]

; --

run-server
=======
print "web socket server"
