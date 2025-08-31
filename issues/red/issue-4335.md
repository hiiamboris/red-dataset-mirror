
#4335: [CRASH] when appending strings to hash
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4335>

**Describe the bug**

Paste this into console:
```
t: make hash! []
repeat i 3 [print head insert/part t s: "abc" at s i]
```
Result:
```
>> t: make hash! []
== make hash! []
>> repeat i 3 [print head insert/part t s: "abc" at s i]
abc
abc abc

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/hashtable.reds
*** at line: 802
***
***   stack: red/_hashtable/put 00A2FF50h 02D26F88h
***   stack: red/block/insert 028C19D4h 028C19E4h 028C19F4h false 028C19C4h false
***   stack: red/actions/insert 028C19D4h 028C19E4h 028C19F4h false 028C19C4h false
***   stack: red/actions/insert* 2 -1 -1
***   stack: red/interpreter/eval-arguments 029BF8C0h 02D261D0h 02D261D0h 02D26160h 02D26888h
***   stack: red/interpreter/eval-code 029BF8C0h 02D26170h 02D261D0h true 02D26160h 02D26888h 029BF8C0h
***   stack: red/interpreter/eval-path 02D26160h 02D26170h 02D261D0h false false true false
***   stack: red/interpreter/eval-expression 02D26170h 02D261D0h false true false
***   stack: red/interpreter/eval-arguments 029BF940h 02D26160h 02D261D0h 00000000h 00000000h
***   stack: red/interpreter/eval-code 029BF940h 02D26160h 02D261D0h true 00000000h 00000000h 029BF940h
***   stack: red/interpreter/eval-expression 02D26160h 02D261D0h false true false
***   stack: red/interpreter/eval-arguments 029C0560h 02D26150h 02D261D0h 00000000h 00000000h
***   stack: red/interpreter/eval-code 029C0560h 02D26150h 02D261D0h false 00000000h 00000000h 029C0560h
***   stack: red/interpreter/eval-expression 02D26150h 02D261D0h false false false
***   stack: red/interpreter/eval 028C1994h true
***   stack: red/natives/repeat* false
***   stack: red/interpreter/eval-arguments 029C03D0h 02D260C8h 02D260C8h 00000000h 00000000h
***   stack: red/interpreter/eval-code 029C03D0h 02D26098h 02D260C8h false 00000000h 00000000h 029C03D0h
***   stack: red/interpreter/eval-expression 02D26098h 02D260C8h false false false
***   stack: red/interpreter/eval 028C1944h true
***   stack: red/natives/catch* true 1
***   stack: ctx||534~try-do 009B001Ch
***   stack: ctx||534~do-command 009B001Ch
***   stack: ctx||534~eval-command 009B001Ch
***   stack: ctx||534~run 009B001Ch
***   stack: ctx||534~launch 009B001Ch
***   stack: ctx||552~launch 009AFB64h
```
Build #4097 also crashes but with additional info, indicating that even the second insertion derails:
```
>> t: make hash! []
== make hash! []
>> repeat i 3 [print head insert/part t s: "abc" at s i]
abc
*** MEMGUARD ALERT: access to unallowed memory region detected
    requested region:   02C98340..02C98344
  * Defined regions so far are:
                1       02C98460..02C984E0 (node=02190AC8)
                2       02C98348..02C98448 (node=02190ACC)

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/hashtable.reds
*** at line: 1189
***
***   stack: red/_hashtable/refresh 00000062h 4396433 2 1636052 false
***   stack: red/_hashtable/refresh 02190AD4h 0 0 1 true
***   stack: red/block/insert 028F1534h 028F1544h 028F1554h false 028F1524h false
***   stack: red/actions/insert 028F1534h 028F1544h 028F1554h false 028F1524h false
***   stack: red/actions/insert* 2 -1 -1
***   stack: red/interpreter/eval-arguments 029EF8C0h 02C98748h 02C98748h 02C986D8h 02C98E00h
***   stack: red/interpreter/eval-code 029EF8C0h 02C986E8h 02C98748h true 02C986D8h 02C98E00h 029EF8C0h
***   stack: red/interpreter/eval-path 02C986D8h 02C986E8h 02C98748h false false true false
***   stack: red/interpreter/eval-expression 02C986E8h 02C98748h false true false
***   stack: red/interpreter/eval-arguments 029EF940h 02C986D8h 02C98748h 00000000h 00000000h
***   stack: red/interpreter/eval-code 029EF940h 02C986D8h 02C98748h true 00000000h 00000000h 029EF940h
***   stack: red/interpreter/eval-expression 02C986D8h 02C98748h false true false
***   stack: red/interpreter/eval-arguments 029F0560h 02C986C8h 02C98748h 00000000h 00000000h
***   stack: red/interpreter/eval-code 029F0560h 02C986C8h 02C98748h false 00000000h 00000000h 029F0560h
***   stack: red/interpreter/eval-expression 02C986C8h 02C98748h false false false
***   stack: red/interpreter/eval 028F14F4h true
***   stack: red/natives/repeat* false
***   stack: red/interpreter/eval-arguments 029F03D0h 02C98640h 02C98640h 00000000h 00000000h
***   stack: red/interpreter/eval-code 029F03D0h 02C98610h 02C98640h false 00000000h 00000000h 029F03D0h
***   stack: red/interpreter/eval-expression 02C98610h 02C98640h false false false
***   stack: red/interpreter/eval 028F14A4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||513~try-do 020E092Ch
***   stack: ctx||513~do-command 020E092Ch
***   stack: ctx||513~eval-command 020E092Ch
***   stack: ctx||513~run 020E092Ch
***   stack: ctx||513~launch 020E092Ch
***   stack: ctx||530~launch 020E0474h
```
The blamed line https://github.com/red/red/blob/f4546b96c255d2c8dd200f0d2289a2c7f3bfdb85/runtime/hashtable.reds#L1188-L1190 and crash report tell us that it's writing data 8 bytes prior to series' buffer offset (at 340-344 whereas it starts at 348). I've checked: `i` is `-1` at that time.

