
#5097: [Regression] CRASH caused by `case/all` in some circumstances
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5097>

**Describe the bug**
```
probe trace/raw [case/all [yes [1] no [2]]]
```
Crashes with:
```
INIT -1 none none 27x29
ENTER 0 none none 29x29
FETCH 0 none case/all 29x29
ENTER 0 none none 29x29
FETCH 0 none case 29x29
OPEN 1 none case 29x29
FETCH 1 none [yes [1] no [2]] 30x30
PUSH 1 none [yes [1] no [2]] 30x31
CALL 2 case/all make native! [[{Evaluates the  30x31
FETCH 0 none yes 32x32
PUSH 0 none true 32x32
EXPR 1 none true 32x32
ENTER 0 none none 30x30
FETCH 0 none 1 30x30
PUSH 0 none 1 30x30
EXPR 1 none 1 30x30
EXIT 1 none 1 30x30

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/block.reds
*** at line: 50
***
***   stack: red/block/rs-head 048B8D1Ch
***   stack: red/interpreter/eval-expression 054D6048h 054D6068h 048B8D1Ch false false false
***   stack: red/interpreter/eval-next 048B8D1Ch 054D6048h 054D6068h false
***   stack: red/natives/case* false 1
***   stack: red/interpreter/eval-arguments 048B8CFCh 054D60A0h 054D60A0h 048B8CDCh 054D6080h 054D5FA0h 049FFF18h
***   stack: red/interpreter/eval-code 049FFF18h 054D6090h 054D60A0h 048B8CDCh true 054D6080h 054D5FA0h 049FFF18h
***   stack: red/interpreter/eval-path 054D6080h 054D6090h 054D60A0h 048B8CDCh false false false false
***   stack: red/interpreter/eval-expression 054D6090h 054D60A0h 048B8CDCh false false false
***   stack: red/interpreter/eval 048B8CDCh true
***   stack: red/natives/do* true -1 -1 -1 1
***   stack: ctx||370~do-handler 049DC85Ch
***   stack: trace 049DC85Ch
***   stack: red/_function/call 048B8C1Ch 049DC85Ch 054D60E8h 0
***   stack: red/interpreter/eval-code 04A00CE8h 054D6108h 054D6108h 048B8BECh true 054D60E8h 054D5F68h 04A00CE8h
***   stack: red/interpreter/eval-path 054D60E8h 054D60F8h 054D6108h 048B8BECh false false true false
***   stack: red/interpreter/eval-expression 054D60F8h 054D6108h 048B8BECh false true false
***   stack: red/interpreter/eval-arguments 04A04B28h 054D60E8h 054D6108h 048B8BECh 00000000h 00000000h 04A04B28h
***   stack: red/interpreter/eval-code 04A04B28h 054D60E8h 054D6108h 048B8BECh false 00000000h 00000000h 04A04B28h
***   stack: red/interpreter/eval-expression 054D60E8h 054D6108h 048B8BECh false false false
***   stack: red/interpreter/eval 048B8BECh true
***   stack: red/natives/catch* true 1
***   stack: ctx||502~try-do 049DA3B4h
***   stack: ctx||502~launch 049DA3B4h
***   stack: ctx||521~launch 049D9DC8h
```

Was working in `red-22dec21-328c90422.exe`, but not in `red-14jan22-4923e3265.exe` and later builds

**Expected behavior**

`case` returns `false`

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-08T18:07:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/5097#issuecomment-1062060467>

    [`a07404305f520175ed858c498138a280627c2c63 is the first bad commit`](https://github.com/red/red/commit/a07404305f520175ed858c498138a280627c2c63)

--------------------------------------------------------------------------------

On 2022-03-10T13:32:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/5097#issuecomment-1064068938>

    This is not a tracer bug as turns out. This code crashes GUI console on W10:
    ```
    		case/all [
    			true  [while [false] []]
    			false []
    		]
    ```
    ```
    Red 0.6.4 for Windows built 10-Mar-2022/13:22:03
    
    *** Runtime Error 98: assertion failed
    *** in file: /D/devel/red/red-src/red/runtime/interpreter.reds
    *** at line: 1097
    ***
    ***   stack: red/interpreter/eval-expression 057E1928h 057E1948h 01320BCCh false false false
    ***   stack: red/interpreter/eval-next 01320BCCh 057E1928h 057E1948h false
    ***   stack: red/natives/case* false 1
    ***   stack: red/interpreter/eval-arguments 01320BACh 057E1980h 057E1980h 01320B8Ch 057E1960h 057E1810h 053DFF18h
    ***   stack: red/interpreter/eval-code 053DFF18h 057E1970h 057E1980h 01320B8Ch true 057E1960h 057E1810h 053DFF18h
    ***   stack: red/interpreter/eval-path 057E1960h 057E1970h 057E1980h 01320B8Ch false false false false
    ***   stack: red/interpreter/eval-expression 057E1970h 057E1980h 01320B8Ch false false false
    ***   stack: red/interpreter/eval 01320B8Ch true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||587~try-do 012C0D10h
    ***   stack: ctx||587~do-command 012C0D10h
    ***   stack: ctx||587~eval-command 012C0D10h
    ***   stack: ctx||587~run 012C0D10h
    ***   stack: ctx||587~launch 012C0D10h
    ***   stack: ctx||622~launch 012C03DCh
    ```

