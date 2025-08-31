
#4325: Runaway binary to integer conversion
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4325>

**Describe the bug**
```
>> to integer! next #{0080}
== 8445114
>> to integer! next #{000080}
== 8436448
>> to integer! next next #{000080}
== -2135236433
```

https://github.com/red/red/blob/master/runtime/datatypes/integer.reds#L87 is wrong

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 10-Mar-2020/16:22:26+03:00
```



