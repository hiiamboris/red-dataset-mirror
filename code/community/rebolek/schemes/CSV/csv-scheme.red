Red[
	Notes: [
		big-data: http://databank.worldbank.org/data/download/WDI_csv.zip
		loading-times: [
			buffer-size	time
			1 kB		4:30
			100 kB		1:30
			500 kB		1:20
			1 MB		1:20
			10 MB		1:25
		]
	]
	To-Do: [
		{
There is a possible problem with file scanning when record length is bigger
than buffer size. In such case multiple rest-buffers needs to be inserted
to the current buffer and that’s not handled yet.
		}
	]
]

csv-proto: context [

	path: none
	records: none ; block of indexes where each record start (linebreaks)
	file-index: 0 ; index in file (it’s offset actually)
	index: 1 ; record index
	rest: "" ; what’s left from the last buffer

	quotes: #"^""

	collect-records: func [
		buffer
;		/local mark collected
	] [
		collected: 0
		insert buffer rest
		parse buffer [
			some [
				mark: newline (
					append records file-index + (index? mark) - length? rest
					collected: collected + 1
				)
				mark:
			|	mark: quotes [
					some [
						quotes quotes
					|	quotes break
					|	skip
					]
				]
			|	skip
			]
		]
;		print [#REST mold mark]
		rest: mark
	]

	#NOTE "`until` based version for speed comparison"

	_collect-records: func [
		buffer
		/local mark chars
	] [
		chars: charset "^"^/"
		insert buffer rest
		until [
			mark: find buffer chars
			buffer: either mark [mark] [mark: tail buffer]
			case [
				buffer/1 = LF [
					mark: next buffer
					append records file-index + (index? buffer) - length? rest
				]
				buffer/1 = quotes [
					mark: buffer
					until [
						buffer: next find buffer quotes
						buffer/1 <> quotes
					]
					buffer: back buffer
				]
			]
			buffer: next buffer
;			if zero? (index? buffer) / 1000 [print index? buffer]
;			print index? buffer
			tail? buffer
		]
		rest: mark
	]

	scan-file: func [
		path
		/local size buffer
	] [
		print #scan-file
		file-index: 0
		size: 1024 * 512
		total-size: probe size? path
		records: copy [0] #TODO "move to INIT fc"
		until [
			buffer: read/binary/seek/part path file-index size
			collect-records buffer
			file-index: probe file-index + size
			file-index > total-size
		]
		probe records
	]

	skip-records: func [offset] [
		index: index + offset
		if index < 1 [index: 1]
		if index > length? records [index: length? records]
	]

	get-records: func [
		size
		/local i idx result
	] [
		size: any [size (length? records) - index + 1]
		result: make block! size
		repeat i size [
			idx: probe i + index - 1
			start: records/:idx
			length: either i = length? records [
				(size? path) - last records
			] [
				records/(idx + 1) - start
			]
			print [idx start length]
			append/only result load-record to string! read/binary/seek/part path start length
		]
		result
	]

	delimiter: #","
	quote-char: quotes
	line: make block! 20
	value: ""

	quotchars: charset reduce ['not quote-char]
	valchars: charset reduce ['not append copy "^/^M" delimiter]
	quoted-value: [
		(clear value) [
			quote-char
			any [
				[
					set char quotchars
				|	quote-char quote-char (char: quote-char)
				]
				(append value char)
			]
			quote-char
		]
	]
	normal-value: [copy value any valchars]
	single-value: [quoted-value | normal-value]
	add-value: quote (
		value: system/words/trim value
		all [
			quote-char = first value
			quote-char = last value
			take value
			take/last value
		]
		append line copy value
	)
	values: [any [single-value delimiter add-value] single-value add-value opt CR]

	load-record: func [
		record
		/local result value
	] [
		clear line
		parse record values
		copy line
	]

	scheme: context [
		open: func [port] [
			print ["++ open called" port/spec]
#FIXME {
NEXT is used here so I can use relative path.
As I am working in sandbox, I can’t use absolute path
I may support csv://data/file.csv for relative
and csv:///data/file.csv but that would need some additional code
}
			path: probe next rejoin [port/spec/path port/spec/target]
#TODO "Check if the file exists"
			scan-file path
		]

		copy: func [port /part size] [
			print ["++ copy called" part size]
			get-records size
		]

		insert: func [port data] [
			print ["++ insert called" ">>" mold data "<<"]
		]

		skip: func [port offset] [
			print ["++ skip called" offset]
			skip-records offset
			port
		]

		close: func [port] [
			print "++ close called"
		]

		read: func [port] [
			print "++ read called"
		]

		write: func [port data] [
			print "++ write called"
		]
	]
]


register-scheme make system/standard/scheme [
	name: 'CSV
	title: "CSV scheme"
	actor: csv-proto/scheme
]

test1: [
	port: open csv:///data/WDISeries-Time.csv
	port: skip port 10
	data: probe copy/part port 1
]

do test1
