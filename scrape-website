#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Syntax: $0 <url>"
else
	# enable deep globbing
	shopt -s globstar
	# red-lang has a lot of .tmp files - preferable to keep them rather than re-download every time
	wget -nc -r -l inf -A html,md,adoc,tmp -P ~/wip "$1"
	domain=$(echo $1 | sed -E 's#^[a-zA-Z]+://##' | cut -d/ -f1)
	mkdir -p $domain
	for absf in ~/wip/$domain/**/*.html; do
		relf="${absf#~/wip/}"
		mkdir -p "${relf%/*}"
		page=${1%/}/${relf#*/}
		echo Converting "$relf" from "$page" ...
		echo "Original URL: <$page>" >"${relf%.html}.md"
		echo >>"${relf%.html}.md"
		cat "$absf" | ~/node_modules/.bin/readable -b "$page" | html2markdown >>"${relf%.html}.md"
		echo ""
	done
fi

 