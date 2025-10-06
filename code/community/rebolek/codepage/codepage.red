Red []

context [
	codepages: load %codepages
	codepages/2: decompress debase codepages/2

	select-codepage: func [
		"Get codepage from the binary blob"
		codepage [word!]
		/local offset size type char-size
	][
		unless codepage: find codepages/1 codepage [
			do make error! "Codepage not supported"
		]
		set [name offset type char-size] copy/part codepage 4
		size: char-size * select [full 256 upper 128] type
		page: copy/part skip codepages/2 offset size
		if type = 'upper [
			; TODO: precompute and cache
			lower: copy #{}
			repeat index 128 [
				value: to binary! index - 1
				append lower skip value 4 - char-size
			]
			insert page lower
		]
		reduce [char-size page]
	]

	set 'read-cp func [text [binary!] codepage [word!] /local output char][
		set [char-size codepage] select-codepage codepage
		output: copy {}
		foreach char text [
			append output to char! trim/head copy/part
				skip codepage char-size * to integer! char
				char-size
		]
		output
	]

	expand-codepage: func [
		"Expand codepage for faster lookup in TO-CP conversion"
		codepage [binary!]
		char-size [integer!]
		/local output index
	][
		output: copy [#{00} 0] ; NOTE: Add zero or trim/head will truncate it
		codepage: copy skip codepage char-size
		index: 1
		until [
			repend output [trim/head take/part codepage char-size index]
			index: index + 1
			empty? codepage
		]
		output
	]

	set 'to-cp func [text [string!] codepage [word!]][
		set [char-size codepage] select-codepage codepage
		output: copy #{}
		; TODO: caching of expanded codepages
		codepage: expand-codepage codepage char-size
		foreach char text [
			char: select codepage to binary! char
			unless char [char: 0]
			append output char
		]
		output
	]
]
