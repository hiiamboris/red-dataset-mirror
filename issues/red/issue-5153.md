
#5153: [Regression] CRASH when saving an empty image
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5153>

**Describe the bug**
```
;; all three lines crash it - take your pick
probe save/as #{} make image! 10x0 'gif
probe save/as #{} make image! 10x0 'png
probe save/as #{} make image! 10x0 'jpeg
```
Output:
```
*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/red/runtime/platform/image-wic.reds
*** at line: 331
***
***   stack: red/OS-image/get-handle 04AEC87Ch false
***   stack: red/OS-image/encode 04AEC87Ch 04AEC89Ch 2
***   stack: red/image/encode 04AEC87Ch 04AEC89Ch 2
***   stack: ctx||310~encode 04AEC87Ch 04AEC88Ch
***   stack: red/interpreter/exec-routine 04AEC86Ch
***   stack: red/interpreter/eval-code 054B71F0h 055F38E8h 055F38E8h 04AEC85Ch false 055F38B8h 055F3910h 04AEC70Ch
***   stack: red/interpreter/eval-path 055F3910h 055F38C8h 055F38E8h 04AEC85Ch false false false false
***   stack: red/interpreter/eval-expression 055F38C8h 055F38E8h 04AEC85Ch false false false
***   stack: red/interpreter/eval 04AEC85Ch true
***   stack: red/natives/do* true -1 -1 -1 -1
***   stack: save
***   stack: red/_function/call 04AEC65Ch 011C3884h 0569A7F0h 0
***   stack: red/interpreter/eval-code 053E2428h 0569A850h 0569A930h 04AEC62Ch true 0569A7F0h 0569A6A0h 053E2428h
***   stack: red/interpreter/eval-path 0569A7F0h 0569A800h 0569A930h 04AEC62Ch false false true false
***   stack: red/interpreter/eval-expression 0569A800h 0569A930h 04AEC62Ch false true false
***   stack: red/interpreter/eval-arguments 053E5E28h 0569A7F0h 0569A930h 04AEC62Ch 00000000h 00000000h 053E5E28h
***   stack: red/interpreter/eval-code 053E5E28h 0569A7F0h 0569A930h 04AEC62Ch false 00000000h 00000000h 053E5E28h
***   stack: red/interpreter/eval-expression 0569A7F0h 0569A930h 04AEC62Ch false false false
***   stack: red/interpreter/eval 04AEC62Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||559~try-do 011E1A6Ch
***   stack: ctx||559~launch 011E1A6Ch
***   stack: ctx||578~launch 011E1480h
```

**Expected behavior**

`#{}` probed
worked in 0.6.4 stable

**Platform version**
```
Red 0.6.4 for Windows built 1-Jun-2022/7:18:47+03:00  commit #c619918
```



