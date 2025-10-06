Red[
	Title: "HUB - header module"
	Author: "Boleslav Březovský"
	To-Do: [
	]
]


mark: none
parsed?: false

make-rule: func [
	name
	/token	"Grab token (uses token* rule)"
	/number "Grab number"
	/date	"Grab HTTP-Date"
	/load	"load value before storing"
	/grab	"Use only with /WITH - prepend rule with [copy value]"
	/with
		rule
] [
	compose [
		(rejoin [name #":"]) ws
		(
			case bind [
				token  [[get-token]]
				number [[get-number]]
				grab   [reduce ['copy 'value rule]]
				with   [reduce [rule]]
				load   [[get-value (value: system/words/load value)]]
				date   [[http-date*]]
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
			; NOTE: WS is there to properly parse invalid headers
			;			like %tests/header-08, which instead of
			;			"en-US" uses "en US"
			'copy 'value 'some [token* | "*" | ws] to paren! reduce [
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
			to set-word! 'zz ; DEBUG
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
	; print [#SH to string! key "::" to string! value]
	if binary? key [key: load key]
	if binary? value [
		value: to string! value
		if all [
			not only
			not find value #";"
		] [try [value: load value]]
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
alpha:      charset [#"a" - #"z" #"A" - #"Z"]
digit:      charset "0123456789"
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
http-date*:         [copy value to crlf (value: parse-rfc5322-date to string! value)]
product*:           [copy value [token* opt [slash token*]]]
cchar:        union TEXT charset [not "()"]
ctext*:  complement cchar
ctext*: charset [not "()"]

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
	fail?: false
)

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

accept-ranges*: make-rule/grab/with 'Accept-Ranges ["bytes" | "none" | token*]

age*: make-rule/number 'Age

allow-methods: [
	"OPTIONS" | "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "TRACE"
|	"CONNECT" | token*
]

allow*: [
	"Allow:" ws
	(value: clear [])
	copy key allow-methods
	(append value make-word key)
	any [
		comma ws*
		copy key allow-methods
		(append value make-word key)
	]
	(set-header 'Allow value)
]

; TODO: decode properly (basic, Bearer, etc...)
authorization*: make-rule 'Authorization

cache-request-directive*: [
	cache-request*
	any [
		comma ws*
		cache-request*
	]
]
cache-request*: [
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
	cache-response*
	any [
		comma ws*
		cache-response*
	]
]
cache-response*: [
	copy value [
		"public" | "no-store" | "no-transform"
	|	"must-revalidate" | "proxy-revalidate"
	]
	append-value
|	copy value ["private" | "no-cache"]
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
	cache-directive*
]
cache-directive*: none

connection*: make-rule/token 'Connection
content-encoding*: make-rule/token 'Content-Encoding

language-tag*: [1 8 alpha any [#"-" 1 8 alpha]]
content-language*: [
	"Content-Language:" ws
	copy value [language-tag* any [#"," language-tag*]]
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
retry-after*: make-rule/with 'Retry-After [http-date* | get-number]

server*: [
	"Server:" ws
	(header/Server: clear [])
	some [copy value [product* | comment* | ws] (append header/Server to string! value)]
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
	"Vary:" ws
	(set-target 'Vary)
	[
		#"*" (append target '*)
	|	some [get-token append-value any [#"," ws* get-token append-value]]
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
;	(print ["++OTHER-HEADER" to string! key])
	copy value to crlf
	(set-header key value)
]

key*: [copy key to eq skip]

content-type?: func [] [
	all [
		header/Content-Type
		header/Content-Type/1
	]
]

; -- COOKIES

cookies: none
cname: none
cdata: none

cookie-char: difference TEXT charset ";"
cookie-text: [some cookie-char]
non-zero-digit: charset "123456789"

set-cookie-header: [
	"Set-Cookie:" SP
	(cdata: make block! 10)
	[
		set-cookie-string
	|	copy cdata to crlf
	]
	(put cookies cname cdata)
]
set-cookie-string: [cookie-pair any [#";" opt SP cookie-av] opt #";"] ; the last semicolon is not in spec but sometimes can be present
cookie-pair:       [cookie-name #"=" cookie-value]
cookie-name:       [get-token (cname: make-word value)]
cookie-value:      [
	opt dq
	copy value [any cookie-octet]
	opt dq
	(append cdata to string! value)
]
cookie-octet: charset [
	#"^(21)"
	#"^(23)" - #"^(2B)"
	#"^(2D)" - #"^(3A)"
	#"^(3C)" - #"^(5D)"
	#"^(5D)" - #"^(7E)"
]
cookie-av:         [
	expires-av | max-age-av | domain-av | path-av | secure-av | httponly-av
|	samesite-av | extension-av
]
expires-av:        [
	[#"E" | #"e"] "xpires="
	copy value sane-cookie-date
	(append cdata compose [Expires: (parse-rfc5322-date to string! value)])
]
sane-cookie-date: [to [#";" | crlf]] ; is this sane?
max-age-av:        [
	[#"M" | #"m"] "ax-" [#"A" | #"a"] "ge="
	copy value [non-zero-digit any digit]
	(append cdata compose [Max-Age: (load value)])
]
domain-av:         [
	[#"D" | #"d"] "omain="
	copy value token*
	(append cdata compose [Domain: (to string! value)])
]
path-av:           [
	[#"P" | #"p"] "ath="
	copy value cookie-text
	(append cdata compose [Path: (to file! value)])
]
secure-av:         [[#"S" | #"s"] "ecure" (append cdata 'Secure)]
httponly-av:       [[#"H" | #"h"] "ttp" [#"O" | #"o"] "nly" (append cdata 'HttpOnly)]
extension-av:      [copy value cookie-text (append cdata to string! value)] ; NOTE: to word! ?
samesite-av:       [
	"SameSite="
	copy value samesite-value
	(append cdata compose [SameSite: (make-word value)])
|	"SameSite" (append cdata [SameSite: Lax])
]
samesite-value:    [
	[#"S" | #"s"] "trict"
|	[#"L" | #"l"] "ax"
|	[#"N" | #"n"] "one"
]

cookie*: set-cookie-header

; --  CONTENT SECURITY POLICY

csp-data: none
csp-dirdata: none
csp-dirchar: union charset #"-" union alpha digit
csp-dirname: [some csp-dirchar]
csp-valchar: charset [not " ;^M^/"]
csp-value: [
	copy value [some csp-valchar]
	(append csp-dirdata to string! value)
]
csp-dir: [
	copy csp-name csp-dirname
	[
		ahead [#";" | crlf] (append csp-data make-word csp-name)
	|	(csp-dirdata: make block! 20)
		ws*
		csp-value
		any [SP csp-value]
		(repend csp-data [make-word csp-name csp-dirdata])
	]
]
csp*: [
	"Content-Security-Policy:" ws
	(csp-data: make block! 20)
	csp-dir
	any [#";" ws* csp-dir cl:]
	opt #";"
	(put header 'Content-Security-Policy csp-data)
]

header-rule: [
	[
		accept*
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
	|	csp*

	|	other-header*
	]
	crlf ; common line end for all rules
	mark:
]

rule*: [
	init
	some header-rule
	mark:
	(parsed?: true)
]

parse-header: func [
	type "request or response"
	data
	target
	cookie-target
	/local key value uri supported? accepts
] [
	parsed?: false
	header: target
	cookies: cookie-target
	; TODO error checking
	cache-directive*: switch type [
		request  cache-request-directive*
		response cache-response-directive*
	]
	unless data [return none]
	parse data rule*
	mark
]

