Red [
	To-Do: [
		"`select polls id` must check if poll exists"
	]
]

name polls
include %actions-polls.red
extern reply
import match-token from users

make-poll: [
	'make-poll
	set token string!
	set name string!
	set question string!
	(
		reply: either user: match-token token [
			make-poll name question user
		] [
			make error! "You are not logged in"
		]
	)
]

add-option: [
	'add-option
	set token string!
	set id string!
	set name string!
	(
		reply: either user: match-token token [
			add-option id name
		] [
			make error! "You are not logged in"
		]
	)
]

list-polls: [
	'list-polls
	(reply: list-polls)
]

get-poll: [
	'get-poll
	set id string!
	(
		poll: select polls id
		reply: reduce [
			'name poll/name
			'question poll/question
			'author poll/author
			'created poll/created
			'options poll/options
			'results poll/results
		]
	)
]

make-vote: [
	'make-vote
	set token string!
	set id string!
	set option integer!
	(
		reply: either user: match-token token [
			make-vote id user option
		] [
			make error! "You are not logged in"
		]
	)
]
