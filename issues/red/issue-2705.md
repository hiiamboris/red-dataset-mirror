
#2705: float and percent value can be divided by tuple, but result makes no sense
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2705>

```
>> 1.0 / 2.3.4
== 2.3.4
>> 100% / 2.3.4
== 2.3.4
```
This would better be treated as error, like with integer divided by tuple (see previous issue)


