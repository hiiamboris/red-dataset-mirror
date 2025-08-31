#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Syntax: $0 <room-id> <file.xz>"
else
	cd ~/py/bin
	echo "Scraping room $1" >&2
	./matrix-commander -l all -o json -r "$1" | xz >"$2"
fi