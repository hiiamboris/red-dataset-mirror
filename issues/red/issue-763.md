
#763: IF and EITHER can still evaluate body block after an error
================================================================================
Issue is closed, was reported by WayneCui and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/763>

Both in Windows and Linux 

```
>>if a [1]
*** Error: word has no value!
== 1
>>either a [1][2]
*** Error: word has no value!
== 1
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-06T17:28:49Z, dockimbel, commented:
<https://github.com/red/red/issues/763#issuecomment-39674219>

    This is currently the expected behavior as proper error management has not yet been implemented.

