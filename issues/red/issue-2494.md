
#2494: email user field is not determined correctly
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2494>

```
>> e: a@b
== a@b
>> type? e
== email!
>> e/host
== b
>> e/user
== a@b ; should be a
```



