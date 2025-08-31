
#4888: [Regression, D2D] Crashes when setting cursor
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4888>

**Describe the bug**
```
>> view compose [base cursor (make image! 10x10)]

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```
It's still calling some irrelevant GDI+ code.

**Expected behavior**

Cursor set to white box.

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



