
#5484: Bitsets equality compares implementation artifacts, not actual bit values
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/red/issues/5484>

**Describe the bug**

```
>> (make bitset! 100) = (make bitset! 0)
== false
>> (remove/key charset "❓b" "❓") = (charset "b")
== false
```

Also related: https://github.com/red/red/issues/614 #5480 

**To reproduce**
```
(make bitset! 100) = (make bitset! 0)
(remove/key charset "❓b" "❓") = (charset "b")
```

**Expected behavior**

I expect bitsets to compare equal as long as for every bit `n` in the allowed range `(find bitset1 n) = (find bitset2 n)`. 

Strict equality could compare the implementation details, but it doesn't seem useful at a glance, so I would vote it to also behave same as normal equality.

**Platform version**
`Red 0.6.5 for Windows built 17-Feb-2024/10:32:56+03:00  commit #58b8f89`


