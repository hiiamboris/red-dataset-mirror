
#5598: Regression on division of pair! value by integer
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5598>

```
>> 2560x1440 - 280x325 / 2
== (1, 557.5)                        ; wrong result!
>> 2560x1440 - 280x325 / 2.0
== 1140x557                          ; inaccurate result and wrong type!
```


