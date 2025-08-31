
#4980: do/next any-list behaves unexpectedly
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4980>

**Describe the bug**

Paren:
```
>> do/next x: quote (1 2 3) 'x
== 3
>> x
== (1 2 3)
```
Also hash:
```
>> do/next x: make hash! [1 2 3] 'x
== make hash! [1 2 3]
>> x
== make hash! [1 2 3]
```

**Expected behavior**

Should behave same as block:
```
>> do/next x: [1 2 3] 'x
== 1
>> x
== [2 3]
```
Parens contain code, should be supported. Hash can possibly contain mixes of data and code, so makes sense to support it as well.

**Platform version**
```
Red 0.6.4 for Windows built 18-Sep-2021/18:49:23+03:00  commit #5d45a0e
```



