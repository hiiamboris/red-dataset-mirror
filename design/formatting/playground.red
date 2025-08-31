Red [
	Title:       "Format playground"
	Description: "Play with mask formats and learn"
	Author:      @hiiamboris
    License: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
    Needs:       [L10N View]
    ; Needs:       [L10N Format View]
]

; #if object? :rebol [#include %split-float.red]
#include %module/module.red

do [
#include %../common/include-once.red
; #include %composite.red
#include %../common/composite.red
#include %../common/new-apply.red
#include %../common/new-each.red

num-legend: {Legend:
[.]    decimal separator
       switches from significant into fractional digits
[E]    switches from fixed decimal into exponent mode
[x]    same as E, but with user-friendly output
[#]    optional digit
[0]    required digit
[1-9]  required digit + rounding
[ ]    group (thousands) separator (space char)
[+]    place for minus or plus sign
[-]    place for minus sign
[( )]  place for accounting negative sign
[$]    single-letter currency identifier
[$$]   standard currency identifier (may equal $)
[$$$]  ISO currency code
[%]    output as percent
[%o]   output as permille
[' ']  insert quoted string, or if empty - apostrophe
}
; [$$$$] full currency name								;-- removed per team decision

dat-legend: {Legend:
         Era: +, Anno Domini, Common Era, AD, CE (+lower)
     Century: 20, 20th, c, cth, cr, XX, XXth, CR, CRth 
        Year: yyyy, yy, yr, 1999, 99
     Quarter: q..qqq, 4th quarter, Q4, q4
       Month: mm, m, 012, 12, Month, Mon, M, December, Dec, D
Day of month: dd, d, 031, 31
 Day of week: 7, W..Wwww, Sunday, Sun, Su, S, Day, Dy (+lower)
 Time of day: A..AAA, A.M., AM, P.M., PM, P (+lower)
        Hour: hhh, hh, hh23, hh12, hh11, h23, h12, h11,
              023, 012, 011, 23, 12, 11
      Minute: mi, mm, 59
      Second: ss, 59
    Fraction: f..ffffff
   Time zone: GMT, UTC, +ZZZZ, +ZZ:ZZ, +z:zz, +zz, +z,
              +00:00Z, +0000Z, +00:00, +0000, +0:00, +00, +0
}

nm-known: ["dec" "sci" "eng" "pct" "std" "acct"]
dm-known-str: {full long medium short (also prefixed by time/ date/ datetime/)
RFC3339 Atom W3C W3C-DTF ISO8601 ISO-8601 RFC822 RFC2822
RFC1123 RSS HTTP-Cookie RFC850 USENET RFC1036}
dm-known: [
	datetime/full datetime/long datetime/medium datetime/short
	date/full date/long date/medium date/short
	time/full time/long time/medium time/short
	full long medium short
	RFC3339 Atom W3C W3C-DTF ISO8601 ISO-8601 RFC822 RFC2822
	RFC1123 RSS HTTP-Cookie RFC850 USENET RFC1036
]

fixed: system/view/fonts/fixed
pnl-clr: any [attempt [system/view/metrics/colors/panel] white]		;@@ workaround for #3810
count: length? system/locale/list
langs: map-each/eval [k v] system/locale/list [
	system/locale/tools/expand-locale k
	v: either k = 'red ["red: Red"] [
		also s: rejoin [k ": " v/lang-name]
		if v/region-name [repend s [" (" v/region-name ")"]]
	]
	[k v]
]
copy-data: function [names] [
	r: copy #[]
	foreach w names [
		face: get w
		label: pick find/same face/parent/pane face -1 
		put r to set-word! label/text any [face/text face/data/(face/selected * 2)]
	]
	write-clipboard mold/only to [] r
] 
view compose/deep [
	title "Format masks playground"
	tab-panel pnl-clr [
		"dates" [
			text "Mask:" dm: field focus 250 "023:59:59 031/Dec/1999 'GMT'+00:00"
				on-key-down [if event/key = tab [set-focus dv]] return
			pad 30x-5 text 50x40 font-size 9 "Can be^/one of:"
				text 370 font-size 9 (dm-known-str) return
			pad 0x0 text "Date:" dv: field 250 (mold now/precise)
				on-key-down [if event/key = tab [set-focus dm]] return
			pad 90x-10 text "A date! or time! value" return
			pad 0x-10 text "Result:" dr: text 400 react [
				df: try/all [
					mask: either find/only/case dm-known w: attempt [transcode/one dm/text] [w][dm/text] 
					format/in load dv/text mask to word! pick dl/data dl/selected * 2 - 1
				]
				if error? df [parse form df [thru "***" opt [to "{"] copy df to "***"]]
				dr/text: df
			] return   
			pad 0x-10 text "Language:" dl: drop-list 250 select count on-change [face/selected: face/selected]
				data langs
				on-key-down [if event/key = tab [set-focus dm]] 
			button "Copy data" [copy-data [dm dv dl dr]] return
			pad 0x-25 db: box left font-name fixed dat-legend on-created [db/size: db/size + 40] 
		]
		"numbers" [
			text "Mask:" nm: field focus 150 "# #0.00"
				on-key-down [if event/key = tab [set-focus nv]] return
			pad 90x-10 text (`"Can be one of [(nm-known)]"`) return
			pad 0x-10 text "Number:" nv: field 150 "123.4567"
				on-key-down [if event/key = tab [set-focus nm]] return
			pad 90x-10 text "A number! or money! value" return
			pad 0x-10 text "Result:" nr: text 300x30 react [
				nf: try/all [
					mask: either find/case nm-known nm/text [to word! nm/text][nm/text] 
					format/in load nv/text mask to word! pick nl/data nl/selected * 2 - 1
				]
				if error? nf [parse form nf [thru "***" opt [to "{"] copy nf to "***"]]
				nr/text: nf
			] return   
			text "Language:" nl: drop-list 250 select count on-change [face/selected: face/selected]
				data langs 
				on-key-down [if event/key = tab [set-focus nm]]
			button "Copy data" [copy-data [nm nv nl nr]] return
			pad 0x-25 nb: box left font-name fixed num-legend on-created [nb/size: nb/size + 40] 
		]
	]
	origin 50x50
]

];;do