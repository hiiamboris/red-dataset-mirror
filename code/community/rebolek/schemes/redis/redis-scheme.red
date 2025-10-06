Red [
	Title: "Redis scheme"
	Author: "Boleslav Březovský"
	Note: {
	}
]

#include %redis.red
#include %resp3.red

redis-proto: context [

; -- local variables --

	default-port: 6379

; -- support functions --

	init-port: func [port /local subport] [
		subport: open rejoin [
			tcp:// port/spec/host #":"
			any [port/spec/port default-port]
		]
		subport/awake: :awake 
		subport/extra: [
			state: none
			request: none
			response: none
		]
		port/extra: reduce [
			quote subport: subport
			quote timeout: 0:0:10
		]
	]

; -- event handler

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

; -- scheme actions --

	scheme: context [
		open: func [port] [
			print "++ open called"
			init-port port
		]

		copy: func [port] [
			print "++ copy called"
;			insert port [ping]
probe port/flags
			unless find port/flags 'async [wait port/extra/timeout]
			port/extra/subport/extra/response
		]

		insert: func [port data /local sub] [
			print ["++ insert called" ">>" mold data "<<"]
			sub: port/extra/subport/extra
			sub/state: 'idle
			sub/request: probe make-request data
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

	register-scheme make system/standard/scheme [
		name: 'redis
		title: "Redis scheme"
		actor: scheme
	]
]

