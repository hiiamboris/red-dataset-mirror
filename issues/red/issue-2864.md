
#2864: remaining issue with to date!
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2864>

Same blocks as in #2861, but with `to` instead of `make`
```
>> to date! [1 2 2017 24:10]
== 2-Feb-2017/0:10:00                ; OK
>> to date! [1 2 2017 23 70 0]
== 2-Feb-2017/0:10:00               ; OK
>> to date! [1 2 2017 23 70 0 4:30]
== 1-Feb-2017/24:10:00+04:30   ; NOT OK!!!
```



