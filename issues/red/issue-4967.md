
#4967: [Regression] FORALL overshoots on index change now
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [test.written]
<https://github.com/red/red/issues/4967>

**Describe the bug**
```
>> b: [1 2 3 4]
== [1 2 3 4]
>> forall b [probe index? b b: next b b/1: b/1 * 2]
1
3
5
*** Script Error: * does not allow none! for its value1 argument
*** Where: *
*** Stack:

>> head b
== [1 4 3 8]
```

**Expected behavior**
```
>> b: [1 2 3 4]
== [1 2 3 4]
>> forall b [probe index? b b: next b b/1: b/1 * 2]
1
3
== 8
>> probe head b
[1 4 3 8]
== [1 4 3 8]
```

**Platform version**
```
Red 0.6.4 for Windows built 12-Sep-2021/20:36:44+03:00  commit #9aea165
```



