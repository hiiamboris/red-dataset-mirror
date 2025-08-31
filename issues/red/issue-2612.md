
#2612: Integer! 10 ** 16 produces bad result
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2612>

Should become float.
```
>> 10 ** 16
== 1874919424
>> 10.0 ** 16
== 1.0e16
>> 10 ** 16.0
== 1.0e16
```


