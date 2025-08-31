
#4927: CRASH when using [series!] typeset in routine spec
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4927>

**Describe the bug**

Script:
```
Red []

rou: routine [series [series!]][probe "entered"]
	probe rou [2 3]
do [probe rou [2 3]]
```
Output when compiled:
```
entered
[2 3]

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/red/runtime/datatypes/datatype.reds
*** at line: 149
***
***   stack: red/datatype/mold 02A87EF8h 02854AA4h false false true 00000000h 0 0
***   stack: red/actions/mold 02A87EF8h 02854AA4h false false true 00000000h 0 0
***   stack: red/error/reduce 02854A84h 02854A64h
***   stack: red/error/form 02854A64h 02854A74h 02854A54h -18
***   stack: red/actions/form 02854A64h 02854A74h 02854A54h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 02854AC4h
***   stack: red/fire 1 0019FC78h
***   stack: red/interpreter/exec-routine 02854A84h
***   stack: red/interpreter/eval-code 02943BE8h 02A464E8h 02A464E8h true 00000000h 00000000h 02943BE8h
***   stack: red/interpreter/eval-expression 02A464D8h 02A464E8h false true false
***   stack: red/interpreter/eval-arguments 02943BD8h 02A464C8h 02A464E8h 00000000h 00000000h 02943BD8h
***   stack: red/interpreter/eval-code 02943BD8h 02A464C8h 02A464E8h false 00000000h 00000000h 02943BD8h
***   stack: red/interpreter/eval-expression 02A464C8h 02A464E8h false false false
***   stack: red/interpreter/eval 02854A64h true
***   stack: red/natives/do* true -1 -1 -1
```
So, compiled call works fine, but interpreted - crashes.

**Expected behavior**

No crash.

**Platform version**
```
Red 0.6.4 for Windows built 4-Jul-2021/2:04:09+03:00  commit #1e4fb1b
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-12T13:11:59Z, meijeru, commented:
<https://github.com/red/red/issues/4927#issuecomment-878267369>

    See also #2642

--------------------------------------------------------------------------------

On 2021-07-14T11:54:36Z, dockimbel, commented:
<https://github.com/red/red/issues/4927#issuecomment-879827740>

    Arguments type-checking for routines is currently limited to direct types only, no support for typesets. I will see if that can be added quickly.

--------------------------------------------------------------------------------

On 2021-07-23T13:51:42Z, dockimbel, commented:
<https://github.com/red/red/issues/4927#issuecomment-885653960>

    Fixed by commits: https://github.com/red/red/commit/3c8d386e15dd82d263e92bc29dc1839b3f83fc6c

