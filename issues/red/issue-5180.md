
#5180: `do/expand` hangs if processing is turned off
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5180>

**Describe the bug**

If `#process on` directive is missing after `#process off`, next `do/expand` containing preprocessor directives will hang the script.

**To reproduce**

Run this script:
```
Red []

#process off
do/expand [#do [1]]
```

**Expected behavior**

Load-time `#process` shouldn't affect eval-time `do/expand` probably.
Also it's state should probably be reset once script evaluation starts.
In any case `do/expand` should just skip then such directives instead of hanging.

**Platform version**
```
red+view-master-2022-08-19-19a4f16.exe
```



