
#2888: using /date accessor destroys time and zone components of date! value
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2888>

```
>> d: now
== 15-Jul-2017/17:56:30+02:00
>> d/time
== 17:56:30
>> d/timezone
== 2:00:00
>> d: now
== 15-Jul-2017/17:57:56+02:00
>> d/date
== 15-Jul-2017
>> d/time
== none
>> d/timezone
== 0:00:00
```



