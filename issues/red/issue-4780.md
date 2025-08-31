
#4780: CRASH on size-text of rich-text
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4780>

**Describe the bug**
```
>> lt: rtd-layout [""] ()
>> lt/font: make font! [] ()
>> size-text lt

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/direct2d.reds
*** at line: 994
***
***   stack: gui/set-text-format 00000000h 02C48710h
***   stack: gui/OS-text-box-layout 0270C644h 00F204D0h 0 false
***   stack: ctx||469~text-box-metrics 0270C644h 0270C654h 3
***   stack: size-text
***   stack: red/_function/call 0270C604h 00ED3884h
***   stack: red/interpreter/eval-code 028E3C18h 02C4AA48h 02C4AA48h false 00000000h 00000000h 028E3C18h
***   stack: red/interpreter/eval-expression 02C4AA38h 02C4AA48h false false false
***   stack: red/interpreter/eval 0270C5E4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||578~try-do 00EF1CB8h
***   stack: ctx||578~do-command 00EF1CB8h
***   stack: ctx||578~eval-command 00EF1CB8h
***   stack: ctx||578~run 00EF1CB8h
***   stack: ctx||578~launch 00EF1CB8h
***   stack: ctx||597~launch 00EF1768h
```
D2D branch is free of this crash

**Expected behavior**
```
>> lt: rtd-layout [""] ()
>> size-text lt
== 0x15
```

**Platform version**
```
Red 0.6.4 for Windows built 25-Dec-2020/16:45:17 (master)
```



Comments:
--------------------------------------------------------------------------------

On 2021-09-27T01:20:45Z, qtxie, commented:
<https://github.com/red/red/issues/4780#issuecomment-927430166>

    Fixed by merging D2D branch into master.

