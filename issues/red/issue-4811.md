
#4811: FOREACH returns a block instead of the last value when compiled
================================================================================
Issue is open, was reported by endo64 and has 2 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4811>

**Describe the bug**
`foreach` returns a block instead of the last value of the body block when compiled.

**To reproduce**
```
probe foreach v [1 2 3] [4]
; == [] when compiled
; == 4 when interpreted
```

**Expected behavior**
It should return the last value (4 in the above case) as in interpreted.

**Platform version**

```
Red 0.6.4 for Windows built 24-Jan-2021/10:45:46+03:00 commit #48fca9c
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-24T22:43:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4811#issuecomment-766452676>

    Known. https://github.com/red/red/issues/1706#issuecomment-660306764

