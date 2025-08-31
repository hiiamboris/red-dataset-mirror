
#5013: CRASH in `change` when preprocessing code
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/5013>

**Describe the bug**
```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/system/runtime/libc.reds
*** at line: 166
***
***   stack: copy-memory 058027D8h 058027E8h 256
***   stack: red/_series/change 04A904E4h 04A904F4h 04A90504h false 04A904D4h
***   stack: red/actions/change 04A904E4h 04A904F4h 04A90504h false 04A904D4h
***   stack: red/actions/change* 2 -1 -1
***   stack: red/interpreter/eval-arguments 04A904D4h 05801B68h 05801B68h 05801C40h 05801B18h 0572CD68h 0540FFF8h
***   stack: red/interpreter/eval-code 0540FFF8h 05801B28h 05801B68h 05801C40h true 05801B18h 0572CD68h 0540FFF8h
***   stack: red/interpreter/eval-path 05801B18h 05801B28h 05801B68h 05801C40h false false true false
***   stack: red/interpreter/eval-expression 05801B28h 05801B68h 05801C40h false true false
***   stack: red/interpreter/eval-expression 05801B18h 05801B68h 05801C40h false false false
***   stack: red/interpreter/eval 05801C40h false
***   stack: red/parser/eval 05801C40h true false
***   stack: red/parser/process 04A90494h 04A904A4h 0 0 04A90484h
***   stack: red/natives/parse* true -1 0 -1
***   stack: ctx||383~expand 0342C1B8h
***   stack: expand-directives 0342C1B8h
***   stack: ctx||571~launch 04B71280h
***   stack: ctx||606~launch 04B7094Ch
```

**To reproduce**

1. Create the following `1.red` file:
```
Red []

#do [recycle/off]
recycle/off
[
	#macro [#abcd] func [s e] [e]
	comment [
		#abcd
		#abcd
		#abcd
		#abcd
	
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
		[a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d a b c d ]
	]
]
```
2. Run any debug console with this file as argument

**Expected behavior**

No errors.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2021/12:20:16
```

Other change-caused crashes and junk output: https://github.com/red/red/issues/4087 https://github.com/red/red/issues/4913 https://github.com/red/red/issues/4088


