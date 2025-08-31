
#4578: [Compiler] forall CRASHES during break
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/4578>

**Describe the bug**

Compile this & run: `Red [] s: [1] probe forall s [break]`
Result:
```
*** Runtime Error 98: assertion failed       
*** in file: /D/devel/red/common/natives.reds
*** at line: 3270                            
***                                          
***   stack: red/natives/forall-end          
***   stack: red/natives/forall-end          
```
Or with `-c`:
```
*** Runtime Error 98: assertion failed
*** in file:                          
*** Runtime Error 1: access violation 
*** in file:                          
```

**Expected behavior**

Prints: `unset`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 17-Jul-2020/15:41:29+03:00 commit #7f2db9b
```



