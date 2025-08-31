Red [title: "composite short form design game"]

;; a few complex scenarios using datatypes that are most likely candidates for #composite
;; strings are a necessity, while others can be coerced with `as`
list: reduce [
	msg1: {"(now as {hhh:mi:ss}): (value) is invalid in (mold spec)"}
	msg2: {{(now as "hhh:mi:ss"): (value) is invalid in (mold spec)}}
	file: {%"(drive):\(path)\file-(idx as "000.").(ext)"}
	url:  {http://(site)/(resource)?param=(date as "yyyy")}
	tag:  {<img src=(url) width=(width as "0")>}
	raw1: {(now as "hhh:mi:ss"): (value) is invalid in (mold spec)}
	raw2: {(drive):\(path)\file-(idx as "000.").(ext)}
	raw3: {http://(site)/(resource)?param=(date as "yyyy")}
	raw4: {img src=(url) width=(width as "0")}
]
tabber: function [fa ev] [
	if ev/key <> tab [exit]
	if found: find/same pane: fa/parent/pane fa [
		found: append/part copy found pane found
		if ev/shift? [found: reverse found]
		foreach face next found [
			if find [field button] face/type [
				set-focus face
				face/selected: if n: length? face/text [as-pair 1 n] 
				exit
			]
		]
	]
]
test: function [f l s r] [
	l: any [l ""]  r: any [r ""]
	f/text: any [
		if all [
			attempt [mold b2: load x: rejoin b: [l s r]]
			not find b2 paren!
		] [x]
		if all [
			attempt [mold b2: load x: rejoin b: [l " " s " " r]]
			not find b2 paren!
		] [x]
		(b: [] "invalid!")
	]
	svmc: system/view/metrics/colors
	f/font/color: either 3 = length? b [svmc/text][svmc/text xor gray]
]
test2: function [f l s r] [
	l: any [l ""]  r: any [r ""]
	f/text: any [
		if all [
			attempt [mold b2: load x: rejoin b: ["<" l s r ">"]]
			not find b2 paren!
		] [x]
		(b: [] "invalid!")
	]
	svmc: system/view/metrics/colors
	f/font/color: either 5 = length? b [svmc/text][svmc/text xor gray]
]
fnt: make font! [name: system/view/fonts/fixed]
view [
	style text: text 50
	text "left:"  l: field on-key-down :tabber focus
	text "right:" r: field on-key-down :tabber
	text "font:"  f: button on-key-down :tabber font fnt "choose..." [if x: request-font/mono [face/font: x]] return
	text 300 "decorators around value:" return
	panel 2 [
		origin 10x0 space 5x0
		text "string1:" text react [face/font: make f/font [parent: none]] 500 react [test face l/text msg1 r/text]
		text "string2:" text react [face/font: make f/font [parent: none]] 500 react [test face l/text msg2 r/text]
		text "file:"    text react [face/font: make f/font [parent: none]] 500 react [test face l/text file r/text]
		text "url:"     text react [face/font: make f/font [parent: none]] 500 react [test face l/text url  r/text]
		text "tag:"     text react [face/font: make f/font [parent: none]] 500 react [test face l/text tag  r/text]
	]
	return text 300 "decorators inside tag (single type only):" return
	panel 2 [
		origin 10x0 space 5x0
		text "string1:" text react [face/font: make f/font [parent: none]] 500 react [test2 face l/text raw1 r/text]
		text "string2:" text react [face/font: make f/font [parent: none]] 500 react [test2 face l/text raw2 r/text]
		text "string3:" text react [face/font: make f/font [parent: none]] 500 react [test2 face l/text raw3 r/text]
		text "string4:" text react [face/font: make f/font [parent: none]] 500 react [test2 face l/text raw4 r/text]
	]
]
quit