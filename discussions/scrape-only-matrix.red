#!/bin/red

Red []

;; red/help json output is 5.5GB because of all the json spam... red/red is 7GB
;; so the only viable option is to compress all the stuff and decompress as a stream

home: to-red-file get-env 'HOME
here: clean-path %.
call/shell/output home/dataset/list-joined-matrix-rooms joined: {}
print ["Already joined rooms:" joined]

lines: read/lines %matrix-rooms
rooms: make map! collect [
	foreach line lines [
		parse line [copy alias to #"^-" skip copy room to ["^-" | " " | end] opt skip copy comment to end]
		if empty? comment [keep alias keep room]
	]
]
print ["Known rooms:" mold rooms]

skip-existing?: yes
write %matrix.log {}
foreach [alias room] rooms [
	parse alias [copy dir to ":"]
	replace/all dir #"/" #"_"
	unless find joined room [
		print ["Joining" alias "..."]
		code: call/shell/output/error rejoin [to-local-file home/dataset/join-matrix-room" '"room"'"] out: clear {} err: clear {}
		write/append %matrix.log err
		write/append %matrix.log out
		if code <> 0 [
			print ["ERROR joining" alias]
			write/append %matrix.log rejoin ["ERROR joining "alias"^/"]
		]
	]
	xzfile: rejoin [here/matrix.org/:dir".json.xz"]
	mdfile: rejoin [here/matrix.org/:dir".md"]
	unless any [exists? mdfile not skip-existing?] [
		unless all [skip-existing?  exists? xzfile] [
			print ["Scraping" alias "..."]
			cmd: rejoin [""to-local-file home/dataset/scrape-matrix-room" '"room"' '"xzfile"'"]
			print ["Command:" cmd]
			code: call/shell/output/error cmd out: clear {} err: clear {}
			write/append %matrix.log err
			write/append %matrix.log out
			if code <> 0 [
				print ["ERROR loading" alias]
				write/append %matrix.log rejoin ["ERROR loading "alias"^/"]
			]
			wait 1					;-- prevent ban
		]
		print ["Converting" alias "..."]
		cmd: rejoin ["xz -d -k -c '"to-local-file xzfile"' | red "to-local-file home/dataset/discussions/matrix2md.red" '"alias"' '"room"' '"to-local-file mdfile"'"]
		print ["Command:" cmd]
		code: call/shell/output/error cmd out: clear {} err: clear {}
		write/append %matrix.log err
		write/append %matrix.log out
		if any [code <> 0 find out "*** "] [
			print ["ERROR converting" alias]
			write/append %matrix.log rejoin ["ERROR converting "alias"^/"]
		]
	]
]
print "Done."