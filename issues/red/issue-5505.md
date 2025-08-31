
#5505: Point to point conversions are buggy
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5505>

**Describe the bug**

```
>> to-point3D make point2D! 1
== (1351, 1025, 0)

>> to point3D! make point2D! 1

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/datatypes/point3D.reds
*** at line: 220
***
***   stack: red/point3D/make 012A256Ch 012A257Ch 52
***   stack: red/actions/to 012A256Ch 012A257Ch
***   stack: red/actions/to*
***   stack: red/interpreter/eval-arguments 012A255Ch 057E9278h 057E9278h 012A253Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 04B6FE18h 057E9238h 057E9278h 012A253Ch false 00000000h 00000000h 04B6FE18h 0 false
***   stack: red/interpreter/eval-expression 057E9238h 057E9278h 012A253Ch false false false
***   stack: red/interpreter/eval 012A253Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||629~try-do 0139F658h
***   stack: ctx||629~do-command 0139F658h
***   stack: ctx||629~eval-command 0139F658h
***   stack: ctx||629~run 0139F658h
***   stack: ctx||629~launch 0139F658h
***   stack: ctx||648~launch 0139F044h

>> make point3D! make point2D! 1

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/datatypes/point3D.reds
*** at line: 220
***
***   stack: red/point3D/make 0539256Ch 0539257Ch 52
***   stack: red/actions/make 0539256Ch 0539257Ch
***   stack: red/actions/make*
***   stack: red/interpreter/eval-arguments 0539255Ch 05799278h 05799278h 0539253Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 054705E8h 05799238h 05799278h 0539253Ch false 00000000h 00000000h 054705E8h 0 false
***   stack: red/interpreter/eval-expression 05799238h 05799278h 0539253Ch false false false
***   stack: red/interpreter/eval 0539253Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||629~try-do 04A3F658h
***   stack: ctx||629~do-command 04A3F658h
***   stack: ctx||629~eval-command 04A3F658h
***   stack: ctx||629~run 04A3F658h
***   stack: ctx||629~launch 04A3F658h
***   stack: ctx||648~launch 04A3F044h
```

**Expected behavior**

`(1,1,0)`

**Platform version**
`Red 0.6.5 for Windows built 17-May-2024/5:19:26+03:00  commit #a150e8e`


Comments:
--------------------------------------------------------------------------------

On 2024-05-20T09:30:44Z, dockimbel, commented:
<https://github.com/red/red/issues/5505#issuecomment-2120055805>

    A silly copy/paste bug... (my own)

