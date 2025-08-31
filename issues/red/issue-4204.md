
#4204: FIND/LAST does not honor /PART
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4204>

**Describe the bug**

```
>> find/part/last "a b c d e f g" " " 3
== " g"
```

**Expected behavior**

R2 (correct):
```
>> find/part/last "a b c d e f g" " " 3
== " b c d e f g"
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Dec-2019/19:03:46+03:00 commit #544a6e1
```



Comments:
--------------------------------------------------------------------------------

On 2019-12-24T21:31:14Z, greggirwin, commented:
<https://github.com/red/red/issues/4204#issuecomment-568804001>

    Good catch.

