#!/bin/red

Red []

if 3 <> length? system/options/args [
	print "Syntax: cat <json> | red matrix2md.red <room-alias> <room-id> <out-file>"
	quit
]

set [room-alias: room-id: md-file:] system/options/args
md-file: to-red-file md-file

emit: func [msg] [write/append md-file rejoin [msg "^/^/"]]

mxc2https: function [url [url!] /local domain id] [
	parse url [thru "://" copy domain to #"/" #"/" copy id to end]
	homeserver: select #[
		"gitter.im"	https://gitter.ems.host
		"matrix.org" https://matrix-client.matrix.org
		"tchncs.de" https://tchncs.de
	] as string! domain
	unless homeserver [
		homeserver: rejoin [https:// domain]
		print ["Unknown domain:" domain ", defaulting to" homeserver]
	]
	homeserver/_matrix/media/v3/download/:domain/:id
]

today:  1900/1/1
server: https://app.gitter.im/#/room/

print ["Archiving room" room-alias "..."]
write md-file {}								;-- empty the file
emit rejoin ["# Archived messages from: "server/:room-alias" ("server/:room-id")"]

offset: 0

rem: #{}
buf: make #{} buf-size: 16384				;-- read-stdin somehow doesn't read more than 64k bytes
bin: make #{} buf-size * buf-pages: 1024	;-- but buffer should be big enough to cover the biggest possible json-formatted message
while [
	clear bin
	loop buf-pages [
		read-stdin clear buf buf-size
		append bin buf
	]
	not empty? bin
][
	unless empty? rem [insert bin rem  clear rem]
	trail: find/last bin #{0A}
	insert rem next trail
	lines: split to string! copy/part bin trail #"^/"
	foreach line lines [
		if empty? line [continue]
		event: load-json line
		;; 99% of the log is trash, we're only interested in the entries with /source/type = "m.room.message"
		;; there may be "m.room.encrypted" but those are not supported
		if event/source/type <> "m.room.message" [continue]
		content: event/source/content
		date: transcode/one replace event/event_datetime #" " #"/"
		if today <> date/date [
			today: date/date
			emit rejoin ["## "today]
		]
		time: date/time
		nick: event/sender_nick
		id:   rejoin ["#" next event/source/event_id]		;-- skip "$"
		switch/default content/msgtype [
			"m.text" [
				text: content/body
			]
			"m.image" [
				url: mxc2https as url! content/url
				alt: either alt: content/info/thumbnail_url [mxc2https as url! alt][""]
				text: rejoin ["!["alt"]("url")"]
			]
			"m.audio" [
				url: mxc2https as url! content/url
				alt: content/body
				text: rejoin ["["alt"]("url")"]
			]
			;@@ TODO: m.file, m.video
		] [print ["Ignoring message with msgtype =" content/msgtype] continue]
		emit rejoin ["["time"]("id") <"nick">:^/"text]
	]
]

 