**Expected behavior**

No crash

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-14T05:24:22Z, qtxie, commented:
<https://github.com/red/red/issues/4335#issuecomment-599013856>

    I didn't get the crash on Win10. But if I add an assertion `assert i <> -1` after the line @hiiamboris pointed out, I got an assertion failed.

--------------------------------------------------------------------------------

On 2020-03-14T09:52:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4335#issuecomment-599034718>

    The fix worked, thank you!

--------------------------------------------------------------------------------

On 2020-08-18T20:14:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4335#issuecomment-675690005>

    ```
    >> h: make hash! 40
    == make hash! []
    >> loop 1000 [insert h "ok"]
    
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
    *** at line: 723
    ***
    ***   stack: red/string/equal? 032FB680h 032F7C50h 0 false
    ***   stack: red/string/compare 032FB680h 032F7C50h 0
    ***   stack: red/actions/compare 032FB680h 032F7C50h 0
    ***   stack: red/_hashtable/put 0030B284h 032F7C50h
    ***   stack: red/block/insert 03007F74h 03007F84h 03007F64h false 03007F64h false
    ***   stack: red/actions/insert 03007F74h 03007F84h 03007F64h false 03007F64h false
    ***   stack: red/actions/insert* -1 -1 -1
    ***   stack: red/interpreter/eval-arguments 03007F64h 032F2758h 032F2758h 00000000h 00000000h 030EFEC8h
    ***   stack: red/interpreter/eval-code 030EFEC8h 032F2738h 032F2758h false 00000000h 00000000h 030EFEC8h
    ***   stack: red/interpreter/eval-expression 032F2738h 032F2758h false false false
    ***   stack: red/interpreter/eval 03007F54h true
    ***   stack: red/natives/loop* false
    ***   stack: red/interpreter/eval-arguments 03007F34h 032F27A0h 032F27A0h 00000000h 00000000h 030F0AA8h
    ***   stack: red/interpreter/eval-code 030F0AA8h 032F2780h 032F27A0h false 00000000h 00000000h 030F0AA8h
    ***   stack: red/interpreter/eval-expression 032F2780h 032F27A0h false false false
    ***   stack: red/interpreter/eval 03007F14h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||573~try-do 00311EB4h
    ***   stack: ctx||573~do-command 00311EB4h
    ***   stack: ctx||573~eval-command 00311EB4h
    ***   stack: ctx||573~run 00311EB4h
    ***   stack: ctx||573~launch 00311EB4h
    ```

--------------------------------------------------------------------------------

On 2020-08-19T18:41:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/4335#issuecomment-676595115>

    Please add regression tests @qtxie 

--------------------------------------------------------------------------------

On 2021-09-18T16:53:31Z, dockimbel, commented:
<https://github.com/red/red/issues/4335#issuecomment-922339030>

    Last mentioned issue has been fixed, so I'm closing this ticket.

