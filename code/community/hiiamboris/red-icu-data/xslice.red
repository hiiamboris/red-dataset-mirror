Red [
	title:   "Experimental XML slicing DSL"
	purpose: "Help extraction of CLDR data"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]

#include %/d/devel/red/common/new-apply.red
#include %/d/devel/red/common/sift-locate.red
#include %/d/devel/red/common/assert.red
#include %/d/devel/red/common/composite.red
#include %/d/devel/red/common/error-macro.red

;; important: since we're inheriting data, "selection" operation may encounter more than one hit
;; so order is important and selection should return the most specific result (first)

;; for x: a vs x: [a] to work we need filter-expr to always return block (collection)
;; and [a] will return single block inside another block, consisting of `a`s values
;; basically [ ] will put the result into another block
;; then word: checks if result is single and succeeds

;; forms:
;;   any [filter =>] filter
;;   any [filter =>] [forms]
;;   word: any [filter =>] final
;; final: [word | path | code]		<- either sets one value (or errors), or evals code for each value
;; filter: [word! | path]    		<- removes filtered out values
;; code: paren!
;; path: any [word! | get-word! | paren!]

xslice: context [
	
	collect: function [data [block!] exprs [block!] /local target block word paren type] [
		=exprs=:    [
			(orig: data) any [=any-expr= (keep data  data: orig  target: type: none)]
			[end | p: (ERROR "Unexpected syntax at (mold/part p 50)")]
		]
		=any-expr=: [=set-expr= | =expr=]
		=set-expr=: [set target set-word! opt =type= =expr= (assign target data type)]
		=type=:     [ahead word! 'to set type skip]
		=expr=:     [=filter= any ['=> =filter=]]
		=filter=:   [=word= | =path= | =block= | =code=]
		; =filter=:   [=word= | =path= | =block= | if (target) =code=]
		=code=:     [set paren paren!          (data: iterate target paren data)]
		=block=:    [set block block!          (data: iterate none   block data)]
		=word=:     [set word [word! | issue!] (data: filter data word)]
		=get-word=: [set word get-word!        (data: filter data get word)]
		=selector=: [set paren paren!          (data: filter data paren)]
		=path=:     [ahead path! into [any [=word= | =selector= | =get-word=]]]
		
		keep: func [x] [if x [append result x]]
		if empty? data [return data]
		result: copy []
		parse exprs =exprs=
		result
	]
	
	;; this implies that data is ordered as 'actual then inherited', so actual values win
	assign: function [word data type] [
		; unless all [block? :data single? data] [
			; ERROR "Cannot set (word) to (mold/only/part :data 50)"
		; ]
		if word? type [type: get type]
		set/any word either type [to type :data/1][:data/1]
		; print ["setting" word "to" :data]
		; set/any word :data
	]
	
	iterate: function [word [set-word! none!] code [paren! block!] data [block!]] [
		word: either word [to word! word]['item]
		map-each/only (word) data
			either paren? code [
				as [] code
			][
				[collect reduce [item] code]
			]
	]
		
	;; input is block of blocks or empty block, output is also that
	;; block of blocks is a necessity to later be able to filter using paren
	;; that is we have to filter things before we join them
	filter: function [data [block!] pred [word! issue! paren!]] [
		if empty? data [return data]
		switch type?/word pred [
			word! issue! [
				map-each blk data [
					#assert [block? :blk]
					map-each/drop/only [(pred) val] blk [val]
				]
			]
			paren! [
				pred: map-each/only [key [issue! refinement! path!]] pred [
					if refinement? key [key: to word! key]
					if path? key [key: as [] key]
					as path! compose [blk (key)]
				]
				map-each/only/drop blk data compose [		;-- compose to bind blk to inside map-each
					either (pred) [blk][continue]
				]
			]
		]
	]
	
	#assert [
		[1 3 1]           = filter [ [#a 1 #b 2 #a 3 #a 1] ] #a
		[1 3 1]           = filter [ [#a 1 #b 2] [#a 3 #a 1] ] #a
		[1 3 1]           = filter [ [#a 1 #b 2] [#a 3] [#a 1] ] #a
		[2]               = filter [ [#a 1 #b 2 #a 3 #a 1] ] #b
		[]                = filter [ [#a 1 #b 2 #a 3 #a 1] ] #x
		[[1] [3] [1]]     = filter [ [#a [1] #b [2]] [#a [3]] [#a [1]] ] #a
		[[#a [3]]]        = filter [ [#a [1] #b [2]] [#a [3]] [#a [1]] ] quote (#a = [3])
		[[#a [1] #b [2]]] = filter [ [#a [1] #b [2]] [#a [3]] [#a [1]] ] quote (#b = [2])
	]
	
	join: function [blocks [block!]] [
		map-each x blocks [x]
	]
	
	;; returns all found items joined together
	set '=> make op! function ['subj [word! path! block!] dsl [block!]] [
		unless block? subj [subj: get subj]
		join collect reduce [subj] dsl
	]
	
	;; returns only the first found item (so data from different contexts isn't mixed)
	set '-> make op! function ['subj [word! path! block!] dsl [block!]] [
		unless block? subj [subj: get subj]
		first collect reduce [subj] dsl
	]
]

; x: load %"D:\devel\red\unicode\cldr\40.0\common\main\root.red"
; halt
