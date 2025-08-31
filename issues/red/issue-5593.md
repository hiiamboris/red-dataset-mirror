
#5593: Misleading error message in `put`
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5593>

**Describe the bug**

When object doesn't support some key, `put` claims itself to be a path:
```
>> put object [a: 1] 1 2
*** Script Error: cannot access 1 in path none
*** Where: put
*** Near : put object [a: 1] 1 2
*** Stack:  
```

**Expected behavior**

Error message should be more meaningful.

**Platform version**

`Red 0.6.5 for Windows built 15-Jan-2025/15:57:02+08:00  commit #498cc9d`


