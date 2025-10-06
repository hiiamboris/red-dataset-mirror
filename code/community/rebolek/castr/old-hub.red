Red [
	Title: "Simple HTTP server"
	Notes: {
		The compiler is not able to compile it.
	}
	To-Do: [
		"Request's Content-Type is currently ignored"
		"Throw error on wrong config"
		{
Starting:
1) collect all settings
2) have a list of ports and their types (plain/secure)
3) open proper type of port

}
	]
	Links: [
		#HTTP-RFC

		https://datatracker.ietf.org/doc/html/rfc2616

		#Headers

		https://www.matuzo.at/blog/html-boilerplate/
		https://blog.vnaik.com/posts/web-attacks.html
		https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS

		#Security

		https://observatory.mozilla.org/analyze/rblk.eu
		https://csp-evaluator.withgoogle.com/?csp=https://rblk.eu
		https://www.ssllabs.com/ssltest/analyze.html?d=rblk.eu
	]
	Statement: "Слава Україні!"
]

#include %common-tools.red
#include %lest.red
#include %mm.red

;-- LOGGING --

context [
	show-log?: no
	log-file: %httpd.log
	; TODO: Do not LOAD logfile, just WRITE/APPEND to it
;	log-start: now/precise
	set 'show-log [value [logic!]][show-log?: value]
	set 'set-log-file [value [file!]][log-file: value]
	set 'log func [value][
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

;-- DEFAULT CONFIG --

conf: [
	default [
		plain
		port 8123
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

;-- STATUS CODES --

status-code: #[
	200 "OK"
	201 "Created"
	202 "Accepted"

	301 "Moved Permanently"
	302 "Found"
	303 "See Other"
	304 "Not Modified"

	400 "Bad Request"
	401 "Unauthorized"
	403 "Forbidden"
	404 "Not Found"
	405 "Method Not Allowed"
	406 "Not Acceptable"
	408 "Request Timeout"

	500 "Internal Server Error"
	501 "Not Implemented"
	502 "Bad Gateway"
	503 "Service Unavailable"
	504 "Gateway Timeout"
	505 "HTTP Version Not Supported"
	506 "Variant Also Negotiates"
	507 "Insufficient Storage (WebDAV)"
	508 "Loop Detected (WebDAV)"
	510 "Not Extended"
	511 "Network Authentication Required"
]

;-- MAIN CONTEXT --

httpd: context [

	debug: :print
	;debug: :comment

;-- INTERNAL VALUES --

	file-types: []
	host: none

	hosts: #[
		"default" #[
			root-dir: %www-data
			default-file: [%index.html]
			alias: #[]
			port: 443
;TODO: chage PORT to something like port [443 secure 80 plain]
			scheme: tls
			header: #[]
			cert: #[
				cert:
				chain:
				key: none
			]
		]
	]

	default-host: #[
		domain: "example.org"
		root-dir: %www-data
		default-file: [%index.html]
		alias: #[]
		port: 443
		scheme: tls
		header: #[]
		cert: #[
			cert:
			chain:
			key: none
		]
	]

	virtual-host: #[]

	servers: []

	opened: []

	raw: none ; RAW request, mainly for debug

	request-proto: context [
		header:
		data:
		method:
		uri:
		query:
		path:
		target:
		cookies:
		http-version:
			none
	]
	request: none
	init-request: does [
		request: make request-proto []
		request/header: copy #[]
	]

	response-proto: context [
		header:
		cookies:
		data:
		status:
			none
	]
	response: none
	init-response: does [
		response: make response-proto []
;		response/header: copy/deep host/header ; do I need `copy` here?
		response/header: copy #[]
		response/cookies: make block! 10
	]

	status-page: none

	send-mode: 'parts
	
	stats: context [
		start-time: now/precise
		requests: 0
		served: 0
		uptime: func [] [diff-time now/precise start-time]
	]

