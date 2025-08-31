
#4794: PUT & DELETE requests CRASH on Linux
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/4794>

**Describe the bug**
```
>> write/binary/info https://example.com [PUT [] #{badbad}]

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/unicode.reds
*** at line: 208
***
***   stack: red/unicode/str-to-utf8 FF81F7C0h FF81F800h false
***   stack: red/unicode/to-utf8 FF81F7C0h FF81F800h
***   stack: red/simple-io/request-http 126 08B16C9Ch F4C57370h F4C57380h true false true
***   stack: red/url/write 08B16C9Ch F4C57380h true false true false 08B16C8Ch 08B16C8Ch 08B16C8Ch 08B16C8Ch
***   stack: red/actions/write 08B16C9Ch 08B16CACh true false true false 08B16C8Ch 08B16C8Ch 08B16C8Ch 08B16C8Ch
***   stack: red/actions/write* 2 -1 2 -1 -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 08B16C8Ch F4C573D8h F4C573D8h F4C573A8h F4C57290h F4E883D8h
***   stack: red/interpreter/eval-code F4E883D8h F4C573B8h F4C573D8h true F4C573A8h F4C57290h F4E883D8h
***   stack: red/interpreter/eval-path F4C573A8h F4C573B8h F4C573D8h false false false false
***   stack: red/interpreter/eval-expression F4C573B8h F4C573D8h false false false
***   stack: red/interpreter/eval 08B16C6Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||575~try-do F4B4EDD4h
***   stack: ctx||575~do-command F4B4EDD4h
***   stack: ctx||575~eval-command F4B4EDD4h
***   stack: ctx||575~run F4B4EDD4h
***   stack: ctx||575~launch F4B4EDD4h
***   stack: ctx||594~launch F4B4E86Ch
***   stack: ***_start
```
```
>> write/binary/info https://example.com [DELETE [] #{badbad}]

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/unicode.reds
*** at line: 208
***
***   stack: red/unicode/str-to-utf8 FFA34670h FFA346B0h false
***   stack: red/unicode/to-utf8 FFA34670h FFA346B0h
***   stack: red/simple-io/request-http 216 0A062C9Ch F4CD2478h F4CD2488h true false true
***   stack: red/url/write 0A062C9Ch F4CD2488h true false true false 0A062C8Ch 0A062C8Ch 0A062C8Ch 0A062C8Ch
***   stack: red/actions/write 0A062C9Ch 0A062CACh true false true false 0A062C8Ch 0A062C8Ch 0A062C8Ch 0A062C8Ch
***   stack: red/actions/write* 2 -1 2 -1 -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 0A062C8Ch F4CD24E0h F4CD24E0h F4CD24B0h F4CD2398h F4EFE3D8h
***   stack: red/interpreter/eval-code F4EFE3D8h F4CD24C0h F4CD24E0h true F4CD24B0h F4CD2398h F4EFE3D8h
***   stack: red/interpreter/eval-path F4CD24B0h F4CD24C0h F4CD24E0h false false false false
***   stack: red/interpreter/eval-expression F4CD24C0h F4CD24E0h false false false
***   stack: red/interpreter/eval 0A062C6Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||575~try-do F4BC4DD4h
***   stack: ctx||575~do-command F4BC4DD4h
***   stack: ctx||575~eval-command F4BC4DD4h
***   stack: ctx||575~run F4BC4DD4h
***   stack: ctx||575~launch F4BC4DD4h
***   stack: ctx||594~launch F4BC486Ch
***   stack: ***_start
```

**Expected behavior**
```
>> write/binary/info https://example.com [DELETE [] #{badbad}]
== [405 #(
    Cache-Control: "max-age=604800"
    Date: "Thu, 07 J...
>> write/binary/info https://example.com [PUT [] #{badbad}]
*** Access Error: cannot connect: https://example.com reason: timeout
*** Where: write
*** Stack:  
```

**Platform version**
```
Red 0.6.4 for Linux built 7-Jan-2021/20:12:05
Debian 9 VM
```



