Red [
    title: "Basic HTTP(S) client"
	To-Do: [
Decopression: 	"get length: copy to crlf, convert from hex"
				"decomporess copy/part above-length"
	]
]

; -- support functions

print-string: func [data] [
	foreach char data [prin either char > 31 [to char! char]["."]]
	print ""
]

to-word: func ["Convert binary string to word" value] [to word! to string! value]

; TODO: move to %common-tools.red
get-codec: func [
	"Return codec based on MIME type"
	mime-type
	/local _ codec
] [
	foreach [_ codec] system/codecs [
		if find/only codec/mime-type mime-type [return codec]
	]
	none
]

; -- include required files

#include %common-tools.red
#include %codepage.red

; -- add missing codecs

add-codec [
	TEXT: text/plain %.txt
	decode [data /codepage cp] [
		either cp = 'UTF-8 [
			to string! data
		] [
			read-cp data cp
		]
	]
]
add-codec [HTML: text/html %.html from TEXT]

; -- set some helpers

protos: [
	sslv3	0300h
	tls1.0	0301h
	tls1.1	0302h
	tls1.2	0303h
	tls1.3	0304h
]

debug: :print
;debug: :comment

; -- default values

response!: context [
	status:
	status-string:
	encoding:
		none
	headers: #()
	cookies: #()
	data: none
]

headers!: #(
	Accept-Charset: utf-8
	Accept-Encoding: gzip
	Connection: close
)

request!: context [
	method:
	url:
	decoded-url:
	headers: none
]

; -- internal variables

request:
response:
data:
key: value:
	none

; -- parse words and rules

