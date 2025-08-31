
#3491: debase(64) crash the console, when the string include ";"
================================================================================
Issue is closed, was reported by bitbegin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3491>

### Expected behavior
not crash the console
### Actual behavior
crash the console with log:

```
*** Runtime Error 1: access violation
*** in file: /D/code/red/runtime/datatypes/string.reds
*** at line: 377
***
***   stack: red/string/get-char 02CF1000h 1
***   stack: red/binary/decode-64 02CF1000h -764895 1
***   stack: red/natives/debase* false 1
***   stack: red/interpreter/eval-arguments 02920934h 02C35F54h 02C35F54h 02C35F24h 02C3606Ch
***   stack: red/interpreter/eval-code 02920934h 02C35F34h 02C35F54h true 02C35F24h 02C3606Ch 02920934h
***   stack: red/interpreter/eval-path 02C35F24h 02C35F34h 02C35F54h false false false false
***   stack: red/interpreter/eval-expression 02C35F34h 02C35F54h false false false
***   stack: red/interpreter/eval 001F6DECh true
***   stack: red/natives/catch* true 1
***   stack: ctx460~try-do 02AE1A6Ch
***   stack: ctx460~do-command 02AE1A6Ch
***   stack: ctx460~eval-command 02AE1A6Ch
***   stack: ctx460~run 02AE1A6Ch
***   stack: ctx460~launch 02AE1A6Ch
***   stack: ctx491~launch 02AE0CECh
```

### Steps to reproduce the problem
```
debase/base ";" 64
```
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 814 date: 28-Jul-2018/18:04:10 commit: #5b7775c3a025bad21a3738cb45d916ebbeab2ec4 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


