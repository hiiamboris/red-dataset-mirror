
#4896: [Regression] CRASH when Drawing across an empty image
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4896>

**Describe the bug**
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/platform/image-wic.reds
*** at line: 367
***
***   stack: red/OS-image/get-wicbitmap 0296BED4h
***   stack: gui/draw-begin 0019FC38h 00000000h 0296BED4h false false
***   stack: do-draw 00000000h 0296BED4h 0296BEE4h false false false false
***   stack: gui/OS-do-draw 0296BED4h 0296BEE4h
***   stack: ctx||445~draw-image 0296BED4h 0296BEE4h
***   stack: draw
***   stack: red/_function/call 0296BE94h 00EE3884h
***   stack: red/interpreter/eval-code 02A53FE8h 02D0BA70h 02D0BA70h false 00000000h 00000000h 02A53FE8h
***   stack: red/interpreter/eval-expression 02D0BA50h 02D0BA70h false false false
***   stack: red/interpreter/eval 0296BE74h true
***   stack: red/natives/catch* true 1
***   stack: ctx||548~try-do 00F01D58h
***   stack: ctx||548~launch 00F01D58h
***   stack: ctx||566~launch 00F017F4h
```

**To reproduce**
```
draw 0x0 [box 0x0 10x10]
```

**Expected behavior**

Empty image

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



