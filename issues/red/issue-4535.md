
#4535: [CRASH] In compiled `_context/set`
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4535>

possibly related: https://github.com/red/red/issues/4202

**Describe the bug**

Script:
```
Red []
g: function ['w][
	r: catch/name [do reduce [w]] 'name
]
f: does [parse [] [(exit)]]
g f
```
Compile & run:
```
*** Runtime Error 1: access violation                                  
*** in file: /.../datatypes/context.reds
*** at line: 278                                                       
***                                                                    
***   stack: red/_context/set 02973374h 02973384h                      
***   stack: red/word/set                                              
***   stack: g                                                         
```

---
Another variant (set/any):
```
Red []
g: function ['w][
	set/any 'r catch/name [do reduce [w]] 'name
]
f: does [parse [] [(exit)]]
g f
```
Compile & run:
```
*** Script Error: invalid argument: w
*** Where: catch                     
*** Stack:                           
```
(what??)

**Expected behavior**

Interpreted works okay - does nothing.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



