
#5184: `do-file` throws the last value if it's an error
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5184>

**Describe the bug**

When script's last value is an `error!`, `do`ing that file from console, or running console with it as argument results in the error being thrown.

**To reproduce**
```
>> write %1.red {Red [] e: make error! "msg"}
>> do %1.red ()
*** User Error: "msg"
*** Where: do
*** Near : make error! "msg"
*** Stack: do-file  
```

**Expected behavior**

Not thrown.

**Platform version**
```
red+view-master-2022-08-20-948c3ac.exe
```



