Red [
	title:   "Default currency extraction script"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %../common/assert.red
; #include %../common/prettify.red
#include %../common/new-each.red
#include %../common/keep-type.red
#include %../common/morph.red

supp: load %"D:\devel\red\unicode\cldr\40.0\common\supplemental\supplementalData.red"
supp: supp/supplementalData
out: #()
for-each [('region) b [block!]] supp/currencyData [
	region: to word! lowercase b/#iso3166
	b2: b/currency
	curr: to word! b2/#iso4217
	; from: 1/1/1000 curr: none
	; for-each [('currency) b2 [block!]] b [
		; new: attempt [transcode/one b2/#from]
		; if any [not new  not from  from < new: transcode/one b2/#from] [
			; from: new
			; curr: to word! b2/#iso4217
		; ]
	; ]
	out/:region: curr
]

save/header %currencies.red out [
	title:  "Default currencies per region list"
	notes:  "DO NOT MODIFY! Generated automatically from CLDR data"
	license: https://github.com/unicode-cldr/cldr-core/blob/master/LICENSE
]
