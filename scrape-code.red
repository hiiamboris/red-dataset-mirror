#!/bin/red

Red []

if 2 <> length? args: system/options/args [print "Syntax: $0 <url> <dir>" quit]
url: to url! args/1
dir: clean-path to-red-file args/2		;-- absolute because Red interpreter resets CWD to the script location, better to see that

;@@ any better way to distinguish https://domain/owner/repo.red vs https://domain/.../file.red ??
known-domain: ["github.com" | "gitlab.com" | "codeberg.org"]
home: to-red-file get-env 'HOME
repo-rule: ["http" opt "s" "://" copy domain known-domain "/" copy user to "/" "/" copy repo to ["/" | end] opt "/"]
dir-rule:  [copy base repo-rule opt ["tree/" copy branch to "/" "/"] copy rest some skip]

call': function [cmd /output out] [
	forall cmd [if file? :cmd/1 [cmd/1: to-local-file cmd/1]]
	print ["Calling:" cmd: rejoin cmd]
	code: call/wait/console/:output cmd out
	if code <> 0 [print ["FAILED with code" code]]
	out
]

print ["^/Cloning" url "into" dir "..."]
case [
	parse url [https://gist.github.com/ copy user to "/" "/" copy id to end] [
		call'/output [home/gist-to-md" "id] out: clear {}
		either (trim copy out) = "Error: Not Found" [
			print "ERROR cloning the gist: no longer accessible (404)"
		][
			make-dir/deep dir
			file: rejoin [id ".red.md"]                                      	
			write dir/:file out
		]
		wait 1								;-- ban prevention; rate is ~1.4 req/sec when authenticated
	]
	parse url repo-rule [					;-- whole repo
		make-dir/deep first split-path dir
		unless exists? repo-dir: home/wip/repos/:domain/:user/:repo [
			call' ["git clone --depth=1 "url" '"repo-dir"'"]
		]
		call' ["ln -s -T '"home/wip/repos/:domain/:user/:repo"' '"dir"'"]
	]
	parse url dir-rule [					;-- directory in the repo
		make-dir/deep first split-path dir
		unless exists? repo-dir: home/wip/repos/:domain/:user/:repo [
			call' ["git clone --depth=1 "base" "repo-dir]
		]
		call' ["ln -s -T '"home/wip/repos/:domain/:user/:repo/:rest"' '"dir"'"]
	]
	not find [#(none) %.wiki] ext: suffix? url [	;-- single script
		make-dir/deep dir
		file: second split-path url
		call' ["wget -O '"dir/:file"' "url]
	]
	true [print "URL did not match any of the expected forms!"]
]

