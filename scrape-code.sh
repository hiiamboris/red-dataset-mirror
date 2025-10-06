#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Syntax: $0 <url> <dir>"
else
	# red will move the relative paths to the script, so they need expansion
	dir=$2
	if [[ "$dir" != /* ]]; then dir=$PWD/$2; fi
	red ~/dataset/scrape-code.red "$1" "$dir"
fi