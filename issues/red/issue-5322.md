
#5322: Hexadecimal strings starting with a number can be loaded
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5322>

**Describe the bug**
Strings starting with numbers can be loaded and treated as word! if they look like hexadecimal numbers.

**To reproduce**

```red
>> load "1A"
== 1A
>> load "1a"
*** Syntax Error: (line 1) invalid integer at 1a
*** Where: transcode
*** Near : load "1a"
*** Stack: load

>> type? load "1A"
== word!
```

**Expected behavior**
Error.
```red
>> load "1a"
*** Syntax Error: (line 1) invalid integer at 1a
```

**Platform version**
```
Red 0.6.4 for Windows built 20-Feb-2023/10:53:57-04:00  commit #bd5bc29
```



