
#5240: [View] CRASH when showing an empty image
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5240>

**Describe the bug**
```
>> view [image 0x0]

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/platform/image-wic.reds
*** at line: 331
***
***   stack: red/OS-image/get-handle 05745968h true
***   stack: gui/OS-draw-image 0106F84Ch 05745968h 00000000h 05745948h 00000000h false 00000000h 00000000h
***   stack: gui/draw-begin 0106F84Ch 0006135Ah 00000000h true false
***   stack: gui/update-base 0006135Ah 00371392h 0106F984h 05745928h
***   stack: gui/init-base-face 0006135Ah 3609490 05745928h true
***   stack: gui/OS-make-view 0536D7ECh 3609490
***   stack: ctx||458~make-view 0536D7ECh 0536D7FCh
***   stack: show
***   stack: show
***   stack: view
***   stack: red/_function/call 0536D49Ch 049E3884h 0573E3A0h 0
***   stack: red/interpreter/eval-code 05453E78h 0573E3C0h 0573E3C0h 0536D47Ch false 00000000h 00000000h 05453E78h
***   stack: red/interpreter/eval-expression 0573E3B0h 0573E3C0h 0536D47Ch false false false
***   stack: red/interpreter/eval 0536D47Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||602~try-do 04A00C94h
***   stack: ctx||602~do-command 04A00C94h
***   stack: ctx||602~eval-command 04A00C94h
***   stack: ctx||602~run 04A00C94h
***   stack: ctx||602~launch 04A00C94h
***   stack: ctx||621~launch 04A006A4h
```

**Expected behavior**

No crash.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4565 date: 7-Nov-2022/8:01:41 commit: #134698f686c200e24d420f28866c8aa03a8557c0 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```
Related: https://github.com/red/red/issues/4294


