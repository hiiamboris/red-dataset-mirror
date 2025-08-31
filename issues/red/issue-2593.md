
#2593: ROUND rounds float down if scale is integer
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2593>

```
>> round/to .5 1
== 0
>> round/to .999 1
== 0
>> round/to .999 1.0
== 1.0
>> round/to .5 1.0
== 1.0
```


