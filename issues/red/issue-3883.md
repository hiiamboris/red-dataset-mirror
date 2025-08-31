
#3883: Compiled code does not follow standard operator precedence rules
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3883>

**Describe the bug**

4 snippets and their expected result:

file | code | expected result
--- | --- | ---
**2a.red** | `Red []  probe x: (any [1]) - 2` | -1
**2b.red** | `Red []  probe x: any [1] - 2` | error
**2c.red** | `Red []  x: any [1] - 2  probe x` | error
**2d.red** | `Red []  print [any [1] - 2]` | error

Interpreter gives all correct results.
Let's see how the compiled (-r) code does:
```
>2a.exe
-1

Compiling D:\devel\red\red-src\red\2b.red ...
*** Compilation Error: missing argument
*** in file: D:\devel\red\red-src\red\2b.red
*** near: [- 2]

>2c.exe
1

>2d.exe
root size: 2168, root max: 4139, cycles: 0, before: 1089224, after: 1053636
root size: 2168, root max: 4139, cycles: 1, before: 1086904, after: 1085044
root size: 2168, root max: 4139, cycles: 2, before: 1086924, after: 1086924

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/datatypes/object.reds
*** at line: 97
***
***   stack: red/object/rs-select 0267D334h 0348D8E8h
***   stack: red/error/reduce 0267D354h 0267D334h
***   stack: red/error/form 0267D334h 0267D344h 0267D324h -18
***   stack: red/actions/form 0267D334h 0267D344h 0267D324h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 0267D3B4h
***   stack: red/fire 1 0018FCDCh
***   stack: red/interpreter/eval-infix 02781564h 0282BDBCh 0282BDBCh true
***   stack: red/interpreter/eval-expression 0282BD9Ch 0282BDBCh false true false
***   stack: red/interpreter/eval-arguments 0277F854h 0282BD8Ch 0282BDBCh 00000000h 00000000h
***   stack: red/interpreter/eval-code 0277F854h 0282BD8Ch 0282BDBCh true 00000000h 00000000h 0277F854h
***   stack: red/interpreter/eval-expression 0282BD8Ch 0282BDBCh false true false
***   stack: red/interpreter/eval-next 0282BD7Ch 0282BDBCh true
***   stack: red/natives/reduce* false 1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
```

**Expected behavior**

So, `2a` and `2b` are correct.
`2c` somehow compiled without an error and gave a wrong result - in fact the problem [sat there for quite some time unnoticed](https://github.com/red/red/blob/3951b6e863ed64e421eefa70de0790f8f40fd5f1/environment/reactivity.red#L174)
`2d` crash is likely a symptom of the underlying problem, but who knows... (same on builds from January to May 2019)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-May-2019/0:54:25+03:00 commit #3951b6e
```



