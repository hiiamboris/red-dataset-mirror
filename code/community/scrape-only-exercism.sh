#!/bin/bash

~/dataset/scrape-code.sh https://github.com/exercism/red/tree/main/exercises/practice exercism
shopt -s globstar
for f in exercism/**/.meta/example.red; do
	cp "$f" "${f%/*/*}"
done