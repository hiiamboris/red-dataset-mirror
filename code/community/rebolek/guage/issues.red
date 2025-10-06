Red[]

do %github-v3.red
do %qobom.red
do %ansi-seq.red

options: load %github-options.red
github/user: options/user
github/pass: options/pass
repo: "red/red"

unless exists? %data [make-dir %data]
unless exists? %data/comments [make-dir %data/comments]

issues: copy []
if exists? filename: %data/issues.red [issues: load filename]

get-page: func [
	/page id
][
	id: any [id 1]
	github/get-issues/repo/page repo id
]

get-open-issues: func [
	"Get open issues"
	/local max-id data
][
	; TODO: look for latest issue and only get newer ones

	clear issues
	; get first page
	max-id: github/get-issues/repo/total repo
	repeat id max-id [
		data: get-page/page id
		if empty? data [break]
		print rejoin [
			"Page " id #"/" max-id " - " length? data " issues: " 
			select first data 'number
			#"-"
			select last data 'number
		]
		append issues data
	]
	save %data/open-issues.red
	issues
]

get-all-issues: func [
	/from offset
	/local issues id i
][
	offset: any [offset 1]
	; get latest issue
	issues: github/get-issues/repo repo
	id: issues/1/number - offset + 1
	issues: copy []
	write %data/all-issues.red ""
	repeat i id [
		print ["Downloading issue" i "from" id]
		issue: github/get-issue repo i + offset - 1
		append issues issue
		write/append %data/all-issues.red mold issue
	]
	issues
]

update-issues: func [
	"Check for new issues and add them to ISSUES block"
	issues
	/local repo last-id newest
][
	repo: get-repo-name issues/1/repository_url
	; we expect that issues are sorted oldest to newest
	last-id: select last issues 'number
	newest: github/get-issues/repo repo
	newest: select first newest 'number
	repeat i newest - last-id [
		print ["Downloading issue" last-id + i "from" newest]
		append issues github/get-issue repo last-id + i
	]
	save %data/all-issues.red issues
	issues
]

get-repo-name: func [
	"Return repo from URL (repository_url)"
	url
][
	url: skip tail split url #"/" -2
	rejoin [url/1 #"/" url/2]
]

get-comments: func [
	"Download comments for particular issue"
	issue
	/local repo comments
][
	either zero? issue/comments [
		[]	; no comments -return empty block
	][
		print ["Getting comments for issue" issue/number]
		repo: get-repo-name issue/repository_url
		comments: github/get-issue/comments repo issue/number
		save rejoin [%data/comments/ issue/number %-comments.red] comments
		comments
	]
]

load-comments: func [
	/local comments file files
][
	path: %data/comments/
	files: read path
	comments: clear []
	foreach file files [
		append comments load rejoin [path file]
	]
	comments
]

get-comment-issue: func [
	"Get Issue ID from comment"
	comment
][
	load first parse comment/issue_url [collect [thru "issues/" keep to end]]
]

select-user: func [
	"Return user's data block"
	users
	name
][
	unless user: select users name [
		user: copy [issues 0 issue-comments 0 pull-requests 0 pr-comments 0]
		users/:name: user
	]
	user
]

process-issue: func [
	"Update users with info from an issue"
	users
	issue
	/local pr?
][
	pr?: issue/pull_request
	print ["Processing issue" issue/number]
	name: probe issue/user/login
	user: probe select-user users name
	either pr? [
		user/issues: user/issues + 1
	][
		user/pull-requests: user/pull-request + 1
	]
	comments: get-comments issue
	foreach comment comments [
		user: select-user users comment/user/login
		either pr? [
			user/comments: user/comments + 1
		][
			user/pr-comments: user/pr-comments + 1
		]
	]
]

process-issues: func [
	issues
	users
][
	foreach issue issues [
		process-issue users issue
	]
	save %data/issues.red
	issues
]

print-issue: func [
	issue
][
	ansi/do compose [
bold "^-Issue: #" (form issue/number) (newline)
{"} (issue/title) {"} reset " by " bold (issue/user/login) reset (dot) (newline)
reset (newline)
	]
]
