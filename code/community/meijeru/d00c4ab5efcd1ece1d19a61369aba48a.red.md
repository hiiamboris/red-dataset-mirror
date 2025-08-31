# 

**Gist ID:** d00c4ab5efcd1ece1d19a61369aba48a
**Created:** 2018-03-06T09:24:26Z
**Last updated:** 2018-03-06T09:24:26Z

## File: `get-structures.red`

```Red
Red [
	Title: "Data structure information for Red inspector"
]

;---|----1----|----2----|----3----|----4----|----5----|----6----|----7----|-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; construct the structures table consisting of pairs of
; structure name (alias struct!) and block of entries [field name]
; the header field is not stored as it is the same for every structure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

structures-table: make block! 150

structures-grammar: [
	thru 'cell!
	some [
		copy name set-word!
			(insert tail structures-table to word! to-string name)
		'alias 'struct! into
		[
			'header into ['integer!]
				(insert/only tail structures-table make block! 3)
			some [
				copy field word! into [some word!]
					(insert tail last structures-table field)
			]
		]
	]
]

structures-def: load append copy red-sources %runtime/datatypes/structures.reds
unless parse structures-def structures-grammar [
	print "error in structures table"
	halt
]

foreach [type struct] types-table [
	unless find structures-table struct [
		print ["type data inconsistency" struct]
		halt
	]
]

series-def: fourth find load append copy red-sources %runtime/allocator.reds 'series-buffer!

```

## Comments

No comments.
