Red[]

name users
include %actions-users.red
extern reply

signup: [
	'signup
	set name [string! | email!]
	set password string!
	(
		unless token: make-user name password [
			token: make error! "User already exists"
		]
		reply: token
	)
]

signin: [
	['signin | 'login]
	set name [string! | email!]
	set password string!
	(
		unless token: login-user name password [
			token: make error! "Wrong username or password"
		]
		reply: token
	)
]
