
#2805: Cannot REPEND to STRING!
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2805>

It is possible in Rebol, but not in Red:

Rebol:
```
>> repend "" ["time: " now]
== "time: 13-Jun-2017/11:59:09+2:00"
```

Red:
```
>> repend "" ["time: " now/time]
*** Script Error: reduce does not allow string! for its out argument
*** Where: reduce
*** Stack: repend
```