;-- DEFAULT PAGES --

	load-pages: has [pages-file] [
		pages-file: %templates/pages.red
		pages: either exists? pages-file [make map! load pages-file] [#[]]
	]
	pages: none

;-- DEFAULT HEADER --

; These are standard headers that are sent with every page aimed to improve
; security and privacy. You better leave this alone and not change it.

	response-headers: [
		plain #[
	; mandatory headers
			Content-Type: none
			Content-Length: none
		]
		web #[
	; mandatory headers
			Content-Type: none
			Content-Length: none
	; security headers
		; Protects against Clickjacking attacks
			X-Frame-Options: "DENY"
		; Mitigates Cross-Site Scripting (XSS) attacks
			X-XSS-Protection: "1; mode=block"
		; Protects against man-in-the-middle attack
			Strict-Transport-Security: "max-age=31536000; includeSubDomains"
		; Prevents possible phishing or XSS attacks
			X-Content-Type-Options:  "nosniff"
			Content-Security-Policy: {default-src 'self'; script-src 'strict-dynamic'; object src 'none'; base-uri 'none'; require-trusted-types-for 'script'; report-uri https://csp.rblk.eu; }
		; Taken from https://csp-evaluator.withgoogle.com/
			;Referrer-Policy: "same-origin"
			Referrer-Policy: "strict-origin-when-cross-origin"
	; privacy headers
		; Opt-out of Google’s terrible FLoC
			Permissions-Policy: "interest-cohort=()"
		]
	]
	header: 'web

;-- SUPPORT FUNCTIONS --

	safe-read: func [file] [if exists? file [read file]]


	init-header: func [] [
		host/header: select response-headers header
	]

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
		append servers/:scheme/:port host
	]

