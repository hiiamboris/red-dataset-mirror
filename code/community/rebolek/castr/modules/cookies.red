Red[]

response: none

time: flag: flags: name: names: value:
	none
mapping: [
	secure ["Secure"]
	http-only httponly ["HttpOnly"]
	same-site samesite ["SameSite"]
]
default-flags: "; Secure; HttpOnly; SameSite=Strict"
process-flags: does [
	forall flags [
		flag: select mapping first flags
		; SameSite can have modifiers
		if flag = "SameSite" [
			either find [lax strict none] second flags [
				flag: rejoin [flag #"=" second flags]
				flags: next flags
			] [
				; default is SameSite=Lax
				flag: "SameSite=Lax"
			]
		]
		reppend value ["; " select mapping flag]
	]
]
action: quote (
	unless find names name [
	; NOTE: add each cookie only once. Maybe overwrite would be a better way?
		append names name
		value: rejoin [name #"=" value]
		if time [
			name: either date? time [
				time: to-rfc5322-date/gmt time "Expires"
			] ["Max-Age"]
			repend value ["; " name #"=" time]
		]
		case [
			; default safe behavior
			empty? flags [append value default-flags]
			; no safe defaults
			all [single? flags flags/1 = 'none] []
			'else process-flags
		]
		append response/cookies value
	]
)
rule: [
	(names: clear [])
	some [
		(time: none)
		(flags: clear [])
		set name set-word!
		set value skip
		any [
			set time [date! | integer!]
		|	set flag word! (append flags flag)
		]
		action
	]
]

set-cookies: func [
	resp
	cookies [block!]
] [
	response: resp
	response/cookies: any [response/cookies copy []]
	parse cookies rule
]


