Red[
	Title: "HUB - config module"
	Author: "Boleslav Březovský"
]

value: none
host: none
host-name: none
header: 'web

crypto-protos: [
	sslv3	0300h
	tls1.0	0301h
	tls1.1	0302h
	tls1.2	0303h
	tls1.3	0304h
]

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
; TODO: ^^ get from HOST
	; Taken from https://csp-evaluator.withgoogle.com/
		Referrer-Policy: "same-origin"
; privacy headers
	; Opt-out of Google’s terrible FLoC
		Permissions-Policy: "interest-cohort=()"
	]
]

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

init-header: quote (host/header: select response-headers header)

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

host-rule: [
	(host: copy/deep default-host)
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
		init-header
		any [
	; content security protection
			['csp | 'content-security-policy] into csp-rule
			(host/header/Content-Security-Policy: copy csp-parser/string)
			(debug ["CONF: csp" mold csp-parser/string])
		]
	]
(probe host/scheme)
	(set-certs form host-name)
;	(put hosts form host-name host)
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

load*: :system/words/load

load: func [
	conf [block! file!]
	/local value target
][
	if file? conf [conf: load* conf]
	unless parse conf [some rule] [
		do make error! "Error in configuration file"
	]
]
