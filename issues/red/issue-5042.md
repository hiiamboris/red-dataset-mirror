
#5042: transcode/into overwrites its into block argument
================================================================================
Issue is closed, was reported by endo64 and has 4 comment(s).
[status.built] [status.tested] [test.written]
<https://github.com/red/red/issues/5042>

**Describe the bug**
transcode/into overwrites its into block argument

**To reproduce**
```red
>> b: [1 2 3] transcode/into "4 5"  next b head b
== [1 4 5]
```

**Expected behavior**
```red
>> b: [1 2 3] transcode/into "4 5"  next b head b
== [1 4 5 2 3]
```

**Platform version**

```
Red 0.6.4 for Windows built 19-Jan-2022/0:46:09+03:00  commit #6557e9b
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-19T22:48:28Z, endo64, commented:
<https://github.com/red/red/issues/5042#issuecomment-1016942326>

    Duplicate of https://github.com/red/red/issues/4109
    
    Also look at:
    https://github.com/red/red/issues/2927
    https://github.com/red/red/issues/4515

--------------------------------------------------------------------------------

On 2022-01-22T14:03:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5042#issuecomment-1019275759>

    According to the conclusion of #3340 about `/into`, the behavior will be appending.

