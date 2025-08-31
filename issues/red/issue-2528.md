
#2528: insert value into vector of 32 bit percent! elements does not work
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2528>

```
>> v: make vector! [percent! 32 []]
== make vector! [percent! 32 []]
>> insert v 10%
== make vector! [percent! 32 []]
>> v
== make vector! [percent! 32 [0%]]
```



