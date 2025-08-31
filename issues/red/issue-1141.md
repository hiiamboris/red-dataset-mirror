
#1141: Compiler refuses get-word in path from object
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1141>

The following program fails in the compiler, but not in the interpreter:

```
Red []
o: object [
    A: 1
]
s: 'A
print o/:s

-=== Red Compiler 0.5.3 ===- 
Compiling /C/Projects/Red/programs/path-problem.red ...
*** Red Compiler Internal Error: Script Error : get-word-index expected name argument of type: word 
*** Where: comp-path 
*** Near:  [get-word-index/with last path ctx] 
```

A similar program with a block instead of an object is not refused.