; -- CONFIGURATION --

	conf-parser: context [
		value: none
		host-name: none
	; -- content security policy processing for config
		csp-parser: context [
			string: none
			data: none
			key: none
			get-value: [
				set value ['none | 'self | 'unsafe-inline | url! | set-word!]
				(append data value)
			]
			process-csp: quote (
				collect/into [
					keep form key
					foreach value data [
						keep space
						keep either word? value [enquote/single value] [value]
					]
					keep "; "
				] string
			)
		]
		csp-rule: bind [
			(string: clear "")
			some [
				set key [
					'default-src | 'font-src | 'img-src | 'object-src
				|	'script-src | 'style-src
				]
				(data: clear [])
				some get-value
				process-csp
			]
			(take/part/last string 1)
		] csp-parser
	; -- end of CSP

		host-rule: [
			(host: copy default-host)
			set host-name ['default | string! | word!]
			(host/domain: form host-name)
			into [
				some [
			; root directory
					'root-dir set value file!
					(if dir? value [take/last value])
					(debug ["CONF: root-dir" value])
					(host/root-dir: value)
			; default file
				|	'default set value [file! | block!]
					(debug ["CONF: default file" value])
					(host/default-file: to block! value)
			; aliases
				|	'alias set value [string! | file!] set target file!
					(unless #"/" = first target [insert target %/ ] )
					(put host/alias to file! value target)
			; connection
				|	'plain ; Do not use SSL
					(host/port: 80 host/scheme: 'tcp)
				|	'scheme set value word! (host/scheme: value)
				|	'port set value integer! (host/port: value)
				|	['certs | 'ssl] into [some cert-rule]
			; default headers
				|	'header set value word!
					(header: either find response-headers value [value] ['web])
				]
			; now headers can be initialized and we can look for CSP
			; but not before!
				(init-header)
				any [
			; content security protection
					['csp | 'content-security-policy] into csp-rule
					(host/header/Content-Security-Policy: copy csp-parser/string)
					(debug ["CONF: csp" mold csp-parser/string])
				]
			]
			(set-certs form host-name)
			(put hosts form host-name host)
			(add-server host)
		]
		cert-rule: [
	; TODO: error when files don't exist
			'cert set value file! (host/cert/cert: safe-read value)
		|	'chain set value file! (host/cert/chain: safe-read value)
		|	'key set value file! (host/cert/key: safe-read value)
		]
		log-rule: [
			'logfile set value file! (set-log-file value)
		]
		mod-rule: [
	; TODO: load modules config from external sources
			'mustache (
				do %mustache.red
				add-codec [mustache: text/x.mustache %.mustache ] ; TODO: Is this required?
			;	append file-types [text/html [mustache to string! data none]]
				add-action 'text/html [form try [mustache to string! data none]]
				; TODO: replace NONE with some context
			)
		|	'users
			(value: none)
			opt set value block! (
				do %users.red
				mod-users/load-config/from value
			)
		]
		rule: [
			host-rule
		|	'log into [some log-rule]
		|	'modules into [some mod-rule]
		]
	]

	load-conf: func [
		conf [block! file!]
		/local value target
	][
		if file? conf [conf: load conf]
		unless parse conf bind [some rule] conf-parser [
			do make error! "Error in configuration file"
		]
	]

	load-page: func [name /status /local page] [
		page: select pages name
		if all [not page status] [
			status: rejoin [to string! name space select status-code to integer! name]
			page: lest/page compose [
				title (status)
				desc (status)
				h1 (status)
			]
		]
		if file? page [page: read page]
		if block? page [page: lest/page page] ; TODO: some caching
		unless page [page: ""]
		page
	]

	make-header: func [port /local data status cookie] [
		status: response/status
		collect/into [
		; protocol info
			keep rejoin [
				"HTTP/1.1" space status space status-code/:status crlf
			]
		; collect headers
			foreach [key value] response/header [
				keep rejoin [key #":" space value crlf]
			]
		; collect cookies
			if response/cookies [
				foreach cookie response/cookies [
					keep rejoin ["Set-Cookie: " cookie crlf]
				]
			]
			keep crlf
		] data: clear ""
		; send data
		switch send-mode [
			simple [
				insert response/data data
			]
			parts [
				insert port data
				port/extra/state: 'header
			]
		]
	]

	resolve-path: func [request host] [
		request/path: copy host/root-dir
		all [
			request/target
			append request/path request/target/path
			request/target/target
			append request/path request/target/target
		]
	]

	request-parser: context [
		make-rule: func [
			name
			/token	"Grab token (uses token* rule)"
			/number "Grab number"
			/date	"Grab HTTP-Date"
			/load	"load value before storing"
			/grab	"Use only with /WITH - prepend rule with [copy value]"
			/with
				data
		] [
			compose [
				bflm: (rejoin [name #":"]) ws
				(
					case bind [
						token  [[get-token]]
						number [[get-number]]
						grab   [reduce ['copy 'value data]]
						with   [data]
						load   [[get-value (value: load value)]]
						date   [[http-date]]
						'else  [[get-value (value: to string! value)]]
					] 'value
				)
				(
					to paren! bind compose [
						set-header (to lit-word! name) value
					] 'value
				)
			]
		]

		emit-entity: func [value] [trim reduce [if data/weak? ['weak] value]]

		entity-rule: function [name] [
			compose [
				(rejoin [name #":"]) ws
				(to paren! [clear data])
				(to paren! compose [
					target: (make set-path! reduce ['header name]) copy []
				])
				copy value [
					#"*" (append target '*)
				|	entity-tag (
						append target emit-entity value
					)
				]
			]
		]

		accept-rule: function [
			name
		] [
			ctx: context [
				name*: bind reduce [
					'copy 'value [token* | "*"] to paren! reduce [
						'append make path! reduce ['header name] 'load 'value
					]
					'opt reduce [
						'quality*
						to paren! reduce [
							'repend make path! reduce ['header name] reduce [
								'to 'set-word! to lit-word! 'q 'load 'value
							]
						]
					]
				] self
				rule*: reduce [
					to set-word! 'zz
					rejoin [to string! name #":"] 'ws
					to paren! reduce [make set-path! reduce ['header name] 'copy []]
					name* 'any reduce [comma 'opt 'LWS name*]
				]
			]
			ctx/rule*
		]

		set-target: func [name] [target: header/:name: copy []]
		set-header: func [
				key
				value
				/only "Leave value as string!"
			] [
debug [#SET-HEADER mold key mold value]
			if binary? key [key: any [attempt [load key] to string! key]]
			if binary? value [
				value: to string! value
				unless only [try [value: load value]]
			]
			header/:key: value
		]

		q:
		key:
		attribute:
		value:
		target:
		parts:
		header: none
		data: #[]
		stack: []
		fail?: false

		dq: #"^""
		eq: #"="
		alpha:      charset [#"a" - #"z"]
		digit:      charset "01234456789"
		number*:            [some digit]
		separators*:        charset "()<>@,;:\^"/[]?={} ^-"
		CTLs:       charset [#"^(01)" - #"^(1F)" #"^(7F)"]
		CHAR:       charset [#"^(00)" - #"^(7F)"]
		spht:       charset " ^-"
		TEXT:    complement CTLs 
		ws:                 [some spht]
		ws*:                [any spht]
		LWS:                [opt crlf some spht]
		parameter*:         [attribute* eq value*]
		value*:             [copy value [token* | quoted-string*]]
		not-token-char*:    union separators* CTLs
		token-char*:        complement not-token-char*
		token*:             [some token-char*]
		quoted-string*:     [dq some [qdtext* | quoted-pair*] dq]
		qdtext*:            [some [not dq]]
		quoted-pair*:       [#"\" CHAR]
		attribute*:         [copy attribute token*]
		type*:
		subtype*:
                            token*
		get-token:          [copy value token*]
		get-value:          [copy value to crlf]
		get-number:         [copy value number* (value: load value)]
		http-date*:         [copy value to crlf]
		product*:           [copy value [token* opt [slash token*]]]
		cchar:        union TEXT charset [not "()"]
		ctext*:  complement cchar
		ctext*: charset [not "()"]
		cookie-chars*: charset [not ";^M"]

		comment*: [
			#"(" any [ctext* | quoted-pair* | comment*] #")"
		]

		append-value: quote (
			if binary? value [try [value: load value]]
			 append target value
		)

		get-parameters*: [
			any [
				#";" ws* parameter*
				(repend target [to set-word! load attribute to string! value])
			]
		]

		entity-tag: [
			opt "W/" (data/weak?: true)
			copy value quoted-string*
		]
		
		extension*: [
			get-token
			append-value
			opt [
				eq copy value [token* | quoted-string*]
				append-value
			]
		]

		init: quote (
			clear data
			clear stack
			header: request/header
			fail?: false
		)

		http-version*: [
			"HTTP" slash
			get-number (insert stack value)
			dot
			get-number
			(request/http-version: rejoin [take stack dot value])
		]
		request*: [
			copy value to space (
				fail?: error? try [request/method: to string! value]
			)
			[
				if (fail?) to end reject
			|
				some spht
				copy value to space (request/uri: to file! value)
				some spht
				http-version*
			]
		]

		media-range*: [
			copy value [
				"*/*"
			|	type* slash #"*" ; TODO: replace with token here?
			|	type* slash subtype*
			]
			(append/only target load value)
			any [
				#";" ws*
				[not "q=" parameter*]
				; TODO: Can there be something different than `Level=<int>` ?
				(repend target [to set-word! load attribute to string! value])
			]
		]

		qeq*: [#";" ws* #"q" ws* eq ws*] ; qeq: "quality equals"
		quality*: [qeq* copy value qvalue*]
		qvalue*: [
			#"0" opt [dot 0 3 digit]
		|	#"1" opt [0 3 #"0"]
		]

		accept-params*: [
			quality*
			(repend target [to set-word! 'q load value])
			any [#";" ws* extension*]
		]
		mime-type*: [media-range* opt accept-params*]
		accept*: [
			"Accept:" ws
			(set-target 'Accept)
			mime-type* any [comma opt LWS mime-type*]
		]

		accept-language*: accept-rule 'Accept-Language
		accept-encoding*: accept-rule 'Accept-Encoding
		accept-charset*:  accept-rule 'Accept-Charset

		accept-ranges*: make-rule/grab 'Accept-Ranges ["bytes" | "none" | token*]

		age*: make-rule/number 'Age
		allow*: make-rule/grab 'Allow [
			"OPTIONS" | "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "TRACE"
		|	"CONNECT" | token*
		]

		; TODO: decode properly (basic, Bearer, etc...)
		authorization*: make-rule 'Authorization

		cache-request-directive*: [
			copy value ["no-cache" | "no-store" | "no-transform" | "only-if-cached"]
			append-value
		|	copy value ["max-age" | "min-fresh"]
			append-value
			eq get-number
			append-value
		|	copy value "max-stale"
			append-value
			 opt [
				eq get-number
				append value
			]
		|	extension*
		]
		cache-response-directive*: [
			copy value [
				"public" | "no-store" | "no-transform"
			|	"must-revalidate" | "proxy-revalidate"
			]
			append-value
			copy value ["private" | "no-cache"]
			append-value
			opt [
				eq dq get-token dq 
				append-value
			]
		|	copy value ["max-age" | "s-maxage"]
			append-value
			eq get-number
			append-value
		|	extension*
		]
		cache-control*: [
			"Cache-Control:" ws
			(set-target 'Cache-Control)
			[
				cache-request-directive*
			|	cache-response-directive*
			]
		]

		connection*: make-rule/token 'Connection
		content-encoding*: make-rule/token 'Content-Encoding

		languge-tag*: [1 8 alpha any [#"-" 1 8 alpha]]
		content-language*: [
			"Content-Language:" ws
			copy value [language-tag* any [#"," language-tag]]
			(set-header 'Content-Language value)
		]

		content-length*:   make-rule/number 'Content-Length
		content-location*: make-rule/load 'Content-Location
		content-md5*:      make-rule 'Content-MD5

		content-range*: [
			"Content-Range:" ws
			(clear data)
			"bytes" space
			[
				get-number (data/start: value) #"-" get-number (data/end: value)
			|	#"*" (data/all?: true)
			]
			slash
			[get-number (data/length: value) | #"*" (data/length: '*)]
			(
				header/Content-Range: compose [
					range: (either data/all? ['*] reduce [data/start data/end])
					length: (data/length)
				]
			)
		]

		content-type*: [
			"Content-Type:" ws
			(clear data)
			get-token (data/type: load value)
			slash
			get-token (data/subtype: load value)
			(
				target: header/Content-Type: reduce [
					make path! reduce [data/type data/subtype]
				]
			)
			get-parameters*
		]

		date*: make-rule/date 'Date

		etag*: [
			"ETag:" ws
			(clear data)
			opt "W/" (data/weak?: true)
			copy value quoted-string*
			(header/ETag: emit-entity value)
		]

		expect-params*: [
			#";" get-token (append data/params to set-word! load value) [
				eq
				copy value [token* | quoted-string]
				(append data/params to string! value)
			]
		]
		expect*: [
			"Expect:" ws
			(clear data)
			(data/params: clear [])
			[
				copy value "100-continue" (data/type: value)
			|	get-token (data/type: value value: none)
				opt [
					eq
					copy value [token* | quoted-string*]
					any expect-params*
				] (
					header/Expect: trim compose [
						(data/type)
						(value)
						(unless empty? data/params [data/params])
					]
				)
			]
		]

		expires*: make-rule/date 'Expires
		from*:    make-rule/load 'From
		host*:    make-rule 'Host

		if-match*: entity-rule 'If-Match

		if-modified-since*: make-rule/date 'If-Modified-Since

		if-none-match*: entity-rule 'If-None-Match

		if-range*: [
			"If-Range:" ws
			(clear data)
			[
				entity-tag (header/If-Range: emit-entity value)
			|	httpd-date (header/If-Range: value)
			]
		]

		if-unmodified-since*: make-rule/date 'If-Unmodified-Since
		last-modified*: make-rule/date 'Last-Modified
		location*: make-rule 'Location
		max-forwards*: make-rule/number 'Max-Forwards

		pragma*: [
			(set-target 'Pragma)
			"Pragma:" ws ["no-cache" append-value | extension*]
		]

		proxy-authenticate*: make-rule 'Proxy-Authenticate
		proxy-authorization*: make-rule 'Proxy-Authorization


		byte-range-set: [byte-range-spec | suffix-byte-range-spec]
		byte-range-spec: [
			get-number (data/start: value)
			#"-" opt [get-number (data/end: value)]
		]
		suffix-byte-range-spec: [#"-" get-number (data/length: value)]

		range*: [
			"Range:" ws
			(clear data)
			"bytes" ws* eq byte-range-set
			(
				header/Range: trim compose [
					(data/start) - (data/end) (data/length)
				]
			)
		]

;		referer*: make-rule/load 'Referer
		referer*: make-rule 'Referer
		retry-after*: make-rule/with 'Retry-After [http-date | get-number]

		server*: [
			"Server:" ws
			(header/Server: clear [])
			some [copy value [product* | comment*] (append header/Server value)]
		]

		t-codings*: [
			"trailers" (append target 'trailers)
		|	transfer-extension* opt accept-params*
		]
		transfer-extension*: [
			get-token
			append-value
			get-parameters*
		]
		te*: [
			"TE:" ws
			(set-target 'TE)
			 any t-codings*
		]

		trailer*: [
			"Trailer:" ws
			(set-target 'Trailer)
			some [get-token append-value]
		]

		transfer-encoding*: [
			"Transfer-Encoding:" ws
			(set-target 'Transfer-Encoding)
			[
				"chunked" (append target 'chunked)
			|	get-token
				append-value
				get-parameters*
			]
		]

		upgrade*: make-rule 'Upgrade
		upgrade*: [
			"Upgrade:" ws
			(set-target 'Upgrade)
			product*
			append-value
		]

		user-agent*: [
			"User-Agent:" ws
			(set-target 'User-Agent)
			some [ [ws | product* append-value | comment* append-value] ]
		]

		vary*: [
			"Vary:"
			(set-target 'Vary)
			[
				#"*" (append target '*)
			|	token* append-value ny [#"," token* append-value]
			]
		]

		rec-host*: [some [not [#":" | crlf] skip]] ; TODO: Proper rule
		received-protocol*: [opt [token* slash] token*]
		received-by*: [
			rec-host* opt [#":" number]
		|	token*
		]
		received*: [
			copy value received-protocol* append-value
			copy value received-by* append-value
			opt comment
		]
		via*: [
			"Via:" ws
			received* any [#"," ws received*]
		]

		warn-code*: [copy value 3 digit]
		warn-agent*: [copy value [rec-host* opt [#":" number]]]
		warn-text*: [copy value quoted-string*]
		warn-date*: [dq http-date* dq]
		warning-value*: [
			warn-code* space
			warn-agent* space
			warn-text*
			opt [space warn-date*]
		]
		warning*: [
			"Warning:" ws
			warning-value* any [warning-value*]
		]

		www-authenticate*: make-rule 'WWW-Authenticate


		dnt*: [
			"DNT:" ws copy value skip
			(header/DNT: make logic! to integer! value)
		]

		other-header*: [
			copy key to #":" skip ws
			copy value to crlf
			(set-header key value)
		]

		store-part*: quote (
			key: make-word key
			if binary? part-type* [part-type*: to path! load part-type*]
			case [
				filename* [
					unless empty? filename* [
						unless block? parts/:key [parts/:key: copy []]
						append parts/:key make map! reduce [
							'filename  to file! filename*
							'mime-type part-type*
							'content   either text-type? part-type* [
								to string! value
							] [
								value
							]
						]
					]
				]
				not series? [put parts key to string! value]
				parts/:key  [append parts/:key to string! value]
				'else       [put parts key reduce [to string! value]]
			]
			series?: filename*: part-type*: none
		)
		boundary*: none
		series?: filename*: part-type*: none
		not-name*: charset "^"["
		multipart*: [
			if (equal? content-type? 'multipart/form-data)
			(boundary*: header/Content-Type/boundary)
;			(if header/Content-Type [boundary*: header/Content-Type/boundary])
			(parts: request/data: make map! 0)
			some [
				"--" boundary* crlf
				"Content-Disposition: form-data; "
				(series?: filename*: part-type*: none)
				{name="}
				copy key [some [not [dq | #"["] skip]]
				[
					#"[" 2 skip (series?: true)
				|	#"^"" 
				]
				opt [
					{; filename} opt #"*" eq	; TODO: filename* is encoded using RFC 5987
					dq copy filename* to dq skip
					crlf
					"Content-Type: " copy part-type* to crlf
				]
				2 crlf
				copy value to [crlf "--" boundary*]
				crlf
				store-part*
			]
			"--" boundary* "--" crlf
		]

		store-form-value*:  quote (
			value: to string! value
			try [value: load value]
			put request/data make-word key value
		)

		key*: [copy key to eq skip]

		content-type?: func [] [
			all [
				header/Content-Type
				header/Content-Type/1
			]
		]

		x-www-form*: [
			if (equal? content-type? 'application/x-www-form-urlencoded)
			(request/data: make map! 10)
			not #"<" ; prevent <?=md5("phpunit")?>
			any [
				key*
				copy value to #"&" skip
				store-form-value*
			]
			key*
			copy value to end
			store-form-value*
		]

		plain-text*: [
			if (equal? content-type? 'text/plain)
			(request/data: make map! 10)
			any [
				key*
				copy value to crlf 2 skip
				store-form-value*
			]
		]

		cookies: none
		init-cookies*: quote (
			unless request/header/Cookies [request/header/Cookies: copy #[]]
			cookies: request/header/Cookies
		)
		cookie*: [
			"Cookie:" ws
			init-cookies*
			some [
				key*
				copy value [some cookie-chars*]
				(put cookies make-word key to string! value)
				[crlf break | #";" any space]
			]
		]

		rule: [
			init
			request*
			some [
				crlf crlf [
					ahead end break
				|	x-www-form*
				|	plain-text*
				|	multipart*
				]
			|	crlf ; common line end for all rules
			|	accept*
			|	accept-charset*
			|	accept-encoding*
			|	accept-language*
			|	accept-ranges*
			|	age*
			|	allow*
			|	authorization*
			|	cache-control*
			|	connection*
			|	content-encoding*
			|	content-language*
			|	content-length*
			|	content-location*
			|	content-md5*
			|	content-range*
			|	content-type*
			|	date*
			|	etag*
			|	expect*
			|	expires*
			|	from*
			|	host*
			|	if-match*
			|	if-modified-since*
			|	if-none-match*
			|	if-range*
			|	if-unmodified-since*
			|	last-modified*
			|	location*
			|	max-forwards*
			|	proxy-authenticate*
			|	proxy-authorization*
			|	range*
			|	referer*
			|	retry-after*
			|	server*
			|	te*
			|	trailer*
			|	transfer-encoding*
			|	upgrade*
			|	user-agent*
			|	vary*
			|	via*
			|	warning*
			|	www-authenticate*

			|	cookie*	

			|	dnt*

			|	other-header*
			]
		]
	
	]


	decode-query: has [type method target] [
		if all [
			request/method = "GET"
			request/target
		] [
			request/data: load-www-form request/target/query
		]
	]

	parse-request: func [
		port
		/local data key value type uri supported? accepts
	] [
		data: port/data
		unless data [return none]
		init-request
; 1. parse request. If it's an error, request is invalid
		unless parse data request-parser/rule [
			serve-status case [
				not request/http-version		[400]
				request/http-version/1 > #"1"	[505]
				'else							[400]
			]
			exit
		]
; 2. check for unsupported requests
		accepts: request/header/Accept
		unless any [
			not accepts		; header is missing, pretend everything is accepted
			empty? accepts	; header is empty, same as above
			find/only accepts '*/*
			not none? get-codec accepts
		] [
			serve-status 406
			exit
		]
;TODO: Select host from SERVERS
;		host: any [
;			select hosts request/header/host
;			default-host
;		]
		host: select-host port request/header
		if uri: select host/alias request/uri [request/uri: uri]
		response/header: copy host/header
		request/target: decode-url rejoin [
			either port/spec/scheme = 'tls [https:// ] [http:// ]
			request/header/host
			request/uri
		]
		decode-query
		resolve-path request host
	]

	select-host: func [port rqst /local srvs srv] [
;TODO: SCHEME and PORT are not part of REQUEST
;		and I need to get them from elsewhere!
		srvs: select servers port/extra/scheme
		srvs: select srvs port/extra/port
		foreach srv srvs [
			; TODO: This splits host to [server port] but is it wise?
			;		What if there are multiple hosts on multiple servers?
			;		This needs to be checked
			if equal? srv/domain first split rqst/host #":" [return srv]
		]
		default-host
	]

; TODO: fix the global words here

	get-file: func [/local type action dir][
		file: request/path
		debug ["get-file" mold file]
		data: read/binary file
		hash: checksum data 'sha256
		response/status: 200
		response/header/Content-Type: type: first get-mime-type file
		if action: select/only file-types type [data: do action]
		log reduce ['get-file file type]
		data
	]

	serve-status: func [status [integer!]] [
		response/status: status
		response/header/Content-Type: 'text/html
		log reduce [status select status-code status]
		status-page: load-page/status to file! status
	]

	; TODO: Rename to something like list-dir-internal
	list-dir: func [files /local time file] [
		time: now/time/precise
		collect/into [
			keep reduce [
				'h1 rejoin ["Listing of directory " request/uri]
				'hr
				'ul
			]
			foreach file files [
				keep reduce [
					'li 'link rejoin [request/target/ref #"/" file] form file
				]
			]
			keep reduce [
				'hr
				rejoin [
					"Created by the HUB webserver in "
					now/time/precise - time
					" seconds."
				]
			]
		] data: clear []
		lest/page data
	]

	list-directory: func [/local path file files data default] [
		path: request/path
		unless dir? path [path: dirize path]
		default: host/default-file
		foreach file default [
			if exists? file: rejoin [path file] [
				request/path: file
				return get-file
			]
		]
		files: read path
		response/status: 200
		response/header/Content-Type: 'text/html
		data: list-dir sort files
		data
	]

	cookie-parser: context [
		time: flag: flags: name: names: value:
			none
		mapping: [
			secure ["Secure"]
			http-only httponly ["HttpOnly"]
			same-site samesite ["SameSite"]
		]
		default-flags: "; Secure; HttpOnly; SameSite=Strict"
		process-flags: does [
			forall flags [
				flag: select mapping first flags
				; SameSite can have modifiers
				if flag = "SameSite" [
					either find [lax strict none] second flags [
						flag: rejoin [flag #"=" second flags]
						flags: next flags
					] [
						; default is SameSite=Lax
						flag: "SameSite=Lax"
					]
				]
				reppend value ["; " select mapping flag]
			]
		]
		action: quote (
			unless find names name [
			; NOTE: add each cookie only once. Maybe overwrite would be a better way?
				append names name
				value: rejoin [name #"=" value]
				if time [
					name: either date? time [
						time: to-rfc5322-date/gmt time "Expires"
					] ["Max-Age"]
					repend value ["; " name #"=" time]
				]
				case [
					; default safe behavior
					empty? flags [append value default-flags]
					; no safe defaults
					all [single? flags flags/1 = 'none] []
					'else process-flags
				]
				append response/cookies value
			]
		)
		rule: [
			(names: clear [])
			some [
				(time: none)
				(flags: clear [])
				set name set-word!
				set value skip
				any [
					set time [date! | integer!]
				|	set flag word! (append flags flag)
				]
				action
			]
		]
	]

	set-cookies: func [
		cookies [block!]
	] [
		response/cookies: any [response/cookies copy []]
		parse cookies cookie-parser/rule
	]

;-- SERVER FUNCTIONS --

	add-action: func [
		"Add an action for a filetype"
		file-type [path!]
		action [block!]
		/local act
	] [
		unless act: select file-types file-type [
			repend file-types [file-type act: copy []]
		]
		append act action
	]

	compress-response: func [data /local method] [
; TODO: Ignore compression for small data?
		either request/header/Accept-Encoding [
; FIXME: What if there are multiple methods?

			foreach method request/header/Accept-Encoding [
				if find [gzip deflate] method [break]
				method: none
			]
			if method [
				data: compress data method
				; TODO: Vary should support multiple values
				response/header/Vary: "Accept-Encoding"
				response/header/Content-Encoding: method
				debug ["RESP:" mold response]
			]
			data
		] [data]
	]

	process-file: func [file] [
		if status-page [return status-page]
		case [
			not file [""]
			all [not exists? file not exists? dirize file] [serve-status 404]
			any [dir? file exists? dirize file] [list-directory]
			not dir? file [get-file]
		]
	]

	process-request: func [
		port
		/local key value data uri default method
	] [
		stats/requests: stats/requests + 1
		status-page: none
		init-response
		parse-request port
		; NOTE: This sets some default cookies just for testing.
		;		Improve to make it more user firendly
		set-cookies compose [kuk: "Hello world" token: "abc123" (now + 1)]
		debug ["--- request:^/" mold request]
		log reduce [request/method request/uri request/header body-of port/spec]
		data: compress-response process-file request/path
		response/header/Content-Length: length? data
		stats/served: stats/served + length? data
		debug ["HUBserving" length? data "bytes"]
		switch send-mode [
			simple	[response/data: data]
			parts	[port/extra/data: data]
		]
		log reduce [#response response/header]
		make-header port
	]

	client-handler: function [event] [
		debug ["=== client event:" event/type]
		client: event/port
;		client/extra: copy [state: #[none] data: #[none]]
		switch event/type [
			read  [process-request client]
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

	crypto-protos: [
		sslv3	0300h
		tls1.0	0301h
		tls1.1	0302h
		tls1.2	0303h
		tls1.3	0304h
	]

	set-certs: func [port] [
		port: host/port
		unless virtual-host/:port [
			virtual-host/:port: copy []
		]
		append/only virtual-host/:port compose/deep [
			domain: (host/domain)
			certs: [(host/cert/cert) (host/cert/chain)]
			key: (host/cert/key)
			;-- temporary
			min-protocol: (crypto-protos/tls1.2)
			max-protocol: (crypto-protos/tls1.3)
		]
	]

	awake-func: function [event] [
		if event/type = 'accept [
			debug ["=== New client ==="]
			client: event/port
			client/awake: :client-handler
			copy client							;-- read from the client
		]
	]
	awfb: [
		if event/type = 'accept [
			debug ["=== New client ==="]
			debug self/spec
			client: event/port
			client/awake: :client-handler
			client/extra: compose [
				port: (self/spec/port)
				scheme: (self/spec/scheme)
				state: #(none)
				data: #(none)
			]
			copy client							;-- read from the client
		]
	]

	run-servers: func [
		/local scheme server
	] [
		foreach [scheme ports] servers [
			foreach [port host] ports [
				server: open probe to url! rejoin [scheme "://:" port]
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
				server/awake: function [event] copy/deep awfb
				bind body-of :server/awake server
				append opened server
			]
		]
	]

	start: does [
		stats/start-time: now/precise
		add-action 'application/x.lest [
			response/header/Content-Type: 'text/html
			lest/page file
;			either attempt [data: load data] [lest/page/cache data hash] [data]
		]
		log 'started
		if exists? %httpd.cfg [conf: %httpd.cfg]
		load-conf conf
		log 'conf-loaded
		load-pages
		run-servers
		wait opened
	]
]

;httpd/start

