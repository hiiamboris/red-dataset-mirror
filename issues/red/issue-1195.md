
#1195: crash when setting map! value to none
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1195>

```
red>> m: make map! [a 1 b 2]
== make map! [
    a: 1
    b: 2
]
red>> m/b: none

*** Runtime Error 1: access violation
*** at: 00419998h
```



