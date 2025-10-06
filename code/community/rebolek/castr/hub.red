Red[
	To-Do: [
		"Get rid of STATUS-PAGE"
		"Move logging to a module"
	]
]

md: func [value /only] [value]

#include %common-tools.red
#include %lest.red
#include %mm.red

safe-read: func [file] [if exists? file [read file]]

;-- DEFAULT CONFIG --
; NOTE: should it be here or in the module?

conf: [
	default [
		plain
		header web ; [plain web]
		root-dir %www-data
		default [ %index.html %index.htm %index.red %index.lest ]
		ssl [
			cert %cert.pem
			chain %chain.pem
			key %privkey.pem
		]
		; example CSP
		csp [
			default-src self
			font-src https://fonts.gstatic.com
			img-src self https://i.imgur.com
			object-src none
			script-src self unsafe-inline
			style-src self
		]
	]
	log [
		logfile %httpd.log
	]
	modules [
		mustache
		users
	]
]


;-- LOGGING --
; TODO: Make a module

context [
	show-log?: no
	log-file: %httpd.log
	; TODO: Do not LOAD logfile, just WRITE/APPEND to it
;	log-start: now/precise
	set 'show-log [value [logic!]][show-log?: value]
	set 'set-log-file [value [file!]][log-file: value]
	set 'log func [value /local item][
		item: reduce [
			now/precise
			'uptime httpd/stats/uptime
			'memory stats
			'served httpd/stats/served
			'requests httpd/stats/requests
			value
		]
		if show-log? [probe item]
		write/append log-file rejoin [mold item newline]

;		append/only log-data item ; TODO: switch for output to console
;		save log-file log-data
	]
]
httpd: context [

	debug: :print

	virtual-host: #[] ; map of certificates
	servers: []		; block of parsed configurations
	opened: []		; block of opened connections
	raw: none		; raw request for debugging
	server: #[		; current server (rename to HOST?)
		scheme: none
		port: none
		domain: none
	]
	status-page: none
	send-mode: 'parts
	paths: context [
		cache: %/tmp/hub
	]
	#TODO "Error handling"
	unless exists? paths/cache [make-dir paths/cache]

	load-module: func [path] [
		context bind load path self
	]

	status-code: make map! load %modules/status-codes.red

; -- stats #TODO "A module"

	stats: context [
		start-time: now/precise
		requests: 0
		served: 0
		uptime: func [] [diff-time now/precise start-time]
	]

; -- default values

	default-host: #[
		domain: "example.org"
		root-dir: %www-data
		default-file: [%index.html]
		alias: #[]
		port: 443
		scheme: 'tls
		header: #[]
		cert: #[
			cert:
			chain:
			key: none
		]
	]
	request: none
	response: none

; --  load modules

	config:		load-module %modules/config.red
	cookies:	load-module %modules/cookies.red
	req:		load-module %modules/request.red
	resp:		load-module %modules/response.red
	files:		load-module %modules/files.red

; -- handlers

	client-handler: function [event /extern server] [
		debug ["=== client event:" event/type]
		client: event/port
		client/extra: #[state: none data: none]
		switch event/type [
			read  [
				resp/init
				req/process client
				resp/process client
			]
			wrote [
				switch send-mode [
					simple [
						insert client response/data
						close client
					]
					parts [
						switch client/extra/state [
							header [
								insert client client/extra/data
								client/extra/state: 'close
							]
							close [close client]
						]
					]
				]
			]
		]
	]

	awake-body: [
		debug ["=== Awake ==="]
		server/port: self/extra/port
		server/scheme: self/spec/scheme
		server/spec: self/spec
		probe self/extra
		if event/type = 'accept [
			debug ["=== New client ==="]
			client: event/port
			client/awake: :client-handler
			copy client							;-- read from the client
		]
	]

; -- server handling

	add-server: func [
		host
		/local scheme schemes port
	] [
		unless find servers scheme: host/scheme [
			repend servers [scheme make map! 8]
		]
		schemes: servers/:scheme
		unless find schemes port: host/port [
			put schemes port make block! 8
		]
		print [scheme port]
		append servers/:scheme/:port host
	]

	run-servers: func [
		/local scheme server port hosts
	] [
		foreach [scheme ports] servers [
			foreach [port hosts] ports [
				server: open to url! rejoin [scheme "://:" port]
				server/extra: compose [
					port: (port)
					state: #(none)
					data: #(none)
				]
				if scheme = 'tls [
					append server/extra compose/deep [
						virtual-host: [(virtual-host/:port)]
					]
				]
				server/awake: func [event] bind/copy awake-body server
				append opened server
			]
		]
	]

	add-action: func [ ; MOVE to FILES module?
		"Add an action for a filetype"
		file-type [path!]
		action [block!]
		/local act
	] [
		unless act: select files/types file-type [
			repend files/types [file-type act: copy []]
		]
		append act action
	]

	start: does [
		stats/start-time: now/precise
		add-action 'application/x.lest [
			response/header/Content-Type: 'text/html
			lest/page file
		]
		log 'started
		if exists? %httpd.cfg [conf: %httpd.cfg]
		config/load conf
		log 'conf-loaded
		files/load-pages
		run-servers
		debug "===Wait==="
		wait opened
	]
]
