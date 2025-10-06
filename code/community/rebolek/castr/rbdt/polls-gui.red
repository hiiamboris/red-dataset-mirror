Red [
	Needs: View
]


do [

#include %rs-client.red

; -- values

active-poll: none
token: none
poll-created?: false

servers: [
	"localhost"	rbdt://127.0.0.1
	"rblk IP"	rbdt://138.201.158.76
	"rblk.eu"	rbdt://rblk.eu
]
server: servers/2

; -- support funcs

send-request: func [data /local port response] [
	port: open probe server
	insert port data
	wait port
	response: copy port
	close port
	response
]

show-polls: func [
	token
] [
	data-polls: send-request 'list-polls
	polls-list/data: collect [
		foreach [id name question author created] data-polls [
			keep name
		]
	]
]

send-vote: does [
	vote: none
	repeat i length? lay-options/pane [
		if lay-options/pane/:i/data [
			vote: i
			break
		]
	]
	either vote [
		either error? reply: send-request reduce [
			'make-vote token active-poll vote
		] [
			text-status/text: reply/arg1
			show text-status
		] [
			lay-options: render-poll send-request reduce ['get-poll active-poll]
			panel-options/pane: lay-options/pane
			text-status/text: "Vote received"
			show poll-panel
		]
	] [
		text-status/text: "No option selected"
	]
]

add-option: does [
	unless poll-created? [
		either all [
			not empty? text-name/text
			not empty? text-question/text
		] [
			active-poll: send-request reduce [
				'make-poll
				token
				text-name/text
				text-question/text
			]
			poll-created?: true
			show-polls token
		] [
			text-status/text: "Poll is missing name and/or question"
			exit
		]
	]
	either empty? option: text-option/text [
		text-status/text: "Option is missing"
		exit
	] [
		if find poll-options option [
			text-status/text: "Option is already present"
			exit
		]
		append poll-options copy option
		send-request reduce [
			'add-option
			token
			active-poll
			option
		]
		panel-options/pane: layout/tight/only collect [
			keep 'below
			foreach option poll-options [
				keep reduce [
					'text option
				]
			]
		]
		show panel-options
	]
]

select-poll: func [face] [
	active-poll: first back find data-polls pick polls-list/data face/selected
	poll-created?: true
	poll: send-request reduce ['get-poll active-poll]
	poll-options: poll/options
	text-name/text: poll/name
	text-question/text: poll/question
	text-author/text: rejoin [
		"" poll/author " on "
		poll/created/date ", "
		poll/created/hour #":" next form 100 + poll/created/minute
	]
	lay-options: render-poll poll
	panel-options/pane: lay-options/pane
	show poll-panel
]

render-poll: func [poll] [
	layout/tight collect [
		repeat index length? poll/options [
			keep compose/deep [
				(opt-name: to set-word! rejoin ["opt-" index])
				check 350
				(rejoin [#"[" poll/results/:index "] " poll/options/:index])
				[
					repeat i length? face/parent/pane [
						unless i = (index) [
							face/parent/pane/:i/data: off
						]
					]
				]
				return
			]
		]
	]
]

make-new-poll: does [
	poll-created?: false
	poll-options: make block! 10
	poll-panel/pane: layout/tight/only [
		h5 150 "Name:" text-name: field 400 focus
		return
		h5 150 "Question:" text-question: area 400x100
		return
		h5 150 "Option:" text-option: field 400
		return
		button "Add option" [add-option]
		button "Close editor" [
			show-main-view
			show main-panel
		]
		return
		panel-options: panel 400x300
	]
	show poll-panel
]

show-main-view: does [
	main-panel/pane: list-panel/pane
	main-panel/size: 950x650
	main-view/size: 1000x750
	poll-panel/pane: poll-info-panel/pane
	show main-view
	show-polls token: reply/value
]

; -- layouts

login-panel: layout/tight [
	h4 "Login/signup"
	return
	h5 "Server" 100 server-list: drop-list 300 data ["localhost" "rblk IP" "rblk.eu"] [
print "ekšn"
		server: probe pick servers probe face/selected * 2
	]
	return
	h5 "Name" 100 name-field: field 300
	return
	h5 "Pass" 100 pass-field: field 300
	return
	button "Login" [
		"login reply"
		either error? reply: send-request reduce [
			'signin name-field/text pass-field/text
		] [
			reply-line/text: reply/arg1
			show reply-line
		] [
			show-main-view
		]
	]
	button "Signup" [
		"signup reply"
		either error? reply: send-request reduce [
			'signup name-field/text pass-field/text
		] [
			reply-line/text: reply/arg1
			show reply-line
		] [
			show-polls token: reply/value
		]
	]
	button "Ping" [
		reply-line/text: mold send-request 'ping
		show reply-line
	]
	return
	reply-line: h5 400 ""
]

poll-info-panel: layout/tight [
	h5 150 "Name:" text-name: h5 400 ""
	return
	h5 150 "Question:" text-question: text 400x100 ""
	return
	h5 150 "Author:" text-author: text 400x50 ""
	return
	h5 150 "Options:" panel-options: panel 400x250
	return
	button "Send vote" [send-vote]
]

list-panel: layout/tight [
	button "Make new poll" [make-new-poll]
	return
	polls-list: text-list 300x500 [select-poll face]
	poll-panel: panel 600x550 [
	]
	return
	h5 "Status"
	text-status: text 400
]
main-view: layout [
	h1 "PollApp"
	return
	main-panel: panel
]

; -- initialization

main-panel/pane: login-panel/pane
main-panel/size: login-panel/size
main-view/size: login-panel/size + 50x150
server-list/selected: 2


view/flags main-view [resize]


]
