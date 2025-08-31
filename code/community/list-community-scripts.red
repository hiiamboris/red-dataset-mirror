#!/bin/red

Red []

;@@ scripts collection must be updated first! (try git pull)

#include %list-red-repos.red

recycle/off 		;) crashes otherwise

excluded: make hash! [
	https://github.com/red/red						;) in /official
	https://github.com/red/wallet					;) in /official
	https://github.com/red/code						;) in /official
	https://github.com/red/community				;) in /official
	https://github.com/greggirwin/red-hof			;) in /design
	https://github.com/greggirwin/red-L10N			;) in /design
	https://github.com/greggirwin/red-formatting	;) in /design
	https://github.com/greggirwin/red-split			;) in /design
	https://github.com/greggirwin/ASCI_red			;) empty repo
	https://github.com/hiiamboris/whatever			;) empty repo
	https://github.com/hiiamboris/red-view-test-system-gitlab-mirror	;) on codeberg
	https://github.com/hiiamboris/red-codex-gitlab-mirror				;) on codeberg
	https://github.com/hiiamboris/red-elastic-ui-gitlab-mirror			;) on codeberg
	https://github.com/hiiamboris/red-spaces-gitlab-mirror				;) on codeberg
	https://github.com/hiiamboris/red-mezz-warehouse-gitlab-mirror		;) on codeberg
	https://github.com/hiiamboris/red-cli-gitlab-mirror					;) on codeberg
	https://codeberg.org/hiiamboris/red-alpha							;) in demos
]

list-urls: function [/local url] [
	home: to-red-file get-env "HOME"
	bin: read/binary home/dataset/docs/community/wiki/links/"[LINKS]-Scripts-collection.md"
	sort new-line/all parse bin [
		collect any thru [copy url url! ahead #")" keep (as url! trim to string! url)]
	] on
]
urls: list-urls

list-roots: function [urls [block!] /local root] [
	unique collect [foreach url urls [
		unless parse url [copy root 4 thru #"/" to end] [
			print ["Unexpected URL:" url]
		]
		keep root
	]]
]

no-gists: function [roots] [
	remove-each root roots: copy roots [find/match root https://gist.github.com/]
	roots
]
gists-only: function [urls] [
	remove-each root urls: copy urls [not find/match root https://gist.github.com/]
	urls
]

roots: no-gists list-roots urls
gists: gists-only urls

foreach gist gists [unless find excluded gist [print gist]]
foreach root roots [
	parse as string! domain: root [thru "://" copy domain to #"/" #"/" copy user to [#"/" | end]]
	foreach repo list-red-repos domain user [unless find excluded root/:repo [print root/:repo]]
	;print ["Repos for" domain "/" user ":" list-red-repos domain user]
]

