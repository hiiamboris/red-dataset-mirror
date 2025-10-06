Red[
	Title: "Redquire - simple Red package manager"
	Author: "Boleslav Březovský"
	Todo: [
"Versioning"
"Consistency checking"
"Circular references and other weird stuff"
	]
]

redquire!: context [
	verbose?: true
	logfile: copy []
	log: func [data][
		append self/logfile reduce [now data]
		if self/verbose? [print ["Redquire:" data]]
	]
	path: to-red-file rejoin [get-env either equal? system/platform 'Windows ["USERPROFILE"]["HOME"] %/.redquire/] ; TODO: some sane default for Windows
	list-path: https://gitlab.com/rebolek/redquire/raw/master/packages.red
	packages:  none

	init: does [
		self/log "init"
		unless exists? self/path [make-dir self/path]
		unless exists? self/path/packages [make-dir self/path/packages]
		unless self/packages [
			; TODO: refresh list
			self/load-list
		]
	]
	load-list: func [
		/update "Update list from network"
		/local list local-path
	][
		self/log rejoin ["load-list" either update ["/update"][""]]
		; If there's forced update or list does not exist yet, download if from web, otherwise from local storage
		local-path: rejoin [self/path %packages.red]
		either update: any [
			update
			not exists? local-path
		][
			list: try [read self/list-path]
			if list [write local-path list]
		][
			list: try [read local-path]
		]
		; TODO: some consistency checking
		unless list [
			; Even local list failed, there's no hope anymore
			do make error! "Cannot retrieve list of packages"
		]
		self/packages: skip load list 2 ; get rid of header
	]
	local-package: func [file][rejoin [self/path %packages/ file]]
	; NOTE: both `load` and `download` expect that list already exists. Is it safe?
	load-package: func [
		name
		/local package filename
	][
		self/log rejoin ["load-package" space name]
		package: select self/packages name
		; package does not exist, maybe we have old list?
		unless package [self/load-list/update]
		; packege still does not exist, give up all hope
		unless package [do make error! rejoin ["Package " name " does not exist."]]
		unless exists? filename: self/local-package package/file [
			download-package name
		]
		if select package 'require [
			foreach pkg package/require [self/load-package pkg]
		]
		do filename
	]
	download-package: func [
		name
		/local package filename
	][
		self/log rejoin ["download-package" space name]
		package: select self/packages name
		filename: self/local-package package/file
		either data: try [read package/source][
			write filename data
		][
			do make error! "Cannot download package"
		]
	]
	set 'redquire func [
		pkg [word! block! none!] "Package name(s)"
		/update "Force update"
		/local package
	][
		redquire!/init
		either pkg [
			pkg: append clear [] pkg
		][
			pkg: collect [foreach [name _] packages [keep name]]
		]
		foreach package pkg [
			if update [redquire!/download-package package]
			redquire!/load-package package
		]
	]

]

; TODO: APT/OPKG-like dialected function (install, remove, update, upgrade, etc)
