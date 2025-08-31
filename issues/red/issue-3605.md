
#3605: `Assign a reduced block to context's word` will crash exe
================================================================================
Issue is closed, was reported by bitbegin and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3605>

**Describe the bug**

```
Red []

ctx: context [
    path: []
]

ctx/path: reduce [80000000h + 44 80000000h + 60 80000000h 0]
probe ctx/path
```

consider sample code like above, i assign a reduced block to ctx/path, then compile the file to `exe`, the `exe` will be crashed.

```
root size: 2153, root max: 4127, cycles: 0
root size: 2153, root max: 4127, cycles: 1
root size: 2153, root max: 4127, cycles: 2

*** Runtime Error 1: access violation
*** in file: /D/eth-wallet/datatypes/string.reds
*** at line: 1045
***
***   stack: red/string/concatenate-literal-part 0267D264h 00E67000h 15049833
***   stack: red/datatype/mold 0288C574h 0267D264h false false true 00000000h 0 0
***   stack: red/actions/mold 0288C574h 0267D264h false false true 00000000h 0 0
***   stack: red/error/reduce 0267D294h 0267D274h
***   stack: red/error/form 0267D274h 0267D284h 0267D264h -18
***   stack: red/actions/form 0267D274h 0267D284h 0267D264h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* false
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 0267D2A4h
***   stack: red/fire 1 0019FEF8h
***   stack: red/type-check 0266D914h 0 0267D274h
***   stack: probe
```

However, if assign a direct block, will be ok:

```
Red []

ctx: context [
    path: []
]

ctx/path: [2 3];reduce [80000000h + 44 80000000h + 60 80000000h 0]
probe ctx/path
```

**To Reproduce**
compile above sample code to exe, and run exe

**Expected behavior**
should print `[-2147483604 -2147483588 -2147483648 0]`

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Platform version(please complete the following information):**
```
Red 0.6.3 for Windows built 13-Nov-2018/23:49:48+08:00 commit #7404492
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-22T07:42:59Z, qtxie, commented:
<https://github.com/red/red/issues/3605#issuecomment-440940294>

    If I comment [this line](https://github.com/red/red/blob/master/compiler.r#L3123), the issue is fixed. But one of the unit tests will fail.

