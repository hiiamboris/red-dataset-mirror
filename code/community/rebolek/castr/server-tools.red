Red [
	Title: "Server tools"
	File: %server-tools.red
	Author: "Boleslav Březovský"
	Description: "Collection of tools to make using HTTP easier"
	Date: 24-7-2020
	To-Do: [
		{SEND-RESPONSE should return 500 on Red error}
	]
]

#include %common-tools.red

method:			; NOTE: global word holding headers/method
request-uri:	; NOTE: global word holding heders/request-uri
get?:
post?:
http-headers: none

parse-headers: func [
	query	[string!]
	/local headers raw key value cgi-key red-key
][
	headers: copy #[]
	key: value: none
	parse query [
		some [
			copy key to #"=" 
			skip
			copy value to newline
			skip
			(headers/:key: value)
		]
	]
	headers
]

get-headers: func [
	"Parse HTTP headers and store them in HTTP-HEADERS map!"
	/local o os cmd
][
	os: os-info
	cmd: either find/match os/name "windows" ["set"] ["printenv"]
	call/wait/output cmd o: ""
	http-headers: parse-headers o
	request-uri: to file! select http-headers "REQUEST_URI"
	switch method: to word! select http-headers "REQUEST_METHOD" [
		GET [get?: true]
		POST [post?: true]
	]
	method
]

process-input: func [
	"Return input data regardless of method"
	/only	"Do not convert the result"
	/local size result
][
	unless http-headers [get-headers]
	size: 2'097'152 ; NOTE: 2MiB preallocated for POST requests. Change if you need more
	switch select http-headers "REQUEST_METHOD" [
		"GET" [
			result: select http-headers "QUERY_STRING"
		]
		"POST" [
			read-stdin result: make binary! size size
			unless only [
				try [result: to string! result]
			]
		]
	]
	all [
		not only
		string? result ; TODO: Do the conversion for other types also? (images, ...)
		result: mime-decoder result select http-headers "CONTENT_TYPE"
	]
	result
]

context [
	http-version: "HTTP/1.1" ; NOTE: change this based on your server configuration

	data: none
	content-type: none
	reply: none
	status: none
	status-msg: none

	detect-type: func [][
		content-type: switch/default first data [
			#"<"		[	"text/html"]
			#"{" #"["	[	"application/json"]		; } (fool VIM parser)
						][	"text/plain"]
	]

	reply-string: func [value [string!]][
		data: value
		detect-type
	]

	set-type: func [type [word!]][
		content-type: select [
			text	"text/plain"
			html	"text/html"
			json	"application/json"
			csv		"text/csv"
			xml		"text/xml" ; application/xml ?
			jpeg	"image/jpeg"
			png		"image/png"
		] type
	]

	match-status: [
		opt [
			set status integer!
			opt [ ; make sure that we are not catching content, but status message
				ahead [string! not end]
				set status-msg string!
			]
		]
	]

	match-content-type: [
		opt [
			set type word! (set-type type)
		|	set content-type path!
		]
	]

	match-data: [
		set data string! (detect-type)
	|	set data map! (data: to-json data)
	|	set data file! (
			data: read/binary data
			unless content-type [content-type: "application/octet-stream"]
		)
	]

	reply-block: func [value [block!] /local type][
		parse value [
			match-status
			match-content-type
			match-data
		]
	]

	reply-json: func [value [map! object!]][
		content-type: "application/json"
		data: to-json value
	]

	frm: func ["Form that returns space isntead of NONE" value][
		either value [value][""]
	]

	set 'make-response func [
		"Make HTTP response from data or dialect"
		value	[block! string! map! object!] "Response string or dialect"
	][
		status: status-msg: none
		content-type: none
		switch type?/word value [
			string!			[reply-string value]
			block!			[reply-block value]
			map! object!	[reply-json value]
		]
		status: either status [
			rejoin [
				http-version space status
				either status-msg [rejoin [space status-msg]][""] newline
			]
		][""]
		reply: rejoin [
			status
			"Content-Type: " form content-type newline
			newline
			data
		]
	]

	set 'send-response func [
		"Send HTTP response  from data or dialect"
		value	[block! string! map! object!] "Response string or dialect"
	][
		print make-response value
		quit
	]
]

