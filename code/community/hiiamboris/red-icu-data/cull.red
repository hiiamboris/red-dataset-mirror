Red [
	title:   "First attempt to deal with XML data (superseded by xslice)"
	author:  @hiiamboris
    license: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
    }
]

#include %../common/show-trace.red 
#include %../common/new-each.red 
#include %../common/prettify.red 
#include %../common/composite.red 
#include %../common/error-macro.red 

;; XML tree selector
;; syntax:
;;   cull 'tree/sub/items
;; items can be:
;;   *             = include every item on that level
;;   all-word      = filter by name
;;   (condition)   = filter upper level by some pseudocode e.g. (#id = "useful"), only issues are replaced

cull: function [
	path [path!] 
	/fetch "Fetch the item path points to (has to be unique)"
	/local x
][
	#assert [1 <= length? path]
	#assert [block? get/any path/1]
	filter: function [tree [block!] path [path!]] [
		; ?? path print mold/part tree 2000 
		if empty? path [return tree]
		item: path/1
		if paren? item [
			item: copy/deep item
			parse as [] item rule: [any [
				change only set x issue! (select tree x)
			|	change only set x refinement! (select tree to word! x)
			|	ahead any-block! into rule
			|	skip  
			]]
			unless do item [throw 'cull]
			return filter tree next path
		]
		if get-word? item [item: get item]
		path: next path
		out: map-each/eval [key value] tree [
			r: all [
				any [key = item  item = '*]
				any [
					not block? :value
					'cull <> catch [value: filter value path]
				]
				[:key :value]
			]
			any [r []]
		]
		all [item <> '* word? item empty? out throw 'cull] 
		out
	]
	
	tree: get path/1
	fcatch/handler ['cull = thrown] [tree: filter tree next path] [tree: copy []]
	; prin "TREE:" probe prettify/data tree
	if fetch [
		foreach item next path [
			if any ['* = item paren? item] [continue]
			if get-word? item [item: get item]
			case [
				not pos: find tree item [ERROR "(item) not found in (mold/flat/part tree 50)"]
				;-- not an error strictly, just means an element without #type or other tag:
				; find next pos item      [ERROR "(item) is not unique in (mold/flat/part tree 50)"]	
			]
			tree: pos/2
		]
	]
	tree
]

leaves: function [tree [block!]] [
	map-each [_ value] tree [
		either block? value [leaves value][value]
	]
]

; tree: load %cldr/common/main/root.red
; tree: cull/fetch 'tree/ldml/numbers/symbols/(#numberSystem = "latn")
; probe prettify/data tree
; tree: cull/fetch 'tree/ldml/dates/calendars/calendar/months/monthcontext/monthwidth/(#type = "wide")


; tree: load %cldr/common/main/1.red
; tree: cull 'tree/ldml/dates
; tree: cull/fetch 'tree/ldml/dates/calendars/calendar/(#type = "gregorian")/months
; tree: cull 'tree/currencyformats/unitpattern
; tree: cull 'tree/currencyformats/unitpattern/(true)
; tree: cull/fetch 'tree/ldml/numbers/symbols/(#numbersystem)/(#"m" = first #numbersystem)

