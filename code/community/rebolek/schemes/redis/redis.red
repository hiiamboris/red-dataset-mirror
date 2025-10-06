Red[]

parse-server-info: function [
	"Parse return of INFO command"
	data
][
	obj: make map! []
	section: word: value: none
	body: copy []
;	chars: charset [#"a" - #"z" #"A" - #"Z" #"_" #"=" #"," #"." #"-" #" "]
	chars: charset [#"a" - #"z" #"A" - #"Z" "_=,.- /"]
	digit: charset [#"0" - #"9"]
	alphanum: union chars digit
	hexa: union digit charset "abcdef"
	dot: #"."
	minus: #"-"
	units: charset "BKMG"
	parse to string! data [
		some [
			"# " copy section to crlf 2 skip (body: copy [])
			any [
				copy word some alphanum #":" (type: string!)
				copy value [
					some digit dot some digit dot some digit ahead crlf (type: tuple!)
				|	some digit opt [dot some digit] units ahead crlf (type: 'number)
				|	some digit opt [dot some digit] #"%" ahead crlf (type: percent!)
				|	some digit dot some digit ahead crlf (type: float!)
				|	opt minus some digit ahead crlf (type: integer!)
				|	#"/" some alphanum ahead crlf(type: file!)
				|	some alphanum ahead crlf
				|	ahead crlf
				] (
					; NOTE: cannot `to percent! "100.00%"`, so special handling
					if percent! = type [value: load value]
					if equal? type 'number [
						value: (switch take/last value [
							#"B" [1]
							#"K" [1'000]
							#"M" [1'000'000]
							#"G" [1'000'000'000]
						]) * to float! value
						type: integer!
					]
					attempt [value: to :type value]
				)
				crlf (repend body [to set-word! word value])
			] (
				put obj to set-word! section make map! body
			)
			crlf
		]
	]
	obj
]

context [

	commands:
	request:
	response:
	output:
	name:
	value:
	timeout:
		none

	cmd-server: [
		'time
		(value: take/part data 2)
		(value/1: to date! to integer! value/1)
		(value/2: to integer! value/2)
		(append/only output value)
	|	'info
		(append/only output parse-server-info take data)
	]
	cmd-keys: [
		'set
		(append/only output value)
	]

	parse-response: func [][
		data: response/data
		output: copy []
		parse commands [
			some [
				cmd-server
			]
		]
		output
	]

	server: [
		'time
		(append commands 'time)
		(append/only request [time])
	|	'info (value: none) opt [
			set value [
				'server | 'clients | 'memory | 'persistence | 'stats
			| 'replication | 'cpu | 'commandstats | 'cluster | 'modules
			| 'keyspace | 'modules | 'all | 'default | 'everything
			]
		]
		(append commands 'info)
		(command: copy [info])
		(if probe value [append command value])
		(append/only request command)
	]

	keys: [
		'set
		(timeout: none)
		(existence: none)
		(ttl?: false)
		set name skip ; [any-string! | any-word!]
		set value skip
		any [
			set timeout number!
		|	'not 'exists (existence: false)
		|	'exists (existence: true)
		|	'keep 'ttl ()
		](
			append commands 'set
			switch/default type?/word value [
				map! [
					command: reduce ['hmset name]
					foreach [key val] value [
						repend command [key val]
					]
					case [
						integer? timeout [
							repend/only request ['expire name timeout]
							append commands 'expire
						]
						float? timeout [
							repend/only request ['pexpire name timeout]
							append commands 'pexpire
						]
					]
				]
			][
				command: copy [set]
				case [
					integer? timeout	[repend command ['ex timeout]]
					float? timeout [
						repend command ['px to integer! 1'000'000 * timeout]
					]
					existence = false	[append command 'xx]
					existence = true	[append command 'nx]
					ttl?				[append command 'keepttl]
				]
				append/only request command
			]
		)

	]

	set 'diared func [data][
		commands: copy []
		request: copy []
		parse data [
			some [
				server
			|	keys
			]
		]
		response: send-cmd probe request
		parse-response
	]

]
