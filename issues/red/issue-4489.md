
#4489: [CRASH] In SORT/stable
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed] [test.written]
<https://github.com/red/red/issues/4489>

**Describe the bug**
```
sort/compare/stable [1 4 1 1 4 3 1 3 4 4 4 3 1 2 2 5 3] func [a b] [a <= b]
```
Output:
```
*** Runtime Error 19: stack error or overflow
*** in file: /D/devel/red/red-src/red/runtime/datatypes/context.reds
*** at line: 325
***
***   stack: red/_context/get 02B2C860h
***   stack: red/interpreter/eval-expression 02B2C860h 02B2C870h true true false
***   stack: red/interpreter/eval-infix 00093104h 02B2C860h 02B2C870h true
***   stack: red/interpreter/eval-expression 02B2C850h 02B2C870h false true false
***   stack: red/interpreter/eval 02B2C7D8h true
***   stack: red/interpreter/eval-function 026EA2A4h 02B2C7D8h
***   stack: red/_function/call 026EA2A4h 002D3884h
***   stack: red/block/compare-call 02B2C0A0h 02B2C0B0h 40805028 0
***   stack: red/_sort/grail-search-left 02B2C090h 4 02B2C0B0h 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
***   stack: red/_sort/grail-classic-merge 02B2C090h 4 3 16 40805028 0 4459891
```

**Expected behavior**

No crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Jun-2020/18:03:42
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-01T19:41:16Z, greggirwin, commented:
<https://github.com/red/red/issues/4489#issuecomment-637063373>

    Duplicated on Win10 here.

--------------------------------------------------------------------------------

On 2020-06-03T01:58:58Z, qtxie, commented:
<https://github.com/red/red/issues/4489#issuecomment-637907690>

    The underlying algorithm expects 3 states (less than, equal, greater than) returns from the comparison function. We'll see how to improve it later. Here is a workaround:
    ```
    sort/compare/stable [1 4 1 1 4 3 1 3 4 4 4 3 1 2 2 5 3] func [a b] [b - a]
    ```

--------------------------------------------------------------------------------

On 2020-10-27T14:29:15Z, 9214, commented:
<https://github.com/red/red/issues/4489#issuecomment-717283620>

    Would it make sense to map negative/positive/zero to `none` and `false` with` true`? E.g. `check tri-state` in View already uses this kind of 3-valued logic.

