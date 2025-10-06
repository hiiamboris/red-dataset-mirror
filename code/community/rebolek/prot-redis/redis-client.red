Red [
    redis title: "Basic test client"
]

#include %redis.red
#include %resp3.red

redis-proto: context [

	default-port: 6379

	init-port: func [port /local subport] [
		subport: open rejoin [
			tcp:// port/spec/host #":" any [port/spec/port default-port]
		]
		subport/awake: :awake
		subport/extra: [
			state: none
			request: none
			response: none
		]
		port/extra: reduce [
			quote subport: subport
		]
	]

	awake: func [event /local port] [
		port: event/port
		switch probe event/type [
			connect [
				insert port port/extra/request
				port/extra/state: 'send
			]
			read [
				port/extra/response: probe parse-resp probe port/data
				port/extra/state: 'idle
				close port
			]
			wrote [copy port]
		]
	]

	process-reply: func [cmd][
		switch cmd [
			"info" [reply: parse-server-info reply/data/1]
		]
		reply
	]

	set 'send-cmd func [cmd /raw][
		request: either raw [cmd][make-request cmd]
		client: open tcp://127.0.0.1:6379
		client/awake: :awake
		if none? system/view [
			wait client
			close client
			print "Done"
		]
		process-reply cmd
	]

	scheme: context [
		open: func [port] [
			print "++ open called"
			init-port port
		]

		copy: func [port] [
			print "++ copy called"
;			insert port [ping]
probe port/flags
			if any [
				not port/flags
				not find port/flags 'async
			] [
				wait port
			]
			port/extra/subport/extra/response
		]

		insert: func [port data /local sub] [
			print ["++ insert called" ">>" mold data "<<"]
			sub: port/extra/subport/extra
			sub/state: 'idle
			sub/request: make-request data
		]

		write: func [port] [
			print "++ write called"
			none
		]

		close: func [port /local value] [
			print "++ close called"
			if error? value: first port/extra/subport/extra/response [
				do value
			]
			none
		]
	]
]

register-scheme make system/standard/scheme [
	name: 'Redis
	title: "Redis scheme"
	actor: redis-proto/scheme
]

send-cmd: func [cmd /local port data] [
	port: open redis://127.0.0.1
	insert port cmd
	wait port
	data: copy port
	close port
	data
]


test-1: [
	port: open redis://127.0.0.1
	insert port [set key val]
	wait port
	data: copy port
	close port
	data
]
