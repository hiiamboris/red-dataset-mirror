#!/usr/local/bin/red
Red[]

build-path: to file! get-env "RBP_BUILD"
target-path: to file! get-env "RBP_TARGET"
web-path: to file! get-env "RBP_WEB" ; %/var/www/rebolek.com/htdocs/builder.html

get-release-date: func [
	filename
	/local part parts number
][
	parts: split filename charset ".-"
	foreach part parts [if integer? try [number: load form part][return part]]
]

link?: func [
	filename
;	/local ret
][
	call/shell/output rejoin [{if [[ -L "} filename {" ]]; then echo "true"; else echo "false"; fi}] ret: copy ""
	print [filename ret]
	get load ret
]

make-build-index: func [
][
	index: load %builds.red
	builds: copy []
	foreach build words-of index [
		
	]
]

make-index: func [
;	/local template output line builds-path builds releases date link
][
;	template: read %/home/sony/Code/build/index.template
	template: read build-path/index.template
	output: clear {}
; read list of all builds and remove superfluous files
	builds: read dirize build-path
	remove-each file builds [find file %libRed]
; get list of release dates and platforms
	releases: #()
	links: #()
	foreach file builds [
		date: get-release-date file
; we will mark link with *, it will be removed later when building page
;		if link? rejoin [builds-path file][append file #"*"]
		if link? build-path/file [append file #"*"]
		either find words-of releases date [
			append releases/:date file
		][
			releases/:date: reduce [file]
		]
	]
; build table
	foreach release sort/reverse words-of releases [
		line: copy {<div class="divTableRow">}
		foreach platform sort releases/:release [
			link: false
			if equal? #"*" last platform [
				take/last platform
				link: true
			]
			append line rejoin [
				"" 
				<div class="divTableCell"> 
				either link [<i>][<b>]
				{<a href="files/} platform {">} platform </a> 
				either link [</i>][</b>]
				</div>
			]
		]
		append line </div>
		append output line
	]

	page: read %index.template
	replace page "<$table content$>" output
;	write %/var/www/rebolek.com/htdocs/builds/index.html page
	write web-path/builds/index.html page
]

print "-- Make index --"
make-index
