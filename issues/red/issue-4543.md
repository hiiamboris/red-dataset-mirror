
#4543: [CRASH, Regression] In face/on-change* (stack corruption?)
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4543>

**Describe the bug**

_Console builds before May 28, 2020 do not crash. Since June 8, 2020 they do (CLI/GUI both)_

This snippet lists variants that crash and that don't:
```
Red [needs: view]

extend system/view/VID/styles [
	crash: [
		template: [
			type: 'base
			size: 100x100
			; on-change*: function probe spec-of :face!/on-change* [if a: none []]	;) CRASH
			; on-change*: func     probe spec-of :face!/on-change* [if a: none []]	;) OK
			; on-change*: function [w o n /local b c d e]   [if a: none []]			;) CRASH
			; on-change*: func     [w o n /local b c d e a] [if a: none []]			;) CRASH
			; on-change*: func     [w o n /local a b c d e] [if a: none []]			;) OK
			on-change*: func     [w o n /local a b c d e] [if e: none []]			;) CRASH
		]
	]
]
view [crash]
```
Results in:
```
--------- `red-latest`
*** Runtime Error 1: access violation
*** at: 00000000h                    
--------- `-d console`
*** Runtime Error 1: access violation
*** in file: +                      
*** at line: 1818845542              
***
--------- `another -d console`
*** Runtime Error 1: access violation
*** in file: ½0                      
*** at line: 1818845542              
***                                  
(and so on)
```
Changing `a: none` to `a: 1` or smth changes the address from 0 to e.g. 0203h. Remove `if` and no crash. If assigned word is not at the spec tail - no crash. Less than five locals - also no crash.

**Expected behavior**

Base shown.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



