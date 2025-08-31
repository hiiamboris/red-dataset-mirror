
#25: return as last statement in function crashes compiler
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.tested]
<https://github.com/red/red/issues/25>

With the following input:

```
red/system []
f: func [return: [c-string!] /local s [c-string!]][s: " " return s]
```

the compiler crashes with (verbose = 4):

```
<<< return
<<< s
expr: s
>>>loading s
>>>emitting code: #{8B45}
>>>emitting code: #{FC}
*** expected logic! variable or conditional expression
at:  []
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-01T12:08:25Z, meijeru, commented:
<https://github.com/red/red/issues/25#issuecomment-1083099>

    On second thoughts, the return statement also crashes the compiler when it is NOT the last statement.  

--------------------------------------------------------------------------------

On 2011-05-01T13:35:36Z, dockimbel, commented:
<https://github.com/red/red/issues/25#issuecomment-1083235>

    Return statement was producing a compilation error when used with non-logic values. Regression tests for this case will have to be added to %return-test.reds.
    
    Fixed by commit: https://github.com/dockimbel/Red/commit/40c678b1621fb998987defab4b9f3a375e7af3c8

--------------------------------------------------------------------------------

On 2011-05-09T11:43:28Z, dockimbel, commented:
<https://github.com/red/red/issues/25#issuecomment-1122367>

    Tested OK.