digit: charset "0123456789"
letter: charset [#"a" - #"z" #"A" - #"Z"]
key-name: union digit union letter charset "-"
get-key: [m: copy key some key-name]

cookie-rule: [
	"Set-Cookie: "
(print "cookie rule")
	copy key to #"=" skip
	copy value to crlf 2 skip
	; TODO: Parse details (copy from SEND-REQUEST)
	(put response/cookies to-word key to string! value)
]
date-rule: [
	copy key ["Date" | "Expires"]
	": "
(print "date rule")
	copy value to crlf 2 skip
;	(put response/headers to set-word! to string! key parse-rfc5322-date to string! value)
	(set-header to string! key parse-rfc5322-date to string! value)
;	(set-header to string! key parse-response to string! value)
]
content-encoding: [
	"Content-Encoding: "
	copy value to crlf 2 skip
	(set-header 'Content-Encoding response/encoding: to-word value)
]
transfer-encoding: [
	"Transfer-Encoding: "
	copy value ["chunked" | "compress" | "deflate" | "gzip" | "identity"]
	2 skip ; crlf
	(set-header 'Transfer-encoding to-word value)
]
ct-char: difference c1: charset [#"^(09)" #"^(20)" - #"^(7E)"] c2: charset {"():<>?@[\]{}}
ct-value: []
content-type: [
	"Content-Type: "
(print "content-type")
	(clear ct-value)
	copy value some [not #";" ct-char]
	(append ct-value to path! to string! value)
	any [
	p1:
		#";" skip copy value some ct-char
;		(append ct-value split to string! value #"=") ; TODO: turn first value to set-word!
		(value: split to string! value #"=")
		(foreach [key val] value [repend ct-value [to set-word! key val]])
	]
	crlf
;	(put response/headers quote Content-Type: ct-value)
	(set-header 'Content-Type ct-value)
]
content-length: [
	"Content-Length: "
	copy value some digit
	crlf
;	(put response/headers quote Content-Length: to integer! value)
	(set-header 'Content-Length to integer! value)
]
location: [
	"Location: "
	copy value to crlf
	crlf
	(set-header 'Location to url! value)
]

; -- support functions

set-header: func [header value] [
	put response/headers to set-word! header value
]

get-length: func [data /local length] [
	if empty? data [return 0]
	length: take/part data find data crlf
	take/part data 2 ; get rid of crlf
	length: to string! length
	if odd? length? length [insert length #"0"]
	to integer! debase/base length 16
]

decode-chunked: func [reply] [
	length: get-length reply
	until [
		reply: skip reply length
		; now there should be crlf, get rid of it
		take/part reply 2
		; get new length and repeat
		length: get-length reply
		tail? reply
	]
	reply
]

make-request: func [] [
	; TODO: support other methods
	collect/into [
		keep "GET / HTTP/1.1"
		keep crlf
		foreach [key value] headers [
			keep rejoin [
				key ": " value crlf
			]
		]
		keep crlf
	] payload: clear ""
]

init-request: func [] [
	request: make request! []
	headers: request/headers: copy headers!
]

parse-request: func [data /local value] [
	init-request
	parse data [
		set value ['GET | 'POST | 'DELETE]
		(request/method: value)
		set value url!
		(request/url: value)
		(request/decoded-url: decode-url value)
		(request/headers/Host: request/decoded-url/host)
	]
]

process-response: func [/local value] [
print "PROCESS-RESPONSE"
	response: make response! []
	parse-response
print ["Encoding:"]
	switch probe response/encoding [
		gzip [
			reply: response/data
			switch/default response/headers/Transfer-Encoding [
				chunked [decode-chunked reply]
			] [
				; NOTE: probably nothing to do
			]
			response/data: decompress response/data
		]
	]
	decode-data
; handle redirection
	switch response/status [
		301 [
			; NOTE redirection can't work because of missing DNS support
			print "** redirection **"
			value: copy response/headers/Location
			either find/match value https:// [
				change/part value tls:// 8
;				append value ":443"
			] [
				change/part value tcp:// 7
;				append value ":80"
			]
			open-url probe value
		]
	]
]

parse-response: func [] [
	parse data [
		"HTTP/1." [#"0" | #"1"] space
		copy value 3 digit space	(response/status: to integer! to string! value)
		copy value to crlf			(response/status-string: to string! value)
		crlf
		some [ p:
			cookie-rule
		|	date-rule
		|	content-encoding
		|	transfer-encoding
		|	content-type
		|	content-length
		|	location
		|	get-key #":" skip (print ["get.key" to string! key])
			copy value to crlf 2 skip
			; TODO: multiple headers with same name
			(put response/headers to set-word! to string! key to string! value)
		]
		crlf
		dt:
		copy value to end
		(response/data: value)
	]
]

decode-data: func [
	"decode data based on MIME type"
	/local type codec codepage
] [
	unless response/data [exit]
print "decode"
	type: 'text/plain
	codepage: 'UTF-8
	if block? response/headers/Content-Type [
		codepage: to word! any [
			select response/headers/Content-Type 'charset
			'UTF-8
		]
		type: first response/headers/Content-Type
	]
	codec: get-codec type
	response/data: either type/1 = 'text [
		codec/decode/codepage response/data codepage
	] [
		codec/decode response/data
	]
]

; -- main function

open-url: func [
	url [url! block!]
	/local client
] [
	unless block? url [url: compose [GET (url)]]
	parse-request url

	client: open request/url
	client/extra: compose [
	;    domain: "red-lang.org"
		accept-invalid-cert: #[true]
	;    min-protocol: (protos/tls1.1)
	;    max-protocol: (protos/tls1.3)
	]
	client/awake: func [event] [
		debug ["=== Client event:" event/type]
		port: event/port
		switch event/type [
			connect [
				data: clear #{}
				make-request
				insert port probe payload
			]
			read [
				print "** READ **"
				print type? port/data
				append data port/data
				print length? data
				copy port
			]
			wrote [
				copy port
			]
		]
		false
	]
	wait client
	close client
	process-response
	response
]

; -------------------------------------------------------------------------

;url: tls://172.217.23.238:443				; google.com (redirect)
;url: tls://138.201.158.76:443/lorem.lest	; rblk.eu
;url: tls://77.75.75.176:443					; seznam.cz
;url: tls://140.82.121.4:443						; github.com (redirect)
;url: tls://185.17.117.32:443				; idnes.cz
;url: tls://178.238.38.82:443				; irozhlas.cz
url: tls://2.23.9.219						; amazon.com
url://tls:213.188.199.36					; ws.ifelse.io

;url: tls://www.google.com

open-url url
