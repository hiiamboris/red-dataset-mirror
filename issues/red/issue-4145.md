
#4145: Regression: `take` and `random` won't work in debug console
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [test.written]
<https://github.com/red/red/issues/4145>

**Describe the bug**
```
>> take "a"

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/ownership.reds
*** at line: 226
***
***   stack: red/ownership/check 00000062h 0043075Bh 0000000Ah 47696196 44504548
***   stack: red/ownership/check 02A715E4h 02A5DBF4h 00000000h 0 0
***   stack: red/string/take 02A715E4h 02A715C4h false false
***   stack: red/actions/take 02A715D4h 02A715C4h false false
***   stack: red/actions/take* -1 -1 -1
***   stack: red/interpreter/eval-arguments 02B6FAD0h 02D7C7B8h 02D7C7B8h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02B6FAD0h 02D7C7A8h 02D7C7B8h false 00000000h 00000000h 02B6FAD0h
***   stack: red/interpreter/eval-expression 02D7C7A8h 02D7C7B8h false false false
***   stack: red/interpreter/eval 02A715A4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||513~try-do 003F092Ch
***   stack: ctx||513~do-command 003F092Ch
***   stack: ctx||513~eval-command 003F092Ch
***   stack: ctx||513~run 003F092Ch
***   stack: ctx||513~launch 003F092Ch
***   stack: ctx||530~launch 003F0474h
```

```
>> random/only "1"

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/ownership.reds
*** at line: 226
***
***   stack: red/ownership/check 00000062h 0043075Bh 0000000Ah 47237680 5332000
***   stack: red/ownership/check 029615D4h 0294DBA4h 00000000h 0 2
***   stack: red/_series/random 029615D4h false false true
***   stack: red/actions/random 029615D4h false false true
***   stack: red/actions/random* -1 -1 1
***   stack: red/interpreter/eval-arguments 02A5FA90h 02D0C760h 02D0C760h 02D0C740h 02D0C890h
***   stack: red/interpreter/eval-code 02A5FA90h 02D0C750h 02D0C760h true 02D0C740h 02D0C890h 02A5FA90h
***   stack: red/interpreter/eval-path 02D0C740h 02D0C750h 02D0C760h false false false false
***   stack: red/interpreter/eval-expression 02D0C750h 02D0C760h false false false
***   stack: red/interpreter/eval 029615A4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||513~try-do 0037092Ch
***   stack: ctx||513~do-command 0037092Ch
***   stack: ctx||513~eval-command 0037092Ch
***   stack: ctx||513~run 0037092Ch
***   stack: ctx||513~launch 0037092Ch
***   stack: ctx||530~launch 00370474h
```

**Expected behavior**

No crash.


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Nov-2019/21:01:43+03:00 commit #aa7c46e
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-22T23:19:11Z, 9214, commented:
<https://github.com/red/red/issues/4145#issuecomment-557730162>

    Courtesy of https://github.com/red/red/issues/4102

