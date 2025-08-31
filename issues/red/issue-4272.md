
#4272: TO-BINARY with ANY-LIST argument behaves incorrectly except for BLOCKs
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
<https://github.com/red/red/issues/4272>

**Describe the bug**
`to-binary` is (amongst others) defined for `any-list!` arguments; in actual fact, applying it to a `paren!` or `hash!` value gives a stack overflow error

**To reproduce**
```
>> to-binary [1 2 3]
== #{010203}
>> to-binary make hash! [1 2 3]
*** Internal Error: stack overflow
*** Where: to
*** Stack: to-binary  
>> to-binary quote (1 2 3)
*** Internal Error: stack overflow
*** Where: to
*** Stack: to-binary  
```

**Expected behavior**
Should treat hashes and parens as the equivalent block.



