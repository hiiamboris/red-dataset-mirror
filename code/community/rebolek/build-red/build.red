#!/usr/local/bin/red
Red[
	Title: "Builder"
]

#TODO "make bit sane here and check for non-existent envs"
build-path: to file! get-env "RBP_BUILD"
red-path: to file! get-env "RBP_RED"
target-path: to file! get-env "RBP_TARGET"

go-home: does [change-dir build-path]
go-red: does [change-dir red-path]
target-dir: target-path

targets: [
	windows-gui: "-t Windows environment/console/GUI/gui-console.red"
	macos-gui: "-t macOS environment/console/GUI/gui-console.red"
	linux-cli: "-t Linux environment/console/CLI/console.red"
;	linux-gui: "-t Linux environment/console/CLI/gtk-console.red"
	rpi-cli: "-t RPi environment/console/CLI/console.red"
;	rpi-gui: "-t RPi environment/console/CLI/gtk-console.red"
]

git: func [data /local s][
	call/wait/output rejoin ["git " data] s: copy {}
	s
]

update-red: does [
	git "checkout GTK"
	git "pull"
	git "checkout master"
	git "pull"
]

make-date: func [][
	rejoin [
		copy/part skip form now/year 2 2
		skip tail rejoin [#"0" now/month] -2
		skip tail rejoin [#"0" now/day] -2
	]
]

get-latest-commit: func [
	branch
	/local log
][
	go-red
	git rejoin ["checkout " branch]
	git "pull"
	log: git "log --oneline"
	go-home
	first split log space
]

commit-changed?: func [
	"Check latest commit for a branch. Return TRUE if commit is different than cached one"
	branch
	/local commit commits last-commit result
][
; load commit list and get last commit
	commits: any [
		all [
			exists? %commits.red
			load %commits.red
		]
		copy #()
	]
	last-commit: select commits branch
; get current commit
	commit: get-latest-commit branch
	result: not equal? commit last-commit
; store new info
	commits/:branch: commit
	save %commits.red commits
; return result
	result
]

build: func [
	target
	/local s arg branch output post-action builds
][
; check build list (commit: date)
; if build for current commit already exists, do not build and make link only
	builds: any [
		all [exists? %builds.red load %builds.red]
		copy #()
	]
	arg: select targets target
	branch: either find arg "gtk-console" ["GTK"]["master"]
	commit: get-latest-commit branch
	build-name: rejoin [form target #"-" commit]
	output: rejoin [target-dir target #"-" make-date]
	post-action: ""
	platform: none
	build-date: select builds build-name
	filename: rejoin [target-dir target #"-" build-date]
	case [
		find arg "Windows" [
			platform: 'win
			append output ".exe"
			post-action rejoin ["upx " filename]
		]
        find arg "macOS" [
			platform: 'mac
			filename: rejoin [target-dir target #"-" make-date ".app"]
			post-action: rejoin ["tar -zcvf " filename ".tar.gz " filename newline "rm -rf " filename]
		]
	]
	either not select builds build-name [
; we need to make new build
		put builds build-name make-date
		save %builds.red builds
		rejoin [
			"git checkout " branch newline
			"git pull" newline
			"./rebol -qs red.r -r -o " output space arg newline
			post-action newline
		]
	][
; no need to make new build, just link to old one
		switch platform [
			win [append filename ".exe"]
			mac [
				append filename ".app.tar.gz"
				append output ".app.tar.gz"
			]
		]
		rejoin ["ln -s " filename space output]
	]
]

make-script: func [

][
	script: collect/into [
		foreach [target string] targets [
			keep build target
			keep newline
		]
	] clear {}
	script
]

;write %/home/sony/Code/red/build-script.sh make-script
write red-path/build-script.sh make-script
call rejoin ["chmod +x " red-path/build-script.sh]

