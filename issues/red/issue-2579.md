
#2579: power (**) breaks down at exponent 32
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2579>

```
>> 2 ** 31
== 2147483648.0 ; power yields float! if result is beyond 32 bits signed integer range
>> 2 * (2 ** 31)
== 4294967296.0 ; so far so good
>> 2 ** 32
== 0 ; !?! should be same as previous one
>> 3 ** 31
== 617673396283947.0
>> 3 * (3 ** 31)
== 1853020188851841.0
>> 3 ** 32
== -501334399 ; integer and moreover wrong !?!
```



