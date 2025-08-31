
#2623: inconsistency in treatment of unset values
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2623>

Unset values in fields of objects are not raising errors. It looks like field selection does an automatic `get`?
```
>> a: 1
== 1
>> unset 'a
>> a
*** Script Error: a has no value
*** Where: catch
>> probe a
*** Script Error: a has no value
*** Where: probe
>> probe :a
unset
>> o: object [a: 1]
== make object! [
    a: 1
]
>> unset in o 'a
>> probe o/a
unset                ;; no error as in the non-object case
>> probe :o/a
unset


