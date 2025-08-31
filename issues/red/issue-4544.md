
#4544: [CRASH] In face/on-change (stack corruption?)
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/4544>

**Describe the bug**

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
Changing `a: none` to `a: 1` or smth changes the address from 0 to e.g. 0203h. Remove `if` and no crash. If assigned word is not at the spec tail - no crash.

**Expected behavior**

Base shown.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-24T11:55:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/4544#issuecomment-648775038>

    Stupid GH

