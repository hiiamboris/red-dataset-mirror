
#4994: CRASH during transcode of a long string
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4994>

**Describe the bug**
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/common/unicode.reds
*** at line: 159
***
***   stack: red/unicode/cp-to-utf8 167 078FAFFFh
***   stack: red/unicode/to-utf8-buffer 04989D9Ch 078FAFFFh 1000002
***   stack: red/lexer/scan-alt 04989DACh 04989D9Ch 1000002 false true true false 00FFF2C8h 00000000h 00000000h
***   stack: red/natives/transcode* false -1 -1 -1 -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 04989D8Ch 0569FB88h 0569FB88h 00000000h 00000000h 04AB1418h
***   stack: red/interpreter/eval-code 04AB1418h 0569FB68h 0569FB88h false 00000000h 00000000h 04AB1418h
***   stack: red/interpreter/eval-expression 0569FB68h 0569FB88h false false false
***   stack: red/interpreter/eval 04989D8Ch true
***   stack: red/natives/do* false 1 -1 -1
(...)
```

**To reproduce**

Run this code in console:
```
save %123 append/dup "" "§" 1000000
transcode read %123
```

**Platform version**
```
Red 0.6.4 for Windows built 6-Nov-2021/19:36:18+03:00  commit #30e5312
```



