Red []

#include %client-tools.red

examples: [
{--request GET \
--url https://twilio-sms.p.rapidapi.com/2010-04-01/Account \
--header 'x-rapidapi-host: twilio-sms.p.rapidapi.com' \
--header 'x-rapidapi-key: 7c0732fd2emsh5f9ea0fcbd7f516p151eaajsn9af77aa1ece3'
}

{
--location --request POST 'http://localhost:8065/api/v4/groups//teams//link' \
--header 'Authorization: Bearer yx9uebi5f7g3jfq4zjp9crfawo' \
--header 'Content-Type: application/json' \
--header 'X-Requested-With: XMLHttpRequest' \
--data-raw '{
	"can_leave": true,
	"auto_add": false
}'}

{
curl -X POST https://api.twilio.com/2010-04-01/Accounts/$TWILIO_ACCOUNT_SID/Messages.json \
--data-urlencode "Body=This is the ship that made the Kessel Run in fourteen parsecs?" \
--data-urlencode "From=+15017122661" \
--data-urlencode "To=+15558675310" \
-u $TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN
}

{curl --request GET \
	--url 'https://alpha-vantage.p.rapidapi.com/query?from_currency=USD&function=CURRENCY_EXCHANGE_RATE&to_currency=JPY' \
	--header 'x-rapidapi-host: alpha-vantage.p.rapidapi.com' \
	--header 'x-rapidapi-key: 7c0732fd2emsh5f9ea0fcbd7f516p151eaajsn9af77aa1ece3'}
]

; --

context [

encode?: false

sp: [some space]
asp: [any space]
ws: charset " ^-^/"
ws*: [any ws]
ws+: [some ws]
quote-char: charset {'"}

header-rule: [
	["-H" | "--header"] sp
	copy qt quote-char
	copy value to qt
	skip
	asp
	(
		parse value [
			copy key to #":" skip
			sp
			copy value to end
		]
		put request/headers to set-word! key value
	)
]
request-rule: [
	["-X" | "--request"] asp
	copy value to space
	skip
	(request/method: to word! value)
]
url-rule: [
	opt "--url"
	(qt: "")
	asp
	mark:
	opt [set qt quote-char]
	(if string? qt [qt: space])
	copy value [
		"http"
		to qt
	]
	opt qt
	asp
	(request/url: to url! value)
]
data-rule: [
	(type: none)
	[
		"--data-ascii"
	|	"--data-raw"		(type: 'raw)
	|	"--data-urlencode"	(type: 'urlencode)
	|	"--data"
	|	"-d"
	]
	sp
	copy qt quote-char
	copy value to qt
	skip
	(
		case [
			all [
				not equal? type 'raw
				equal? #"@" value/1
			] [value: read value] ; TODO: read/binary?
			equal? type 'urlencode [
				value: either find value #"=" [
					value: split value #"="
					rejoin [url-encode value/1 #"=" url-encode value/2]
					; TODO: This doesn’t support "=content" option
				] [
					url-encode value
				]
			]
		]
		append request/data either empty? request/data [
			value
		][
			rejoin [#"&" value]
		]
		; TODO: set default "Content-Type" to "application/x-www-form-urlencoded"
	)
]
user-rule: [
	["--user" | "-u"]
	sp
	copy value to [#":" | ws | end]
	(request/user: value)
	[
		#":"
		copy value to [ws | end]
		(request/password: value)
		(put request/headers 'Authorization reduce [
			'Basic enbase rejoin [request/user #":" request/password]
		])
	|	skip
	]

]

ignored-rule: [
	"-v" | "--verbose"
]

set 'curl func [data] [
	request: copy/deep request!
	parse data [
		ws*
		opt "curl"
		ws*
		some [ mark: [
			ws
		|	#"\" newline
		|	"--location" sp
		|	header-rule
		|	request-rule
		|	url-rule
		|	data-rule
		|	user-rule
		|	ignored-rule
		]]
	]
	request
]

; -- end of context
]
