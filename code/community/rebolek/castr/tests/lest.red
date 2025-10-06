Red []

trim-lines: func [value][replace/all value newline ""]

test: func [value][equal? lest/only value/1 trim-lines value/2]

tests: [
[
	[
form post %/index.html [
	"User ID : " text user
	"Password: " password password
	submit action register
]
	]
{
<form method="post" action="/index.html">
User ID : <input type="text" name="user" />
Password: <input type="password" name="password" />
<input type="submit" name="action" value="register" />
</form>
}
] [
	[
form post %index.lest [
	text style "clip-path: polygon(0% 0%, 12rem 0%, 12rem 8rem, 49rem 8rem, 49rem 0%, 100% 0%, 100% 100%, 0% 100%);"
	label /active "Label"
]
	]
{
<input type="text" style="clip-path: polygon(0% 0%, 12rem 0%, 12rem 8rem, 49rem 8rem, 49rem 0%, 100% 0%, 100% 100%, 0% 100%);"><label class="active">Label</label>
}
] [
[
	div /field /label /prefix /border [
		img /circle %/favicon.png
		text #user
		label for #text "User"
	]
]
{}
]

;-- eoc
]
