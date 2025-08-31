
#2781: remove bitset without /part crashes
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2781>

It should give an error, see this code:
```
	remove: func [
		bits	[red-bitset!]
		part	[red-value!]
		return:	[red-value!]
		/local
			s  [series!]
			op [integer!]
	][
		unless OPTION?(part) [
			print-line "Remove Error: /part is required for bitset argument"
		]
		s: GET_BUFFER(bits)
		op: either FLAG_NOT?(s) [OP_SET][OP_CLEAR]
		process part bits op no CMD_OTHER
		as red-value! bits
	]
```
but it does not!


