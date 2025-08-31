
#2559: Converting time! to integer! can be imprecise
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2559>

When converting a ```time!``` to an ```integer!``` the number of seconds may be incorrect by one:

```
>> to integer! 09:30     ;; result should be 34200
== 34199
>> to integer! 09:45     ;; result should be 35100
== 35099
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-12T04:22:13Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2559#issuecomment-293470301>

    Thanks @qtxie

