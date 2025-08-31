
#5562: [Lexer] `scan` crashes on some point values
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5562>

**Describe the bug**
```
>> scan "(,)"
== error!
>> scan "(,1)"
== error!
>> scan "(, 1)"

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/lexer.reds
*** at line: 1427
***
***   stack: red/lexer/scan-float 04B81FB9h 04B81FB9h
***   stack: red/lexer/load-point 010AF8E0h 04B81FB9h 04B81FBCh 134217728 false
***   stack: red/lexer/scan-tokens 010AF8E0h true false
***   stack: red/lexer/scan 04AF27CCh 04B81FB8h 6 true true false false 010AFA58h 00000000h 04AF27BCh 00000000h
***   stack: red/lexer/scan-alt 04AF27CCh 04AF27BCh 6 true true false false 010AFA58h 00000000h 00000000h
***   stack: red/natives/transcode* false -1 -1 -1 1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 04AF27ACh 0571B3D8h 0571B3D8h 04AF278Ch 04AF277Ch 0571B330h 2 false
***   stack: red/interpreter/eval-code 04AF279Ch 0571B388h 0571B3D8h 04AF278Ch false 04AF277Ch 0571B330h 00000000h 2 false
***   stack: red/natives/apply* true -1 -1
***   stack: scan
***   stack: red/interpreter/call 04AF273Ch 03283884h 057ECC40h 0
***   stack: red/interpreter/eval-code 054C0418h 057ECC60h 057ECC60h 04AF271Ch false 00000000h 00000000h 054C0418h 0 false
***   stack: red/interpreter/eval-expression 057ECC50h 057ECC60h 04AF271Ch false false false
***   stack: red/interpreter/eval 04AF271Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||629~try-do 0329F5A8h
***   stack: ctx||629~do-command 0329F5A8h
***   stack: ctx||629~eval-command 0329F5A8h
***   stack: ctx||629~run 0329F5A8h
***   stack: ctx||629~launch 0329F5A8h
***   stack: ctx||648~launch 0329EF9Ch

>> scan "(1,,1)"

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/lexer.reds
*** at line: 1427
***
***   stack: red/lexer/scan-float 04B01FBBh 04B01FBBh
***   stack: red/lexer/load-point 010AF8E0h 04B01FBBh 04B01FBDh 134217728 false
***   stack: red/lexer/scan-tokens 010AF8E0h true false
***   stack: red/lexer/scan 04A727CCh 04B01FB8h 6 true true false false 010AFA58h 00000000h 04A727BCh 00000000h
***   stack: red/lexer/scan-alt 04A727CCh 04A727BCh 6 true true false false 010AFA58h 00000000h 00000000h
***   stack: red/natives/transcode* false -1 -1 -1 1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 04A727ACh 0570B3D8h 0570B3D8h 04A7278Ch 04A7277Ch 0570B330h 2 false
***   stack: red/interpreter/eval-code 04A7279Ch 0570B388h 0570B3D8h 04A7278Ch false 04A7277Ch 0570B330h 00000000h 2 false
***   stack: red/natives/apply* true -1 -1
***   stack: scan
***   stack: red/interpreter/call 04A7273Ch 01263884h 057DB8C8h 0
***   stack: red/interpreter/eval-code 04BE0418h 057DB8E8h 057DB8E8h 04A7271Ch false 00000000h 00000000h 04BE0418h 0 false
***   stack: red/interpreter/eval-expression 057DB8D8h 057DB8E8h 04A7271Ch false false false
***   stack: red/interpreter/eval 04A7271Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||629~try-do 04B4F5A8h
***   stack: ctx||629~do-command 04B4F5A8h
***   stack: ctx||629~eval-command 04B4F5A8h
***   stack: ctx||629~run 04B4F5A8h
***   stack: ctx||629~launch 04B4F5A8h
***   stack: ctx||648~launch 04B4EF9Ch
```

**To reproduce**
`scan "(, 1)"`
`scan "(,,1)"`
`scan "(1,,1)"`

**Expected behavior**

`error!`

Note that `transcode` accepts these values and defaults missing axes to `0`. If that is not correct, it also should be fixed.

**Platform version**
`Red 0.6.5 for Windows built 9-Nov-2024/4:54:12+07:00  commit #fc80690`


