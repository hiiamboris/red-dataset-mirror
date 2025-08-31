
#5043: LOAD/INTO doesn't insert into given block (regression)
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [test.written]
<https://github.com/red/red/issues/5043>

**Describe the bug**

LOAD/INTO doesn't insert the loaded value(s) into given block, block stays unchanged.

**To reproduce**

```red
>> b: [1 2] load/into "3 4" b  b
== [1 2]
```

**Expected behavior**
```red
>> b: [1 2] load/into "3 4" b  b
== [1 2 3 4]
```


**Platform version**
```
Red 0.6.4 for Windows built 18-Jan-2022/22:00:31+03:00  commit #6557e9b7
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-22T14:39:34Z, dockimbel, commented:
<https://github.com/red/red/issues/5043#issuecomment-1019283005>

    Note: according to #3340, it will always append regardless of the passed series index.

