# Issue #5660: `read/part` doesn't respect zero size
<https://github.com/red/red/issues/5660>

**Describe the bug**

While `write/part <file> <data> 0` aligns with all the other functions and truncates the file, `read/part <file> 0` reads the *whole* file.
```
>> write %1 "abcdef"
>> read/part %1 2
== "ab"
>> read/part %1 1
== "a"
>> read/part %1 0
== "abcdef"
```

**To reproduce**
```
write %test "abcdef"
read/part %test 0
```

**Expected behavior**

Empty string *read*. Useful for access testing.

**Platform version**
```
Red 0.6.6 for Windows built 9-Sep-2025/3:21:04+08:00  commit #c8b6ebc
Red 0.6.6 for Linux built 16-Oct-2025/19:50:42+08:00  commit #bfc01e1
```



## hiiamboris on 2025-10-30T12:11:40Z
Loosely related: https://github.com/red/red/issues/4106 https://github.com/red/REP/issues/97


## greggirwin on 2025-10-30T21:04:54Z
Good catch. Looks like `read-file` checks `if part > 0 [` and doesn't change the read size if that fails.


