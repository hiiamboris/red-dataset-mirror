Red[]


types: []

#cache-structure [filename ["hash of [mold sort read dir"] "hash of generated lest page"]

dirs-cache-file: paths/cache/files.red
dirs-cache: either exists? dirs-cache-file [load dirs-cache-file] [make block! 20]
store-cache: func [] [
	save dirs-cache-file dirs-cache
]

pages: none

load-pages: has [pages-file] [
	#TODO "Move the path to the top level (config or so)"
	pages-file: %../templates/pages.red
	pages: either exists? pages-file [make map! load pages-file] [#[]]
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

serve-status: func [status [integer!]] [
	response/status: status
	response/header/Content-Type: 'text/html
	log reduce [status select status-code status]
	status-page: load-page/status to file! status
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

; TODO: Rename to something like list-dir-internal
list-dir: func [files /local time file data] [
	time: now/time/precise
	collect/into [
		keep reduce [
			'h1 rejoin ["Listing of directory " request/uri]
			'hr
			'ul
		]
		foreach file files [
			keep reduce [
				'li 'link rejoin [request/uri slash file] form file
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
	lest/page/hash data
]

list-directory: func [
	/local path file files data default hash page-hash hashes] [
	path: request/path
	unless dir? path [path: dirize path]
	default: host/default-file
	foreach file default [
		if exists? file: rejoin [path file] [
			request/path: file
			return get-file
		]
	]
	response/status: 200
	response/header/Content-Type: 'text/html

	files: sort read path
	hash: checksum mold files 'SHA256
	hashes: select dirs-cache path
	either all [block? hashes equal? hash first hashes] [
		; we have a cache
		data: lest/cache second hashes
	] [
		set [data page-hash] list-dir files
		put dirs-cache path reduce [hash page-hash] ; update hash
		store-cache
	]
	data
]

get-file: func [/local file data hash type action dir][

	file: request/path
	debug ["get-file" mold file]
	data: read/binary file
	hash: checksum data 'sha256
	response/status: 200
	response/header/Content-Type: type: first get-mime-type file
	if action: select/only types type [data: do bind action 'file]
	log reduce ['get-file file type]
	data
]
