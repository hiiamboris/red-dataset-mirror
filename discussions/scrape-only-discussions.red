#!/bin/red

Red []
;; fetches and downloads all discussions listed in %sources, also mirrors the list in %type-discussions-list.tsv

force: off							;-- reload discussion files even if they exist

list-template: {
	gh api graphql -f query='{
	  repository(owner: "USER", name: "REPO") {
	    discussions(first: 100, orderBy: {field: CREATED_AT, direction: DESC}) {
	      nodes {
	        id
	        number
	        title
	        url
	        createdAt
	        author {
	          login
	        }
	      }
	    }
	  }
	}' | jq -r '
	  .data.repository.discussions.nodes[] |
	  "\(.number)\t\(.author.login)\t\(.createdAt)\t\(.title)"
	'
}

fetch-template: {
	gh api graphql -f query='{
	  repository(owner: "USER", name: "REPO") {
	    discussion(number: NUMBER) {
	      title
	      body
	      url
	      createdAt
	      comments(first: 100) {
	        nodes {
	          author { login }
	          createdAt
	          body
	        }
	      }
	    }
	  }
	}' | jq -r '
	  .data.repository.discussion as $d |
	  "URL: <\($d.url)>\nDate created: \($d.createdAt)\n\n# \($d.title)\n\n\($d.body)\n\n## Comments\n\n" +
	  ( $d.comments.nodes
	    | map("### \(.author.login) commented at \(.createdAt):\n\n\(.body)\n")
		| join("\n")
	  )
	'
}

load-tsv: function [source [file! string!]] [
	result: copy []
	lines: either file? source [read/lines source][split source #"^/"]
	foreach line lines [unless empty? trim line [append/only result split line #"^-"]]
	result
]

dump-into: function [command [string!] file [file!]] [
	code: call/shell/output command out: clear {}
	if code <> 0 [print ["ERROR calling" command] continue]
	write file out
	if empty? read file [
		print ["WRITE BUGGED OUT: writing" length? out "chars, got zero"]
	]
	copy out
]

foreach source sources: load-tsv %sources [
	set [type: url:] source
	unless parse url [https://github.com/ copy user to "/" "/" copy repo to "/" "/discussions" opt "/" end] [
		do make error! rejoin ["Unsupported URL: " url]
	]

	command: copy list-template
	replace/all/case command {USER} user
	replace/all/case command {REPO} repo
	file: rejoin [%""type"-discussions-list.tsv"]
	text: dump-into command file

	rows: load-tsv text
	numbers: collect [foreach row rows [keep row/1]]
	print ["Found" length? numbers "discussions in" type]

	make-dir to-file type
	foreach number numbers [
		file: rejoin [%""type"/discussion-"number".md"]
		if all [not force  exists? file  0 <> length? read file] [continue]
		print ["Fetching" type "discussion" number "..."]
		command: copy fetch-template
		replace/all/case command {USER} user
		replace/all/case command {REPO} repo
		replace/all/case command {NUMBER} number
		dump-into command file
	]
]
print "Done."
