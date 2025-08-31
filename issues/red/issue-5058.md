
#5058: `save` generates an extra level of indentation
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5058>

**Describe the bug**

Any attempt to `save` or `save/header` a Red script produces a file with unneeded spaces before every line.

**To reproduce**

Using `mold` (the culprit) for simplicity:
```
>> print mold/only new-line/all/skip [1 a 2 b 3 c] yes 2

    1 a 
    2 b 
    3 c
```

**Expected behavior**

In R2:
```
>> print mold/only new-line/all/skip [1 a 2 b 3 c] yes 2

1 a
2 b
3 c
```

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



