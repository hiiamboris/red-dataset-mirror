
#3707: new-line flags are not cleared on subsequent calls
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3707>

**Describe the bug**
new-line flags are not cleared on subsequent `new-line` calls

**To reproduce**

```
>> b: [1 2 3 4]
>> new-line/all b on
== [
    1
    2
    3
    4
]
>> new-line/all/skip b on 3
== [
    1
    2
    3
    4
]
>> new-line/all/skip b on 2
== [
    1
    2
    3
    4
]
```

**Expected behavior**

new-line flags should be cleared on subsequent calls:

```
>> new-line/all/skip b on 3
== [
    1 2 3
    4
]
>> new-line/all/skip b on 2
== [
    1 2
    3 4
]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Jan-2019/17:22:21+03:00 commit #8bf2cbe
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-06T02:59:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3707#issuecomment-451710993>

    We can argue that the refinements conflict, and using both should be an error.

