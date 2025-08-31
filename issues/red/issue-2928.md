
#2928: Date without time can have time zone?
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2928>

```Red
>> d: 2017-12-06
== 6-Dec-2017
>> d/time
== none
>> d/zone
== 0:00:00
```


