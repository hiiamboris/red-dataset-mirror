
#5398: Redbin CRASHES when trying to save evaluated code blocks
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5398>

**Describe the bug**

```
*** Runtime Error 98: assertion failed
*** in file: /d/devel/red/red-src/master/runtime/redbin.reds
*** at line: 1545
***
***   stack: red/redbin/encode-word 05775028h 15 05371E2Ch 05371E3Ch 05371E4Ch 05371E5Ch
***   stack: red/redbin/encode-value 05775028h 05371E2Ch 05371E3Ch 05371E4Ch 05371E5Ch
***   stack: red/redbin/encode-block 05775078h 25 05371E2Ch 05371E3Ch 05371E4Ch 05371E5Ch
***   stack: red/redbin/encode-value 05775078h 05371E2Ch 05371E3Ch 05371E4Ch 05371E5Ch
***   stack: red/redbin/encode-block 05371E0Ch 5 05371E2Ch 05371E3Ch 05371E4Ch 05371E5Ch
***   stack: red/redbin/encode-value 05371E0Ch 05371E2Ch 05371E3Ch 05371E4Ch 05371E5Ch
***   stack: red/redbin/encode 05371E0Ch
***   stack: ctx||323~encode 05371E0Ch 05371E1Ch
***   stack: red/interpreter/exec-routine 05371DFCh
***   stack: red/interpreter/eval-code 05538628h 05775270h 05775270h 05371DCCh true 05775240h 05775148h 056F0EE0h 0 false
***   stack: red/interpreter/eval-path 05775148h 05775250h 05775270h 05371DCCh false false true false
***   stack: red/interpreter/eval-expression 05775250h 05775270h 05371DCCh false true false
***   stack: red/interpreter/eval-arguments 05456438h 05775240h 05775270h 05371DCCh 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 05456438h 05775240h 05775270h 05371DCCh false 00000000h 00000000h 05456438h 0 false
***   stack: red/interpreter/eval-expression 05775240h 05775270h 05371DCCh false false false
***   stack: red/interpreter/eval 05371DCCh true
***   stack: red/natives/catch* true 1
***   stack: ctx||626~try-do 0342F790h
***   stack: ctx||626~launch 0342F790h
***   stack: ctx||645~launch 0342F17Ch
```

**To reproduce**

Run this:
```
Red []

code: [copy/part "x" 1]									;) <-- /part triggers the bug
do code													;) <-- the culprit
probe system/codecs/redbin/encode load mold code none	;) this succeeds
probe system/codecs/redbin/encode code none				;) this crashes
```

**Expected behavior**

Successful encoding.

**Platform version**
`Red 0.6.4 for Windows built 7-Oct-2023/15:51:08+03:00  commit #0c72515`


Comments:
--------------------------------------------------------------------------------

On 2023-10-08T18:54:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5398#issuecomment-1752130341>

    Seems like interpreter's path cache and Redbin don't play well together.

--------------------------------------------------------------------------------

On 2023-10-10T15:43:14Z, dockimbel, commented:
<https://github.com/red/red/issues/5398#issuecomment-1755717685>

    This is a regression caused by the changes in the interpreter related to function's spec caching.

--------------------------------------------------------------------------------

On 2023-10-11T11:15:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/5398#issuecomment-1757454273>

    This issue needs additional fix:
    ```
    do code: [copy/part "x" 1]
    probe encoded: system/codecs/redbin/encode code none
    probe system/codecs/redbin/decode encoded
    ```
    Can't be loaded back:
    ```
    #{
    52454442494E0204010000004800000002000000100000000000000008000000
    636F707900000000706172740000000005000000000000000300000019000000
    00000000020000000F00000200000000450000000F0000000100000001000000
    070100000000000001000000780000000B00000001000000
    }
    *** Script Error: REDBIN - invalid record at index 117
    *** Where: decode
    *** Near : probe system/codecs/redbin/decode encoded
    *** Stack: probe
    ```

