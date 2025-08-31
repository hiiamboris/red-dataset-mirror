
#3721: trim #{00} hangs console
================================================================================
Issue is closed, was reported by Dobeash and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3721>

**Describe the bug**

Entering `trim #{00}` hangs console session.

**To reproduce**
```
trim #{00}
```

**Expected behavior**

Should behave the same as:
```
>> trim/with #{00} null
== #{}
```


Comments:
--------------------------------------------------------------------------------

On 2019-01-09T23:51:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3721#issuecomment-452916552>

    Confirmed. `trim #{0000}` does it also. Anything that makes the result empty.

