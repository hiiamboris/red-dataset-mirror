Red [
	title:   "CLDR locale data extractor"
	purpose: "Generate source for Red locales"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]


#include %../common/include-once.red
#include %../common/assert.red
; #include %../common/prettify.red
#include %../common/new-each.red
#include %../common/keep-type.red
#include %../common/morph.red
#include %../common/sift-locate.red
#include %../common/bulk.red
#include %../common/show-trace.red
#include %../cli/cli.red

#include %cull.red
#include %xslice.red


;; sets a key in a map/block only if it's not present yet
mappend: func [map [map! block!] key value [any-type!]] [
	if :value [unless map/:key [map/:key: :value]]
	map/:key
]	

conv-mask: function [mask] [
	mask: copy mask
	case [
		mask = "#E0"   [mask: "0.##############E0"]
		mask = "###E0" [mask: "0.##############E3"]
		parse mask [
			any [remove thru ";"]
			any [
				change "¤¤¤¤¤" "$"
			|	change "¤¤¤" "$$$$"
			|	change "¤¤" "$$$"
			|	change "¤" "$$"
			|	change "," " "
			|	change "''''" "''"
			|	"'" to "'" [any [change "''" "''''" to "'"] | skip]
			|	if (not dot) change [["#" | "0"] ahead ["E" | " %" | " %" ({<-nbsp}) | "%" | end]] "0." (dot: yes)
			|	change "@" "0"
			|	"." (dot: yes)
			|	skip
			]
		]
	]
	mask
]

gmt-local: function [zone] [
	#assert [gmt-string]
	parse s: copy gmt-string [
		opt [ahead some [not "{" skip] insert {'} to "{" insert {'}]
		change "{0}" (zone)
		opt [ahead some skip insert {'} to end insert {'}]
	]
	s
]

;@@ doesn't cover everything! only what is used by locales included so far
conv-dt-mask: function [mask] [
	parse/case mask [any [
		"'" thru "'"
	|	change "EEEE" "Sunday"
	|	change "MMMM" "December"
	|	change "MMM"  "Dec"
	|	change "MM"   "012"
	|	change "M"    "12"
	|	change "dd"   "031"
	|	change "d"    "31"
	|	change "yy"   "99"
	|	change "y"    "1999"
	|	change "hh"   "012"
	|	change "h"    "12"
	|	change "HH"   "023"
	|	change "H"    "23"
	|	change "mm"   "59"
	|	change "ss"   "59"
	|	change "a"    "AM"
	|	change "zzzz" (gmt-local "+00:00")				;@@ ideally "Pacific Daylight Time", but not supported
	|	change "z"    (gmt-local "+0")					;@@ ideally "PDT", but not supported
	|	skip
	]]
	mask
]

conv-symbols: function [m [map!]] [
	remove/key m 'numberSystem							;-- we have it outside
	remove/key m 'timeSeparator							;-- deprecated according to CLDR docs, unused
	upper: charset [#"A" - #"Z"]
	map-each/eval/self [k v] m [
		s: form k
		remove/part find/case s "Sign" 4
		if p: find s upper [lowercase insert p "-"]
		if s = "per-mille" [s: "permille"]				;-- why didn't they write "perCent" then? clerks..
		k: to word! s
		[k v]
	]
]

icu-to-red-term: func [term [word!]] [
	select #(
		decimal dec  scientific sci  percent pct  standard std  accounting acct
		format format  stand-alone standalone
		short short  narrow char  abbreviated abbr  wide full
		eranarrow char  eraabbr abbr  eranames full
	) term
]
red-to-icu-term: func [term [word!]] [
	select #(
		dec decimal  sci scientific  pct percent  std standard  acct accounting
		format format  standalone stand-alone
		short short  char narrow  abbr abbreviated  full wide
	) term
]

