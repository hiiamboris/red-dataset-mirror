Red[
	Title: "MQTT client"
	Author: "Boleslav Březovský"
	Notes: {
#CONNECT
Proper CONNECT message: #{101600044D515454050000000000097265646D7174747630}

#SUBSCRIBE
Proper SUBSCRIBE message: #{82090265000003612F6200}
(packet ID: #{0265})

	}
]

#include %mqtt-common.red
#include %mqtt-dialect.red

debug: :print


mqtt-scheme: context [
	response: none
	client: none

	port-id: 1883

	replies: [
		PINGREQ PINGRESP
		SUBSCRIBE SUBACK
	]

	init-port: func [port /local subport] [
		subport: open probe rejoin [tcp:// port/spec/host #":" port-id]
		subport/awake: :awake-func
		subport/extra: [
			state: none
			request: none
			response: none
			cmd-queue: none
			close?: true	; close after processing command queue?
							; if we subscribe, we don't want to close
							; but want to wait for publish messages
		]
		subport/extra/request: copy []
		subport/extra/cmd-queue: copy []
		port/extra: reduce [
			quote subport: subport
			quote timeout: 0:0:5
		]
		subport/extra/state: 'disconnected
;		insert port make-message 'CONNECT none none
	]

	awake-func: func [event /local port state response ext][
		port: event/port
		ext: port/extra
		state: ext/state
		print ["##" event/type]
		print [#-- state]
		switch event/type [
			connect [
				case [
					state = 'disconnected [
						ext/state: 'connect
						insert port make-message 'CONNECT none none
					]
					state = 'connected [
						print [#__ state mold ext/request]
					]
				]
;				insert client make-message 'PINGREQ none none
			]
			read [
				responses: copy []
				response: probe ext/response: parse-message port/data
				print [response/1 response/4]
				; TODO: improve this check, what if more messages come together
				;		that are not all PUBLISH?
				if all [
					not equal? 'PUBLISH response/1
					not zero? response/4
				] [
					do make error! "Message isn't fully parsed"
				]

				; check for error from server
				unless response/3 = "Success" [do make error! response/3]
				; check for the expected response
				switch state [
					connect [
						either response/1 = 'CONNACK [
							debug "Connection success"
							ext/state: 'connected
						] [
							do make error! rejoin [
								"Unexpected response: " response/1
							]
						]
					]
					connected [
						either response/1 = select replies take ext/cmd-queue [
							; if we subscribed, don't close connection
							if response/1 = 'SUBACK [
								ext/close?: false
								ext/state: 'waiting
							]
						] [
							; unexpected response
							do make error! rejoin [
								"Unexpected response: " response/1
							]
						]
					]
					waiting [
						print "WAITING STATE"
						append responses response
						while [not zero? response/4] [
							append responses response: probe parse-message port/data
						]
					]
					disconnecting [
						ext/state: 'disconnected
					]
				]
				; check if the queue is empty, otherwise send next command
				either probe empty? ext/request [
					; close port or wait for more data
					either ext/close? [close port] [copy port]
				] [
					print ["--INSERT:" ext/request/1]
					insert port take ext/request
				]
			]
			wrote [
				print "---WROTE---"
				copy port
			]
			close [
				#TODO "Send close connection"
				print "close port"
				ext/state: 'disconnecting
				insert port #{E00100} ; DISCONNECT, normal disconnection
				false
			]
		]
	]


	set 'send-mqtt funk [msg-type header payload][
		print ["SEND:" msg-type]
		/local msg: probe make-message msg-type header payload
		insert client msg
		wait client
		print "afta waita"
		response
	]

	set 'mqtt-client funk [][
		client: open server
		client/awake: :awake-func
		send-mqtt 'CONNECT [flags [will]] none
		wait client
	]

	scheme: context [
		sys: system/words

		open: func [port] [init-port port]

		copy: func [port] [
			; check for ASYNC flag
			unless find port/flags 'async [wait port/extra/timeout]
			port/extra/subport/extra/response
		]

		insert: func [port data [word! block!] /local ext] [
			ext: port/extra/subport/extra
			print "** act: INSERT"
			; data can be just a word, so turn it into a block
			data: either word? data [
				reduce [data none none]
			] [
			; we don't want to mess the original block
				sys/copy data
			]
			; store command to command queue for checking the correct reply
			append ext/cmd-queue to word! data/1
			; make sure we have lit-word! there
			data/1: to lit-word! data/1
			; now it's block, we can convert it to binary
			sys/insert data 'make-message
			data: do data
			; now we have binary, so we can safely store it in the queue
			append ext/request data
		]

		close: func [port] [
			
		]
	]

	register-scheme make system/standard/scheme [
		name: 'mqtt
		title: "MQTT scheme"
		actor: scheme
	]
]


repl: funk [] [
	/local data: ask "mqtt: "
	either "q" = data [
		print "Closing port"
		close port
		halt
	][
		do probe head insert parse-mqtt load/all data 'send-mqtt
	]
]

; -- test ----------------

test-1: [
	port: open/async mqtt://127.0.0.1
	insert port 'PINGREQ
;	insert port [SUBSCRIBE none "$SYS/#"]
	insert port [PUBLISH "topic/subtop" "hello world"]
	wait 10
]



