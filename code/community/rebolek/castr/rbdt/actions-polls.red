Red []

polls: none

filename: %polls.data

load-polls: func [] [
	polls: either exists? filename [load filename] [make map! 100]
]

save-polls: func [] [
	save filename polls
]

make-id: func [] [enbase/base checksum mold now/precise 'sha1 16]

; -- API

make-poll: func [
	name
	question
	author
	/local id
] [
	id: make-id
	put polls id compose/deep [
		author: (author)
		name: (name)
		question: (question)
		created: (now/precise)
		options: [(make block! 0)]
		votes: [(make block! 0)]
		voted: [(make block! 0)]
		results: [(make block! 0)]
	]
	save-polls
	id
]

add-option: func [
	id
	text [string! block!] "Option or block of options"
	/local poll count
] [
	unless poll: select polls id [return none]
	append poll/options text
	append/dup poll/results 0 either block? text [length? text] [1]
	save-polls
	length? poll/options
]

make-vote: func [
	id [string!]
	user [string! email!]
	option [integer!]
	/local poll vote
] [
	; does poll exist?
	unless poll: select polls id [return none]
	; is the option legal?
	if any [
		option < 1
		option > length? poll/options
	] [return make error! "Invalid option"]
	; has user voted already?
	if find poll/voted user [return make error! "User already voted"]
	; everything is fine, add new vote
	append/only poll/votes reduce [
		user
		now/precise
		option
	]
	append poll/voted user
	poll/results/:option: poll/results/:option + 1
	save-polls
	return true
]

list-polls: func [
	/local result id poll
] [
	probe collect [
		foreach [id poll] polls [
			keep reduce [id poll/name poll/question poll/author poll/created]
		]
	]
]

load-polls

