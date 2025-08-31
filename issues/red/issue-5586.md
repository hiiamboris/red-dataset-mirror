
#5586: Pair->point auto-promotion is bugged in mixed case
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5586>

**Describe the bug**
```
>> 100x100 / 99x99
== (1.010101, 1.010101)
>> 100x100 / 99x100
== (1.010101, 1)
>> 100x100 / 100x99
== (0.01, 1.010101)            ;) ???
```

**To reproduce**
`100x100 / 100x99`

**Expected behavior**
`(1, 1.010101)`

**Platform version**
`Red 0.6.5 for Windows built 15-Jan-2025/15:57:02+08:00  commit #498cc9d`


