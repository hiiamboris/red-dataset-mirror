Red [
	To-Do: [
	]
	Flags: [
		bit 0 - 1 "type"
			0 "raw binary"
			1 "red"
			2 "redbin"
			3 "error"
		bit 2 - 4 "compression"
			0 "no compression"
			1 "zlib"
			2 "deflate"
			3 "gzip"
			4 - 7 "reserved"
		bit 5 "require reply in the same format"
		bit 6 - 15 "reserved"
	]
]

#include %rs-common.red
#include %../common-tools.red

rbdt-proto: context [

	default-port: 8123

	protos: [
		sslv3	0300h
		tls1.0	0301h
		tls1.1	0302h
		tls1.2	0303h
		tls1.3	0304h
	]

	debug: :print
	;debug: :comment

	init-port: func [port /local subport] [
		subport: open to url! rejoin [
			tls:// port/spec/host #":" any [port/spec/port default-port]
		]
		subport/awake: :awake-func
		subport/extra: compose [
			accept-invalid-cert: #(true)
			min-protocol: (protos/tls1.1)
			max-protocol: (protos/tls1.3)
			state: 'none
			header: none
			request: none
			response: none
		]
		port/extra: compose [
			subport: (subport)
			timeout: 0:0:3
		]
	]

	awake-func: func [event /local port state response] [
		debug ["=== Client event:" event/type]
		port: event/port
		state: port/extra/state
		switch event/type [
			connect [
				port/extra/state: 'send
				insert port port/extra/header
			]
			read [
				port/extra/state: 'none
				response: port/extra/response: context [
					header: none
					data: make block! 10
				]
				port/extra/response: process-message port/data response
				close port
			]
			wrote [
				case [
					port/extra/state = 'send [
						port/extra/state: 'sent
						print #sending
						insert port port/extra/request
					]
					port/extra/state = 'sent [copy port]
				]
			]
		]
	]

; -- scheme funcs

	scheme: context [
		open: func [port] [
			print "++ open called"
			init-port port
		]

		copy: func [port] [
			print "++ copy called"
			; check for ASYNC flag
			unless find port/flags 'async [
				wait reduce [port/extra/subport port/extra/timeout]
			]
			port/extra/subport/extra/response/data
		]

		insert: func [port payload /local sub header data] [
			print ["++ insert called" ">>" mold payload "<<"]
			sub: port/extra/subport/extra
			sub/state: 'none
			set [header data] make-payload/keep payload 'redbin 'deflate
			sub/header: header
			sub/request: data
		]

		close: func [port] [
			print "++ close called"
			none
		]
	]
]

register-scheme make system/standard/scheme [
	name: 'RBDT
	title: "RBDT scheme"
	actor: rbdt-proto/scheme
]
