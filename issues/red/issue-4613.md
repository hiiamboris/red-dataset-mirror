
#4613: compiled script crashes on MONEY! literal with user-defined currency code
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/4613>

**Describe the bug**
`money!` with custom currency codes rely on `system/locale/currencies/list` which is checked at run-time: if the currency is not in it then it deemed to be invalid.

Since the extension of this list with custom currencies can happen only at run-time, the compiler cannot say whether given `money!` literal is valid or not. To resolve this problem, a custom `Currencies` field was added to the script header, which is processed at compile-time to extract user-defined currencies: the pre-defined list of currencies is copied and merged with the `block!` of user-defined ones.

The logic of this processing, however, seems to be flawed.

**To reproduce**

#### 1
```red
Red [] probe bug$0
```
```red
*** Runtime Error 98: assertion failed
*** in file: .../runtime/datatypes/money.reds
*** at line: 191
***
***   stack: red/money/get-currency-code 98
***   stack: red/money/get-currency-code 0
***   stack: red/money/make-in 02643194h false 0 004C807Ch
***   stack: red/money/push false 0 004C807Ch
```

`get-currency-code` expects a 1-based index in the currency list and is given a `0` (no clue about the top-level call with `98` though, looks like an error-reporting issue; note that `98` is also an ID of runtime error being reported).

https://github.com/red/red/blob/01a2e5d03358b115d520f685b64151627230c5f6/compiler.r#L256-L261

So, if currency code is not in the extracted list, and not in the one defined inside the header, then its index is a `0`. I'd rather expect a compile-time error on invalid `money!` literal.

#### 2
```red
Red [Currencies: [bug]] probe bug$0
```

```red
*** Runtime Error 1: access violation
*** in file: .../red/runtime/datatypes/string.reds
*** at line: 940
***
***   stack: red/string/alter 02B531B4h 02C30018h -1 0 true 0
***   stack: red/string/concatenate 02B531B4h 02C30018h -1 0 true false
***   stack: red/string/form 02C30018h 02B531B4h 02B531A4h 0
***   stack: red/word/form 004C1EC8h 02B531B4h 02B531A4h 0
***   stack: red/money/form-money 02B531A4h 02B531B4h 0 false false
***   stack: red/money/mold 02B531A4h 02B531B4h false false false 02B53194h 0 0
***   stack: red/actions/mold 02B531A4h 02B531B4h false false false 02B53194h 0 0
***   stack: red/actions/mold* -1 -1 -1 -1
***   stack: probe
```

This time the currency code is in the list, and its index is somewhere between `1` and `255`. The problem though is that the _original_ `system/locale/currencies/list` was not extended by the compiler and does not contain the said currency. The copy that it used for processing was just that, a copy.

So, when `money!` value is `mold`ed, its currency code is `pick`ed from the currency list. And since the currency index is greater than the list's length, `pick` picks past the tail, and the resulting value is `none!` rather than `word!`. The crash happens when `word/form` is called on it.

https://github.com/red/red/blob/01a2e5d03358b115d520f685b64151627230c5f6/runtime/datatypes/money.reds#L563

Since the currency list cannot be extended at compile-time, perhaps the compiler can emit code that, at run-time, will append custom currencies to the list.

#### 3
```red
Red [Currencies: [bug]] append system/locale/currencies/list 'bug probe bug$0
```

```red
BUG$0.00
```

This time the currency list is extended at run-time. But then what's the point of `Currencies` field? Ideally, I'd expect a run-time error since I add the same currency code (at run-time) _after_ it was added there by the compiler (e.g. with emitted code as was proposed earlier).

**Expected behavior**
Described in the 3 cases above. To sum it up, I think that static `Currencies` list in the header and manual extension of `system/locale/currencies/list` at run-time should be mutually-exclusive options, with the former being a shortcut for the latter, supported both by the compiler (incomplete, as demonstrated) and the interpreter (IIRC it processes the list on file loading).

**Platform version**
01a2e5d



Comments:
--------------------------------------------------------------------------------

On 2020-10-22T16:11:19Z, dockimbel, commented:
<https://github.com/red/red/issues/4613#issuecomment-714600338>

    Now:
    - 1 will result in a compilation error.
    - 2 will work as expected
    - 3 will result in a run-time error.
    
    @9214 I let you write the regression tests for this one.

