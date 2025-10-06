Red[]

parse-ll: func [dir][
	out: copy []
	fileinfo!: context [
		name: none
		size: none
		date: none
		type: none
	]
	call/wait/output rejoin ["ls -la " dir] out: copy {}
	dir-files: split out newline
	foreach file dir-files [
		data: split file space
		fileinfo: make fileinfo! [
			type: switch first first data [#"-" ['file] #"d" ['directory] #"l" ['link]]
			name: data/9
		]
		if fileinfo/type = 'file [fileinfo/size: data/5]
		append out fileinfo
	]
	out
]
