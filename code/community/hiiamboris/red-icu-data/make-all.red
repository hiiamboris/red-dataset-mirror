Red [
	title:   "Script to produce `locales.red`"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]

#include %../common/new-each.red
#include %../common/glob.red

change-dir %minimal
list: glob/only "*.red"
change-dir %..

root: %locales
append list %red.red									;-- 'red' locale is manually written
code: map-each/eval file list [[
	to issue! 'include root/:file
]]
code: trim mold/only new-line/all/skip code yes 2
insert insert insert code "Red " mold [					;@@ all workarounds for #5058
	title: "All-in-one locale data"
	notes: "DO NOT MODIFY! Generated automatically"
    license: https://github.com/red/red/blob/master/BSL-License.txt
] "^/^/"
write %locales.red code
