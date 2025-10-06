Red [
	title:   "LDML to .red converter"
	purpose: "UnXML and unalias the data"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]

; #include %xml.red
#include %xml2.red
#include %cull.red
#include %../common/prettify.red
#include %../common/assert.red
#include %../common/morph.red
#include %../common/new-each.red
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
		
		
alpha: charset [#"a" - #"z" #"A" - #"Z"]
digit: charset [#"0" - #"9"]
alnum: union alpha digit
path: []
; root: none
unalias: function [tree [block!] /local name attr value] [
	append/only path tree
	forall tree [
		while ['alias == tree/1] [
			b: tree/2
			assert [block? b]
			if none? b/(#source) [break]				;-- supplemental data has "alias" category, not a reference
			assert [b/(#source) = "locale"]
			p: split b/(#path) "/"
			path': copy path
			forall p [either p/1 = ".." [take/last path'][break]]
			root: last path'
			path': copy [root]
			word: [alpha any alnum]
			forall p [
				case [
					parse p/1 word [append path' to word! p/1]
					parse p/1 [copy name word "[@" copy attr word "='" copy value to "'" "']"] [
						append path' to word! name
						append/only path' as paren! reduce [to issue! attr '= value]
					]
					'else [print "UNRECOGNIZED ALIAS: (tree/1)"]
				]
			]
			; ?? path'
			; ?? b/#path
			; print mold/part root 2000
			new: cull/fetch as path! path'
			; if find b/#path "'or'" [?? new]
			assert [2 = length? tree]
			insert clear tree new
			remove-each [key [issue!] value] tree [yes]	;-- get rid of attributes of the inherited subtree
			; if find b/#path "'or'" [probe head tree]
		]
		if block? tree/1 [unalias tree/1]
	]
	take/last path
]
		
unldml: function [
	file [file!]
][
	xdata: load-xml read file
	extr: morph xdata ldml-in/rule ldml-out/rule
	unalias extr
	print mold/only extr
]
cli/process-into unldml
