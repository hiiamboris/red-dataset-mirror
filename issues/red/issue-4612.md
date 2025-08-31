
#4612: crash on processing Redbin-encoded MONEY! literal
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
<https://github.com/red/red/issues/4612>

**Describe the bug**
Redbin decoder crashes while allocating `money!` slot.

**To reproduce**
The following snippet:
```red
Red [] probe [red$0]
```

When compiled and executed, results in:
```red
*** Runtime Error 1: access violation
*** in file: .../red/runtime/datatypes/word.reds
*** at line: 151
***
***   stack: red/word/get-in 00000000h 0
***   stack: red/money/get-currency-code 155
***   stack: red/money/make-in 02D34D10h false 155 02AFBD15h
***   stack: red/redbin/decode-money 02AFBD10h 02A82E94h false
***   stack: red/redbin/decode-value 02AFBD10h 02ABB268h 02A82E94h
***   stack: red/redbin/decode-block 02AFBD10h 02ABB268h 004C3BCCh false
***   stack: red/redbin/decode-value 02AFBD04h 02ABB268h 004C3BCCh
***   stack: red/redbin/decode 004AD0B0h 004C3BCCh
***   stack: red/redbin/boot-load 004AD0B0h false
***   stack: red/init
```

That seems to be happening because `system/locale/currencies/list` is absent at this stage of runtime booting process.
https://github.com/red/red/blob/31a42c81d7e908b3ea85d7e580d22e63fe487dca/runtime/datatypes/money.reds#L193

**Expected behavior**
```red
[RED$0.00]
```

**Platform version**
31a42c8



Comments:
--------------------------------------------------------------------------------

On 2020-08-07T18:35:12Z, 9214, commented:
<https://github.com/red/red/issues/4612#issuecomment-670653245>

    Disregard, this appeared to be a Heisenbug where `system/locale` was set to `none` for some reason, could be a PEBKAC.

