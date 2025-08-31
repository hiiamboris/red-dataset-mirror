
#2554: Fields of error value can be set, with fatal result
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2554>

```
>> e: try [1 / 0]
== Math error....
>> type?  e
== error!
>> e/type
== math
>> e/type: none
== none
>> e
=====> crash
```
I suggest that set-path should be forbidden on errors, unless anyone can see a use for that..


