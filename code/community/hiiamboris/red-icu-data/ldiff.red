Red [
	title:   "DIFF-like tool for generating minimal locale data"
	purpose: "Lighten Red runtime and compiled locale-aware binaries"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]


; #include %../common/include-once.red
; #include %../common/composite.red
; #include %../common/error-macro.red
#include %../cli/cli.red

subtract-locale: function [lower [map!] upper [map!]] [
	result: copy lower
	foreach [k v] lower [
		case [
			v == v0: upper/:k [remove/key result k]
			all [map? v map? v0] [result/:k: subtract-locale v v0]
		]
	]
	result
]

ldiff: function [
	"Diff a series of locale files"
	parent-locale [file!] child-locale [file!]
][
	print mold subtract-locale load child-locale load parent-locale
]

cli/process-into ldiff