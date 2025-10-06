Red[]

web-path: to file! get-env "RBP_WEB" ; %/var/www/rebolek.com/htdocs/builder.html

map-from: func [data /local map][
	map: make map! []
	foreach word data [map/:word: get word]
	map
]

git: func [data /local output][
    also output: copy "" call/wait/output rejoin ["git " data] output
]

get-branches: func [
	/local branch branches
][
	branches: git "branch -r"
	branches: split branches newline
	collect [foreach branch branches [
		if not empty? branch: first split trim branch space [keep second split branch #"/"]
	]]
]

get-commits: func [
	branch
	/limit
		count [integer!]
	/local request response commits
][
	request: rejoin ["log --no-decorate"]
	if limit [append request rejoin [space "-n " count]]
	parse-commit-log set 'r git request
]

parse-commit-log: func [
	log
	/local commits id author date message
][
	commits: make map! []
	commit-rule: [
		"commit" space
		copy id to newline
		thru "Author:" space
		copy author to newline
		thru "Date:" any space
		copy date to newline
		copy message to ["commit" space] (message: trim message)
		(commits/:id: map-from [author date message])
	]
	parse log [some commit-rule]
	commits
]

make-branch-list: func [
	/local branches
][
	branches: sort get-branches
	move find branches "master" head branches
	result: copy {<select name="branch">^/}
	foreach branch branches [
		append result rejoin ["" <option> branch newline]
	]
	replace result <option> "option selected"
	append result </select>
	result
]

make-page: func [
][
	page: copy page-template
	replace page <$branch$> make-branch-list
	write web-path/builder.html page
]

; move to separate file
page-template: {
<html>
<head><title>life is life na naa na na</title>
</head>
<body>
$branch$
</body>
}
