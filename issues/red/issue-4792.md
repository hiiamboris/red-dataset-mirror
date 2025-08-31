
#4792: PAD forces string to it's head
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4792>

**Describe the bug**
```
>> s: at "name: value" 7
== "value"
>> pad s 10
== "name: value     "
```

**Expected behavior**
```
== "value     "
```

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



