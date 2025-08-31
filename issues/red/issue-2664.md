
#2664: ANY chokes on unset value in block
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2664>

```
>> all [()]
>> any [()]
*** Script Error: block did not return a value
*** Where: any
```