extract-locale: function [
	file [file!]
	outfile [file! block!]	;@@ use '-' or nothing for stdout
][
	set [path: file:] split-path file
	#assert [all [file? path file? file]]
	is-root?: find/match file "root"
	
	;; get locale info from file name
	alpha: charset [#"a" - #"z" #"A" - #"Z"]
	sep: ["-" | "_"]
	parse as string! file [copy locale some alpha opt [sep copy variant 4 alpha] opt [sep copy region 2 alpha]]
	print `"identified locale=(locale) region=(region)"`
	#assert [locale]
	locale: to word! locale
	either region-provided?: region [
		region: to word! region
	][
		unless is-root? [
			;; choose most common region if none defined (only manually provided)
			region: any [
				select/case [
					en US ar SA zh CN hi IN pt BR
					af ZA ja JP cs CZ he IL ko KR
				] locale
				to word! uppercase form locale			;-- fallback that often works
			]
		]
	]
	
	;; load stuff
	tree: load path/:file
	unless is-root? [
		if region [
			parent: ` %"(locale).red" `
			print ["loading" to-local-file path/:parent]
			append tree load path/:parent
		]
		print ["loading" to-local-file path/root.red]
		append tree load path/root.red
		currencies: do %currencies.red
	]
	num-systems: do %numbering-systems.red
	
	out: #()
	
	;; get language name
	out/lang-name: either is-root? [
		"root"
	][
		first tree => [ldml/localedisplaynames/languages/language/(#type = form locale)/!]
	]
	
	;; region name (or none)
	out/region-name: if region-provided? [
		first tree => [ldml/localedisplaynames/territories/territory/(#type = form region)/(not #alt)/!]
	]
	
	;; fill currency field
	unless is-root? [out/currency: select currencies region]
	
	
	;; NUMBERS
	
	out/numbers: #()
	
	;; extract numbering system name
	systems: []
	unless is-root? [			;-- only one system is supported for now, otherwise it'll be unused data
		systems: to [] out/numbers/system: to word! first tree => [ldml/numbers/defaultnumberingsystem/!]
	]
		
	; ;; translation from our format names into ICU and back
	; word-map: #(dec decimal sci scientific pct percent std standard acct accounting)
	; back-map: #(decimal dec scientific sci percent pct standard std accounting acct)
		
	assert [block? systems]
	foreach sys systems [
		put out/numbers sys copy #()
		num: out/numbers/:sys
		num/digits: num-systems/:sys
		;; currently we don't have fin-digits that differ from digits
		;; e.g. chinese locale lists "hansfin" as "othernumberingsystems", not as default
		num/fin-digits: num/digits
		
		;; fill symbols table
		;; reversed to prioritize children, e.g. to #() [a 1 a 2] = #(a 2)
		num/symbols: conv-symbols to map! reverse/skip
			map-each/eval/drop [key [word!] blk [block!]]
				tree => [ldml/numbers/symbols/(#numbersystem = form sys)]
				[[key blk/!]]
			2
		
		;; fill numeric format masks
		num/masks: masks: copy #()
		masks/number: to map! to [] object [dec: sci: pct: none]
		masks/money:  to map! to [] object [std: acct: none]
		
		foreach w keys-of masks/number [
			prefix: red-to-icu-term w
			formats: to word! `"(prefix)formats"`
			format:  to word! `"(prefix)format"`
			length:  to word! `"(prefix)formatlength"`
			masks/number/:w: conv-mask first tree => [
				ldml/numbers/:formats/(#numbersystem = form sys)/:length/(not #type)/:format/pattern/!
			]
		]
		
		;; add engineering notation (our own, based on scientific)
		masks/number/eng: copy masks/number/sci
		replace masks/number/eng "E0" "E3"				;-- quick hack but works so far
		#assert [find masks/number/eng "E3"]
	
		ptrns: tree => [ldml/numbers/currencyformats/(#numbersystem = form sys)/currencyformatlength/(not #type)]
		masks/money/acct: conv-mask first ptrns => [currencyformat/(#type = "accounting")/pattern/!]
		masks/money/std:  conv-mask first ptrns => [currencyformat/(#type = "standard")/pattern/!]
	]
			
	;; get ordinal suffixes
	;; this is rather experimental.. CLDR does not explicitly define suffixes
	;; so I have to extract them from exemplar sentences and hope that it works
	indentation!:  charset [" ^(A0)^(202F)^(205F)^(3000)" #"^(2000)" - #"^(200A)"]
	out/numbers/ordinal-suffixes: os: #()
	for-each [_ type _ str] tree -> [ldml/numbers/minimalpairs] => [ordinalminimalpairs] [
		parse str [thru "{0}" copy str [any indentation! to [indentation! | end]]] 
		put os to word! type str
	]
	
	
	;; CALENDAR
	
	out/calendar: cal: #()
	
	;; get out GMT local name
	set 'gmt-string first tree => [ldml/dates/timeZoneNames/gmtFormat/!]
		
	;; get 1st day of the week
	#assert [region]									;-- has to be set, even if just a most common territory
	firstdays: do load %firstday.red
	found: locate to [] firstdays [day regions .. find regions form region]
	cal/day1: either is-root? ['sun][to word! found/1]
	
	cal/standalone: standalone: #() 
	cal/format: format: #() 
	cal/masks: masks: #(date #() time #() datetime #())
	
	;; sometimes clerks define the calendar but only one dayperiod inside (e.g. enGB), so we have to inherit full context
	greg: tree => [ldml/dates/calendars/calendar/(#type = "gregorian")]
	; ?? greg halt
	
	;; fucking clerks have a talent for complicating things
	;; so the undocumented inheritance order for e.g. enGB 'format' calendar is:
	;;   enGB/format -> enGB/standalone -> en/format -> en/standalone -> root/format -> root/standalone
	;; no amount of slicing can help achieve this lookup order
	;; so to provide this order I have to fully rearrange the data, twice
	greg-format: map-each [('ldml) branch] tree [
		bough: copy/deep branch => [dates/calendars/calendar/(#type = "gregorian")]
		for-each [_ [word!] blk [block!]] bough [
			sort/skip/all/compare blk 2 func [a b] [a/2/#type <> "stand-alone"]
		]
		bough
	]
	greg-standalone: map-each [('ldml) branch] tree [
		bough: copy/deep branch => [dates/calendars/calendar/(#type = "gregorian")]
		for-each [_ [word!] blk [block!]] bough [
			sort/skip/all/compare blk 2 func [a b] [a/2/#type <> "format"]
		]
		bough
	]
	; ?? greg-format
	; ?? greg-standalone
	
	;; date/time masks
	for-each [_ type _ blk] greg => [dateformats/dateformatlength] [
		mappend masks/date (to word! type) conv-dt-mask blk/pattern/!
	]
	for-each [_ type _ blk] greg => [timeformats/timeformatlength] [
		mappend masks/time (to word! type) conv-dt-mask blk/pattern/!
	]
	for-each [_ type _ blk] greg => [datetimeformats/datetimeformatlength] [
		type: to word! type
		mask: conv-dt-mask blk/pattern/!				;@@ should conv be even called here?
		replace mask "{0}" masks/time/:type				;-- expand datetime masks from "{0} {1}" form
		replace mask "{1}" masks/date/:type
		mappend masks/datetime type mask
	]
		
	foreach [target source] reduce [format greg-format standalone greg-standalone] [
		;; month names
		target/months: mon: copy #()
		source => [
			months/monthcontext/monthwidth => [
				width: to word! #type names: [month/!] (
					width: icu-to-red-term width
					mappend mon width names
				)
			]
		]
		
		;; week day names
		target/days: days: copy #()
		source => [
			days/daycontext/daywidth => [
				width: to word! #type (
					width: icu-to-red-term width
					m: mappend days width copy #()
				)
				day => [
					type: to word! #type  name: !
					(mappend m type name)
				]
			]
		]
	
		;; quarter names
		target/quarters: qtrs: copy #()
		source => [
			quarters/quartercontext/quarterwidth => [
				width: to word! #type (
					width: icu-to-red-term width
					b: mappend qtrs width reduce [none none none none]
				)
				quarter => [
					idx: to integer! #type  name: !
					(mappend b idx name)
				]
			]
		]
	
		;; am/pm names
		target/periods: pers: copy #()
		source => [
			dayperiods/dayperiodcontext/dayperiodwidth => [
				width: to word! #type (
					width: icu-to-red-term width
					m: mappend pers width copy #()
				)
				dayperiod/(not #alt)/(find ["am" "pm"] #type) => [
					id: to word! #type  name: !
					(mappend m id name)
				]
			]
		]
	]
	
	;; get era names - only defined for 'format' calendar
	srceras: greg => [eras]
	format/eras: eras: copy #()
	for-each [type blk] srceras [
		type: icu-to-red-term type
		m: mappend eras type copy #()
		mappend m 'BC  first blk => [era/(#type = "0")/(not #alt)/!]
		mappend m 'AD  first blk => [era/(#type = "1")/(not #alt)/!]
		mappend m 'BCE first blk => [era/(#type = "0")/(#alt = "variant")/!]
		mappend m 'CE  first blk => [era/(#type = "1")/(#alt = "variant")/!] 
	]
	;; funny, RU eras are all messed up in CLDR (religious #type tag plain wrong)
	;; while other languages are OK AFAICT
	;; so it requires a special fix
	if locale = 'ru [
		eras/abbr: #(
			BC:  "до Р. Х."
			AD:  "от Р. Х."
			CE:  "н. э."
			BCE: "до н. э."
		)
		eras/char: #(
			BC:  "до Р.Х."
			AD:  "от Р.Х."
			CE:  "н.э."
			BCE: "до н.э."
		)
	]
	
	
	;; CURRENCIES
	
	
	;; get currency names
	;; root has one set defined, locales - another, so it's tricky
	out/currency-names: cn: #()
	tree => [
		ldml/numbers/currencies/currency => [
			type: to word! #type
			char: symbol/(#alt = "narrow")/!
			; full: displayname/(not #count)/!			;-- removed per team decision
			(b: copy [])
			; displayname/(#count) => [					;-- removed per team decision
				; count: to word! #count  text: !  (put b count text)
			; ]
			std: symbol/(not #alt)/! (
				if char [put b 'char char]
				if std  [put b 'std  std]
				; if full [put b 'full full]				;-- removed per team decision
			)
			(unless empty? b [
				cn/:type: either empty? cn/:type [
					b
				][
					new-line/all
						to [] extend to #() b cn/:type	;-- b is older, cn/:type takes priority
						no
				]
			])
		]
	]
	;; data is correctly composed if USD/std="$" in 'en' locales but std="US$" in others
	#assert [cn/USD/std = either locale = 'en ["$"]["US$"]]
	
	;; optimize currency data for our use
	foreach [k b] copy cn [								;-- copy so we can remove safely
		;; we try alternatives in char->std->iso->full order, so no reason to have char=std=iso
		if b/std == b/char [
			remove/part find b 'char 2					;-- let /char just fall back to /std
		]
		if b/std == form k [							;-- let /std fall back to /iso
			remove/part find b 'std 2
			if b/char == form k [						;-- only try to remove /char if /std was removed
				remove/part find b 'char 2
			]
		]
		new-line/all b no
		map-each/self [w [word!]] b [to set-word! w]	;-- word/set-words get intermixed with to map conversions
		if empty? b [remove/key cn k]					;-- omit empty entries (there's a lot of them)
	]
	out/currency-names: to map! sort/skip to [] cn 2	;-- order alphabetically
	
	either any [empty? outfile outfile/1 = %-] [
		print mold/only out
	][
		write outfile/1 mold/only out
	]
]

cli/process-into extract-locale
