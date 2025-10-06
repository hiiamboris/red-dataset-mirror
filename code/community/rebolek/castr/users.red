#!/usr/local/bin/red
Red [
	Title: "Users - basic user management system"
	Author: "Boleslav Březovský"
	Date: 24-7-2020
]

#include %common-tools.red

mod-users: context [

default-config: [
	users-file: %users.data
	tokens-file: %tokens.data
]

config-file: %users.cfg

config: none

load-config: func [
	/from data [file! block! none!]
	/local file
] [
	config: case [
		all [file? data exists? data] [construct load data]
		block? data [construct data]
		'else [context default-config]
	]
	unless file [file: config-file]
	init
]

users: none
tokens: none

; -- user management --------------------------------------------------------

load-users: func [/local file][
	file: config/users-file
	users: either any [
		not exists? file
		zero? size? file
	][
		copy #[]
	][
		load file
	]
]

save-users: func [][
	save config/users-file users
]

make-user: func [
	"Returns FALSE when user exists, TOKEN when not and is created"
	name [word! string!]
	password [word! string!]
	/local user
][
	name: form name
	if select users name [return false]
	user: compose [
		name: (name)
		salt: (checksum form now/time/precise 'SHA256)
		password: none
		version: 1
		created: (now/precise)
	]
	user/password: checksum rejoin [user/salt form password] 'SHA256
	users/:name: user
	save-users
	make-token name
]

login-user: func [
	"Return NONE when user not exists, FALSE when password is wrong or TOKEN"
	name [word! string!]
	password [word! string!]
	/local user
][
	user: select users form name
	unless user [return none]
	password: checksum rejoin [user/salt form password] 'SHA256
	unless equal? password user/password [return false]
	make-token name
]

; -- token management -------------------------------------------------------

load-tokens: func [/local file][
	file: config/tokens-file
	tokens: either any [
		not exists? file
		zero? size? file
	][
		copy #[]
	][	
		load file
	]
	check-tokens
]

save-tokens: func [][
	save config/tokens-file tokens
]

check-tokens: func [][
	foreach [token data] tokens [
		if data/expires < now/precise [
			remove/key tokens token
			save-tokens
		]
	]
]

make-token: func [name /refresh data /local token][
	data: any [
		data
		save/as none checksum form now/precise 'sha256 'base64url
	]
	token: compose [
		name: none
		value: (data)
		expires: (now/precise + 01:00:00) ; TODO: move expiration to settings
	]
	token/name: name
	tokens/:name: token
	save-tokens
	make map! token
]

match-token: func [value][
	foreach [user token] tokens [
		if equal? value token/value [
			make-token/refresh user value
			return user
		]
	]
	return false
]

; -- initalization

init: func [] [
	load-users
	load-tokens
]

; -- end of context
	load-config
]
