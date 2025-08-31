
#498: MOLD string! doesn't recognise balanced braces
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/498>

```
red>> mold mold {}
== {^{""^}}
```

REBOL:

```
>> mold mold {}
== {{""}}
```



