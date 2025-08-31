
#2858: to-date does not check for negative argument
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2858>

The integer argument to `to-date` is the number of seconds elapsed since 1-Jan-1970/0:00 until now. This Unix convention holds normally for non-negative values. If a negative argument were to be used (this is entirely defensible) the result should be normalized. Currently, a negative time of day results:
```
>> to-date 1
== 1-Jan-1970/0:00:01
>> to-date -1
== 1-Jan-1970/-0:00:01 ; should be 31-Dec-1969/23:59:59
```



