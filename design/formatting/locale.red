Red [
	Title:       "Locale data"
	Description: "WIP locale structure, extracted from CLDR data"
	Author:      @hiiamboris
    License: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]

;@@ right now it loads data from different scripts
;@@ later this data should be unified

system/locale: make system/locale [list: #[]]

#include %system.red
#include %../common/assert.red
; #assert off

#include %../common/composite.red
#include %../common/error-macro.red

context [unless map? select system/locale 'list [
	
	system/locale: make make reactor! system/locale [	;-- reactor here so one can subscribe to locale changes
		;; data for chosen locale:
		name:              none							;-- "language (region)" spelled in locale's language
		lang-name:         none							;-- language name only (e.g. "English")
		region-name:       none							;-- region name only (e.g. "United States")
		region:            none							;-- abbreviated word name of the region (e.g. 'US)
		currency:          none							;-- default currency for locale
		numbers:           #[]							;-- digits, symbols, numeric masks
		calendar:          #[]							;-- standalone, format, date masks
		
		;; collective data:
		list:              #[]							;-- locale data for all supported (loaded) locales
		numbering-systems: #[]							;-- all numbering systems from CLDR (they're small)
		cardinal:          []							;-- cardinal quantities spelling rules
		ordinal:           []							;-- ordinal quantities spelling rules
	]
		
	#include %locales.red
	#include %numbering-systems.red
	#include %plural.red
	
	get-user-locale-id: function [/local lang regn] [	;-- returns 'en_US or something
		lower: charset [#"a" - #"z"]
		upper: charset [#"A" - #"Z"]
		non-alpha: negate union lower upper
		sep:   [#"_" | #"-"]
		=language=: [2 lower ahead [non-alpha | end]]
		=region=:   [2 upper ahead [non-alpha | end]]
		parse s: get-user-locale-id* [
			["C" | "POSIX"] opt ["." to end] end (return 'red)	;-- portable POSIX locale, 'red' is our portable locale
		|	copy lang =language= opt [to =region= copy regn =region=] (
				if regn [repend lang ["_" regn]]
				return to word! lang
			)
		|	(return 'red)										;-- unindentified, default to 'red'
		]
	]
	
	get-best-locale-id: function [] [					;-- returns best locale from those supported
		loc: get-user-locale-id
		case [
			system/locale/list/:loc [loc]
			all [
				formed: form loc
				clear find loc "_"
				lang: to word! formed
				system/locale/list/:lang 
			] [lang]
			'fallback ['red]
		]
	]
	
	inherit: function [src dst] [						;-- links data between maps without override
		foreach [key srcval] src [
			case [
				not find dst key [dst/:key: srcval]		;-- carry over as reference when possible
				all [map? dst/:key  map? srcval] [
					inherit srcval dst/:key
				]
			]
		]
	]

	;; useful when we want to use a locale without loading it as default
	set 'expand-locale function [
		"Expand given locale from minimized form into a working state"
		name [word!]
	][
		loc: system/locale/list/:name
		unless loc/parent [exit]						;-- already expanded
		
		expand-locale par: system/locale/list/(loc/parent)
		inherit par loc
		remove/key loc 'parent							;-- mark as expanded
	]
	
	set 'load-locale function [
		"Load given locale as default into system/locale"
		name [word!]
	][
		expand-locale name
		sl: system/locale
		unless data: sl/list/:name [ERROR "Data for locale '(name)' is not loaded"]
		set sl data
		sl/locale: name
		set  bind [language region] sl  split form name #"_"
		sl/name: copy data/lang-name
		if sl/region [repend sl/name ["(" data/region-name ")"]]
		sl/currencies/names: data/currency-names
		;; for R2 compatibility:
		sl/months: data/calendar/standalone/months/full
		m: data/calendar/standalone/days/full
		sl/days: reduce [m/mon m/tue m/wed m/thu m/fri m/sat m/sun]		;-- in R2 it started from monday always
		()												;-- no return value
	]
		
	load-locale get-best-locale-id
]]


; ? system/locale
