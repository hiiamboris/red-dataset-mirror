
#2677: adding a tuple! or time! value to a char! value gives overflow
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2677>

note the situation with the converse operations: adding a char! to a tuple! value is forbidden, adding a char! value to a time! value uses the Code Point number as seconds and does the operation.
```
>> #"A" + 1.2.3
*** Math Error: math or number overflow
*** Where: +
>> #"A" + 10:30
*** Math Error: math or number overflow
*** Where: +
```




