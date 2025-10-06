Red [
	title:   "Script to produce minimal locale data"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]

header: %{Red [
	title:  "Red locale data file"
	notes:  "DO NOT MODIFY! Generated automatically from CLDR data"
	license: https://github.com/unicode-cldr/cldr-core/blob/master/LICENSE
]

}%		

#include %../common/include-once.red
#include %../common/glob.red
#include %../common/composite.red

files: glob/from/only/omit locales: %locales "*.red" "root.red"
minimal: %minimal
foreach file files [
	parse file [copy base to "."]
	any [
		parse parent: copy file [to "_" remove to "." to end]
		parent: %root.red
	]
	print `"subtracting (parent) from (file)"`
	call/wait/output `"ldiff (to-local-file locales/:parent) (to-local-file locales/:file)"` clear out: {}
	diffed: load out
	diffed/parent: to word! to string! copy/part parent find parent "."
	path: as set-path! compose [system locale list (to word! to string! base)]
	code: copy header 
	append code mold/only reduce [path diffed]
	write minimal/:file code
]

root: compose [system/locale/list/root: (load %locales/root.red)]
code: rejoin [header mold/only root]
write minimal/root.red code
