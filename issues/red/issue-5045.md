
#5045: ENBASE converts to, not from base (as docstring for BASE-VALUE says)
================================================================================
Issue is open, was reported by gurzgri and has 4 comment(s).
[type.review] [type.documentation]
<https://github.com/red/red/issues/5045>

**Describe the bug**
The docstring for /BASE refinements' BASE-VALUE is misleading, it reads: "The base to convert from: 64, 58, 16, or 2." 

**To reproduce**
```
>> help enbase
```

**Expected behavior**
Docstring reading: "The base to convert to: 64, 58, 16, or 2." 

**Platform version**
Red 0.6.4 for Windows built 30-Dec-2021/14:02:56+01:00  commit #895d4cb



Comments:
--------------------------------------------------------------------------------

On 2022-01-20T22:19:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/5045#issuecomment-1017976819>

    just a note: documentation bugs belong to https://github.com/red/docs/issues/

--------------------------------------------------------------------------------

On 2022-01-20T22:20:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5045#issuecomment-1017977729>

    IIRC it has been decided to make `/base` a mandatory argument, so maybe it should be fixed alltogether.

