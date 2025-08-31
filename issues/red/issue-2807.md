
#2807: to-tuple next binary gives wrong result
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2807>

The length of the tuple is wrong.
```
>> b: #{01020304}
== #{01020304}
>> next b
== #{020304}
>> to-tuple b
== 1.2.3.4
>> to-tuple next b
== 2.3.4.0.0   ;; two spurious zeroes
>> to-tuple #{020304}
== 2.3.4
```



