
#5099: [Regression] CRASH in `do/expand`
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5099>

**Describe the bug**

Type this:
```
do/expand [do [print 10] do [print 20]]
```
In console:
```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/datatypes/block.reds
*** at line: 51
***
***   stack: red/block/rs-head 04A0F77Ch
***   stack: red/interpreter/eval-expression 0579DE30h 0579DE60h 04A0F77Ch false true false
***   stack: red/interpreter/eval-arguments 04A0F77Ch 0579DE30h 0579DE60h 04A0F77Ch 00000000h 00000000h 05330C98h
***   stack: red/interpreter/eval-code 05330C98h 0579DE30h 0579DE60h 04A0F77Ch false 00000000h 00000000h 05330C98h
***   stack: red/interpreter/eval-expression 0579DE30h 0579DE60h 04A0F77Ch false false false
***   stack: red/interpreter/eval 04A0F77Ch true
***   stack: red/natives/do* false 1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 04A0F76Ch 0579DEB8h 0579DEB8h 04A0F74Ch 0579DE98h 0579DD78h 05330C98h
***   stack: red/interpreter/eval-code 05330C98h 0579DEA8h 0579DEB8h 04A0F74Ch true 0579DE98h 0579DD78h 05330C98h
***   stack: red/interpreter/eval-path 0579DE98h 0579DEA8h 0579DEB8h 04A0F74Ch false false false false
***   stack: red/interpreter/eval-expression 0579DEA8h 0579DEB8h 04A0F74Ch false false false
***   stack: red/interpreter/eval 04A0F74Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||634~try-do 05801370h
***   stack: ctx||634~launch 05801370h
***   stack: ctx||653~launch 05800D78h
```

**Expected behavior**

In `red-22dec21-328c90422.exe` result was
```
10
20
```
In `red-14jan22-4923e3265.exe` crashes already

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-08T17:48:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5099#issuecomment-1062042545>

    [`0934257a2401aec658b227c7ec1abc442a5bc1fd is the first bad commit`](https://github.com/red/red/commit/0934257a2401aec658b227c7ec1abc442a5bc1fd)

