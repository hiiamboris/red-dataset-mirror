#!/bin/red

Red []

home: to-red-file get-env "HOME"
call/shell to-local-file home/list-issues-red-REP

parse gitconfig: read home/.gitconfig [thru "upstream = " change to [#"^/" | end] ("red/REP")]
write home/.gitconfig gitconfig
				   
;@@ load-csv doesn't work so..
lines:   read/lines %red-reps-list.tsv
issues:  foreach line lines [append/only [] split line tab]
numbers: foreach row issues [append [] row/1]
print ["Found" length? numbers "proposals."]
force:   off
make-dir %proposals
foreach number numbers [
	file: rejoin [%proposals/REP- number %.md]
	if all [not force  exists? file  0 <> length? read file] [continue]
	print ["Fetching proposal" number "..."]
	loop 3 [
		call/output rejoin ["git-hub issue show "number] clear out: {}
		unless empty? out [break]
	]
	if empty? out [print ["ERROR fetching REP" number "- output is empty"]]
	write file out
]

call/shell/console rejoin [to-local-file home/dataset/scrape-code" https://github.com/red/REP/tree/master/REPs proposals/more"]

print "Done."