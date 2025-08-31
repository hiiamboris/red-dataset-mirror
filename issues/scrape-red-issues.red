#!/bin/red

Red []

home: to-red-file get-env "HOME"
call/shell to-local-file home/list-issues-red-red

;@@ load-csv doesn't work so..
lines:   read/lines %red-issues-list.tsv
issues:  foreach line lines [append/only [] split line tab]
numbers: foreach row issues [append [] row/1]
print ["Found" length? numbers "issues."]
force:   off
make-dir %issues
foreach number numbers [
	file: rejoin [%issues/issue- number %.md]
	if all [not force  exists? file  0 <> length? read file] [continue]
	print ["Fetching issue" number "..."]
	loop 3 [
		call/output rejoin ["git-hub issue show "number] clear out: {}
		unless empty? out [break]
	]
	if empty? out [print ["ERROR fetching issue" number "- output is empty"]]
	write file out
]
print "Done."