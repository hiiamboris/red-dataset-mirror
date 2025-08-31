
#5470: A CRASH when calling `offset-to-caret` inside a face actor.
================================================================================
Issue is closed, was reported by luce80 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5470>

**Describe the bug**
A CRASH when calling `offset-to-caret` inside a face actor.

**To reproduce**
```
view [base "hoi" ON-down [offset-to-caret face event/offset]]
```

**Expected behavior**
No crash.

**Platform version**
```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5075 date: 22-Dec-2023/9:07:34 commit: #6cb7d502bcbfae8b00630adee6561909eee2b478 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2024-01-23T23:06:35Z, dockimbel, commented:
<https://github.com/red/red/issues/5470#issuecomment-1907066853>

    Related call stack:
    ```
    *** Runtime Error 98: assertion failed
    *** in file: /C/dev/Red/runtime/datatypes/block.reds
    *** at line: 51
    ***
    ***   stack: red/block/rs-head 05805228h
    ***   stack: gui/OS-text-box-metrics 05805228h 0545CBD4h 1
    ***   stack: ctx||475~text-box-metrics 0545CBC4h 0545CBD4h 1
    ***   stack: offset-to-caret
    ***   stack: red/interpreter/call 0545CB94h 04B73884h 0580B428h 0
    ***   stack: red/interpreter/eval-code 05545938h 0580B468h 0580B468h 0580B3C0h false 00000000h 00000000h 05545938h 0 false
    ...
    ```
    
    There is not enough protection internally in calls to `offset-to-caret` function against inadequate face objects. In the above case, the face does not have a `FACE_OBJ_EXT3` field, so an invalid memory is accessed instead, resulting in a crash.

