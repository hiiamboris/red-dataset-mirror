Red[
	Title: "Finger protocol"
	Author: "Boleslav Březovský"
]

finger: func [
	/local query
] [
	query: {/W}
	append query crlf

	conn: open tcp://127.0.0.1:79
	conn/awake: func [event] [
		port: event/port
		print ["** EVENT:" event/type]
		switch event/type [
			connect [
				insert port query
			]
			read [
				data: copy port/data
			]
		]
		false
	]
	wait conn
	close conn
	data
]

finger
