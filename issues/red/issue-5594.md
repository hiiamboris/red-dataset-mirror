
#5594: Reentrancy in the tracer needs more design
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.design]
<https://github.com/red/red/issues/5594>

**Describe the bug**

I was using roughly the following function to mimic the try/finally behavior:
```
following: function [code cleanup] [
	do/trace code does [[end] do cleanup]
]
```
(because it's the most control-flow transparent variant right now)

E.g.:
```
>> following [print 1 1 / 0] [print 2]
1
2
*** Math Error: attempt to divide by zero
*** Where: /
*** Near : 1 / 0
*** Stack:  
```
But the function expects that since it starts a trace, the `END` interpreter event must occur eventually. 

An assumption that is easily broken:
```
>> following [following [print 1 1 / 0] [print 2]] [print 3]
1
3
*** Math Error: attempt to divide by zero
*** Where: /
*** Near : 1 / 0
*** Stack: 
```
And there's no other clue I could find in the tracer output that could help me resolve the issue:
```
>> trace/raw [trace/raw [try [1 / 0]]]
INIT -1 none none 41x43
ENTER 0 none none 43x43
FETCH 0 none trace/raw 43x43
ENTER 0 none none 43x43
FETCH 0 none trace 43x43
OPEN 1 none trace 43x43
FETCH 1 none [try [1 / 0]] 44x44
PUSH 1 none [try [1 / 0]] 44x45
CALL 2 trace/raw func [{Runs argument code ...] 44x49
ENTER 0 none none 57x57
FETCH 0 none try 57x57
OPEN 1 none try 57x57
FETCH 1 none [1 / 0] 58x58
PUSH 1 none [1 / 0] 58x59
CALL 2 try make native! [[{Tries to D...] 58x59
ENTER 0 none none 59x59
FETCH 0 none 1 59x59
PUSH 0 none 1 59x60
FETCH 1 none / 59x60
OPEN 2 none / 59x60
FETCH 2 none 0 59x60
PUSH 2 none 0 59x61
CALL 3 / make op! [["Returns the qu...] 59x61
ERROR -1 none make error! [code: 400 typ...] 59x63
RETURN 2 try make error! [code: 400 typ...] 57x59
EXPR 2 none make error! [code: 400 typ...] 57x58
EXIT 2 none make error! [code: 400 typ...] 57x58
RETURN 2 trace/raw make error! [code: 400 typ...] 43x45
EXIT 2 none make error! [code: 400 typ...] 43x44
PUSH 2 none make error! [code: 400 typ...] 43x44
EXPR 2 none make error! [code: 400 typ...] 43x44
EXIT 2 none make error! [code: 400 typ...] 43x44
END -1 none none 41x44
*** Math Error: attempt to divide by zero
*** Where: /
*** Near : 1 / 0
*** Stack: trace 
```
`ERROR` in the above may or may not be caught, so I can't use it. `END` happens only once.

**Expected behavior**

I think whatever code starts a trace shouldn't worry about something outside of it having started it already. 

**Platform version**
`Red 0.6.5 for Windows built 17-Feb-2025/18:47:04+08:00  commit #982be03`


