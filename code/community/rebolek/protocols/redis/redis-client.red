Red [
    redis title: "Basic test client"
]

#include %redis.red
#include %resp3.red

recycle/off

context [
	request: none
	reply: none

	awake: func [event /local port] [
		port: event/port
		switch probe event/type [
			connect [insert port to binary! request]
			read [
				reply: parse-resp3 to string! port/data
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
]
