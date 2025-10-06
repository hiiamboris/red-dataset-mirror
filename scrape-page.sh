#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Syntax: $0 <url> <file>"
else
	echo "Original URL: <$1>" >"$2"
	echo >>"$2"
	curl "$1" | ~/node_modules/.bin/readable -b "$1" | html2markdown >>"$2"
fi
 