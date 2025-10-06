Red [
	Description: "Configuration file for `regroup` script."
	File: %config.red
]

; Group ids. Has to start with none, group ids from most to less ferquent posts
; example:
;   frequency-grades: [none 74 73 63 61 62 75]
; "none" means a main feed (with all contacts)
; group 74 will eventually contain most-frequent posters, while group 75 – least-frequent
frequency-grades: [none your-group-ids-here]

; Friendica host, like "forum.friendi.ca" or "libranet.de"
friendica-host: "your-node-here"

; login that you provide to Friendica's login form
friendica-username: "your-login-here"

; password that you provide to Friendica's login form
friendica-password: "your-password-here"
