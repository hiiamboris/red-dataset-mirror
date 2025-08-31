
#4508: [CRASH] in unexplainable compiled/intepreted code interplay
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4508>

**Describe the bug**

I was playing with reactivity, and it crashed. Badly and randomly.
This is at least one of the issues, hopefully the only.

**To reproduce**

Compile & run this script with `red -r` or `red -c`
```
Red []

recycle/off

reactor2!: context [
	on-change*: function [word old new][
		reactivity2/check/only self word
	]
]

reactivity2: context [
	relations:	 []

	check: function [reactor /only field][
		if empty? pos: relations [exit]
		while [pos: find/same/skip pos reactor 4][
			word: pos/2
			pos: skip pos 4
			if yes [continue]
			until [head? []]
		]
	]
	
	set 'is2 function ['field reaction][
		obj: context? field
		repend relations [obj 'x [] none]
		set field 1
	]
]

do [
	r: make reactor2! [x: 1 is2 y: [x + 1]]
]
```

It outputs:
```
*** Runtime Error 1: access violation
*** at: 0043A1C9h
```
This must be some issue with compiler, as it works fine interpreted + if you remove dead code (e.g. `until`) or transform `if yes [continue]` into `continue`, or cast some other magics, it will work.

FYI the other outputs I was getting were:
```
*** Runtime Error 1: access violation                                             
*** in file: /D/devel/red/red-src/red/runtime/datatypes/context.reds              
*** at line: 250                                                                  
***                                                                               
***   stack: red/_context/set-in 0298A1E4h 0298A1F4h 02E5DE10h true               
***   stack: red/_context/set 0298A1E4h 0298A1F4h                                 
***   stack: red/word/set                                                         
***   stack: red/interpreter/eval-expression 02E4CD20h 02E4CD40h false false false
***   stack: red/interpreter/eval 0298A1C4h true                                  
***   stack: red/natives/catch* true 1                                            
***   stack: ctx||560~try-do 022A1DACh                                            
***   stack: ctx||560~launch 022A1DACh                                            
***   stack: ctx||593~launch 022A1504h                                            
```
```
*** Runtime Error 1: access violation                                       
*** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds         
*** at line: 1088                                                           
***                                                                         
***   stack: red/string/concatenate-literal-part 02ADA194h 00361000h 3404168
***   stack: red/datatype/form 02E1E920h 02ADA194h 00000000h 0              
***   stack: red/actions/form 02E1E920h 02ADA194h 00000000h 0               
***   stack: red/error/reduce 02ADA174h 02ADA154h                           
***   stack: red/error/form 02ADA154h 02ADA164h 02ADA144h -18               
***   stack: red/actions/form 02ADA154h 02ADA164h 02ADA144h 0               
***   stack: red/actions/form* -1                                           
***   stack: red/natives/do-print true true                                 
***   stack: red/natives/print* true                                        
***   stack: ctx||560~launch 003D1DACh                                      
***   stack: ctx||593~launch 003D1504h                                      
```
```
***   stack: red/interpreter/eval-arguments 02A9A274h 02ECE870h 02ECE870h 00000000h 00000000h           
***   stack: red/interpreter/eval-code 02A9A274h 02ECE870h 02ECE870h true 00000000h 00000000h 02A9A1F4h 
***   stack: red/interpreter/eval-expression 02ECE870h 02ECE870h false true false                       
***   stack: red/interpreter/eval-arguments 02C66BD0h 02ECE860h 02ECE870h 02ECE840h 02ECEEE8h           
***   stack: red/interpreter/eval-code 02C66BD0h 02ECE850h 02ECE870h false 02ECE840h 02ECEEE8h 02C48EB8h
***   stack: red/interpreter/eval-path 02ECEEE8h 02ECE850h 02ECE870h false false false false            
***   stack: red/interpreter/eval-expression 02ECE850h 02ECE870h false false false                      
***   stack: red/interpreter/eval 02ECE728h true                                                        
***   stack: red/interpreter/eval-function 02ECEF58h 02ECE728h                                          
***   stack: red/_function/call 02ECEF58h 003CF6A8h                                                     
***   stack: red/object/fire-on-set 02ECDE20h 02A9A1E4h 02A9A1E4h 02A9A1F4h                             
***   stack: red/_context/set-in 02A9A1E4h 02A9A1F4h 02ECDE10h true                                     
***   stack: red/_context/set 02A9A1E4h 02A9A1F4h                                                       
***   stack: red/word/set                                                                               
***   stack: red/interpreter/eval-expression 02EBCD20h 02EBCD40h false false false                      
***   stack: red/interpreter/eval 02A9A1C4h true                                                        
***   stack: red/natives/catch* true 1                                                                  
***   stack: ctx||560~try-do 00321DACh                                                                  
***   stack: ctx||560~launch 00321DACh                                                                  
***   stack: ctx||593~launch 00321504h                                                                  
```
```
*** Script Error: check does not allow time for its field argument
*** Where: check
*** Stack: check
```
But that was before I minimized the snippet, and considering the random nature of these error messages I deem them irrelevant, for now.

**Expected behavior**

No crash!

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 8-Jun-2020/19:25:17+03:00 commit #3d23acd
```



