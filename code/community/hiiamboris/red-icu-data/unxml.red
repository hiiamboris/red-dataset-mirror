Red [
	title:   "Temporary XML data extractor"
	author:  @hiiamboris
	notes:   {
		Uses older xml2.red:
		https://gitlab.com/rebolek/markup/-/blob/09d335cfd58aadec760357261b6159f60eb51b18/xml2.red
	} 
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]

;@@ TODO: use newer xml.red, with text-sigil set to `!`; morph won't be needed

#include %xml2.red
; #include %../common/prettify.red
#include %../common/morph.red
#include %../cli/cli.red

ldml-in: context [
	name: quote (word! | string!)
	data: quote (ahead block! [rule] | string! | none!)
	attr: quote (map!)
	rule: quote (elem ...)
	elem: quote (name data attr)
]
ldml-out: context [
	join: none
	rule: [elem ...]
	elem: quote (
		(to word! 'name | 'name)
		join (data: (rule) | 'data) 'attr 
	)
]

ldml-out/join: function [input args output data /local w] [
	output: tail output
	ofs1: morph-ctx/emitter/eval-next-rule input args output data
	if ofs1/1 < 0 [return ofs1]
	args: skip args ofs1/2
	ofs2: morph-ctx/emitter/eval-next-rule input args output data
	if ofs2/2 < 0 [return as-pair -1 ofs1/2 + ofs2/2]
	case [
		map? output/2 [
			parse r: to [] output/2 [
				any [change set w set-word! (to issue! w) skip]
			]
		]
		true [print ["UNEXPECTEDTYPE:" type? output/1]]
	] 
	case [
		output/1 = "" []
		string? output/1 [repend r ['! output/1]]
		block?  output/1 [append r output/1]
		true [print ["UNEXPECTEDTYPE:" type? output/1]] 
	]
	if any [(length? r) > 8 find r block!] [new-line/skip r yes 2]
	change/part/only output r tail output
	as-pair 1 ofs1/2 + ofs2/2
]
		
unxml: function [
	file [file!]
][
	xdata: load-xml read file
	extr: morph xdata ldml-in/rule ldml-out/rule
	print mold/only extr
]
cli/process-into unxml
