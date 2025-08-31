
#4273: TO-BINARY with BLOCK argument arbitrarily limits integer components 
================================================================================
Issue is open, was reported by meijeru and has 0 comment(s).
[type.wish]
<https://github.com/red/red/issues/4273>

**Describe the bug**
`to-binary` with an integer argument yields 4 bytes; `to-binary` with a block argument is supposed to simply concatenate the results for the components; however, for integer components it requires them to be smaller than 255 (negative values are allowed but clipped to one byte); this seems an unnecessary and arbitrary restriction

**To reproduce**
```
>> to-binary [1]
== #{01}
>> to-binary [1000]
*** Script Error: value out of range: 1000
*** Where: to
*** Stack: to-binary  
>> to-binary [-1]
== #{FF}
>> to-binary [-1000]
== #{18}
```

**Expected behavior**
Integer components of the block argument should not be restricted and always yield 4 bytes



