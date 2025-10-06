Red [
	title:   "Script to extract numbering systems from CLDR"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]

#include %xslice.red

unpack: func [s /local a] [ 
	rejoin parse s [collect any [
		"&#x" copy a to ";" skip keep (to char! to integer! to issue! a)
	|	keep skip
	]]
]


data: load %"D:\devel\red\unicode\cldr\40.0\common\supplemental\numberingSystems.red"
out: #()
data => [
	supplementaldata/numberingsystems/numberingsystem/(#type = "numeric") => [
		id: to word! #id digits: #digits (out/:id: unpack digits)
	] 
]

save/header %numbering-systems.red out [
	title:  "Numbering systems for locale data"
	notes:  "DO NOT MODIFY! Automatically extracted from CLDR"
	license: https://github.com/unicode-cldr/cldr-core/blob/master/LICENSE
]

;; create also #include-able version
write %../format/numbering-systems.red
	head insert find read %numbering-systems.red "#(" "system/locale/numbering-systems: "