
#5384: Crash when load string which contains emoji
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5384>

**Describe the bug**
Open the CLI console, run this line of code:
```
load "Use😀 arrow keys"
```
```
>> load "Use😀 arrow keys"

*** Runtime Error 1: access violation
*** in file: /D/EE/QW/red/runtime/lexer.reds
*** at line: 1035
***
***   stack: red/lexer/scan-whitespaces 0102FA0Ch 04B82957h 04B82957h 15
***   stack: red/lexer/scan-word 0102FA0Ch 04B82950h 04B82957h -2130706432 false
***   stack: red/lexer/scan-tokens 0102FA0Ch false false
***   stack: red/lexer/scan 04AEF214h 04B82950h 18 false true true false 0102FB80h 00000000h 04AEF204h 00000000h
***   stack: red/lexer/scan-alt 04AEF214h 04AEF204h 18 false true true false 0102FB80h 00000000h 00000000h
***   stack: red/natives/transcode* true -1 -1 -1 -1 -1 -1 -1
***   stack: load
***   stack: red/interpreter/call 04AEF064h 04BD3884h 05797A20h 0
***   stack: red/interpreter/eval-code 05400428h 05797A40h 05797A40h 04AEF044h false 00000000h 00000000h 05400428h 0 false
***   stack: red/interpreter/eval-expression 05797A30h 05797A40h 04AEF044h false false false
***   stack: red/interpreter/eval 04AEF044h true
***   stack: red/natives/catch* true 1
***   stack: ctx||584~try-do 05870460h
***   stack: ctx||584~do-command 05870460h
***   stack: ctx||584~eval-command 05870460h
***   stack: ctx||584~run 05870460h
***   stack: ctx||584~launch 05870460h
***   stack: ctx||603~launch 0586FE4Ch
```

**Expected behavior**
No crashes

**Platform version**
Red 0.6.4 for Windows built 12-Sep-2023/4:39:13+08:00  commit #da41ef8



