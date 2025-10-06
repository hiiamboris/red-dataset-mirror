Red[
	Title: "Transform"
	Author: "Boleslav Březovský"
	Purpose: "Translate received JSON object to Red function call"
	Notes: {
Maps received JSON object into Red function call.
Finds matching sequence of required keys and calls related function with keys'
values as arguments.
}
	Usage: [
		request-type:
			{It's desirable to have request-type support directly in mapping.
			We use `set-word!` for that:}
			[
				POST: user pass [login user pass]
				GET: user		[get-info user]
			]
			{`set-word!! could work for all subsequent mappings:}
			[
				GET:
					user		[get-info user]
				POST:
					user pass	[login user pass]
					user msg	[send-message user msg]
			]
			{It's possible to use more than one `set-word!` for an action:}
			[
				GET: POST:
					user pass	[login user pass]
			]
			{TRANSFORM can server multiple URIs also (REQUEST_URI from header)
			path [file!] MUST precede method [set-word!]}
			[
				%/user POST:
					user pass	[make-user user pass]
				%/token POST:
					user pass	[login user pass]
			]
			{It's possible to set custom code snippets that can be used e.g.
			for authentication checking. The format is [set-word! block!]
			before mappings for setting the snippet and [get-word!] before action
			when the check is required:}
			[
				authentication: [
					unless user: match-token select request 'token [
						send-response #[error: "Not logged in"]
					]
				]
				%/list POST: name :authentication [list name]
			]
	]
	To-Do: [
		{Support checking for value:}
		[
			POST:
			action = list name [list name] ; needs deciding on value type
		]
	]
]

tests: [
	[
		mapping: [
			auth: [check-auth]
			%/test POST:
			#none					[list]
			state					:auth [list/only state]
			location				:auth [list/codes location]
			state location			:auth [list/only/codes state location]
			scraper					[list/with scraper]
			scraper state			[list/only/with state scraper]
			scraper location		[list/codes/with location scraper]
			scraper state location	[list/only/codes/with state location scraper]
		]
		method: 'POST
		request-uri: %/test
		request: #[state: "CA" location: "Los Angeles"]

		equal?
			transform mapping request
			list/only/codes "CA" "Los" "Angleles"
	][
		mapping: [
			user pass [login user pass]
		]
	]
]

transform: func [
	"Map JSON request to a function call. Return NONE on no match"
	mapping [block!]
	request [string! map!] "JSON object or converted map!"
	/local
		;key keys value break? match? word words block blocks
		;action uri methods match-method match-action match-uri
][
	unless map? request [request: load-json request]
	keys: sort keys-of request
	all-words: unique parse mapping [
		collect [some [#none | keep word! | skip]]
	]
	remove-each key keys [not find all-words key]
	methods: [GET]
	uri: none
	break?: false
	match?: false
	blocks: copy []
	match-action: [
		(words: clear [])
		(block: none)
		[
			some [set word word! (append words word)]
		|	issue!
		]
		opt [set block get-word!]
		set action block!
		(if block [insert action select blocks block])
		(break?: match? and equal? sort words keys)
	]
	match-method: [
		ahead set-word!
		(clear methods)
		copy methods some set-word!
		(match?: match? and not not find methods method)
	]
	match-uri: [
		set uri file!
		(break?: false)
		(match?: equal? uri request-uri)
	]
	match-blocks: [
		any [
			copy block [set-word! block!]
			(append blocks block)
		]
	]
	parse mapping [
		match-blocks
		some [
			match-uri
			some [
				match-method
				some [
					if (break?) to end
				|	match-action
				]
			 ]
		]
	]
	unless break? [return none]
	foreach key keys [replace/all action key request/:key]
;	if all [match? find methods method][action]
	action
]
