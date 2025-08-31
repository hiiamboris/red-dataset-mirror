
#2611: ZERO? returns true for non-zero float vals
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2611>

If deci part is .0, to a point.
```
>> zero? 1.1
== false
>> zero? 1.0
== true
>> zero? 1.0
== true
>> zero? 2.0
== true
>> zero? 3.0
== true
>> zero? 12.0
== true
>> zero? 123.0
== true
>> zero? 1234.0
== true
>> zero? 12345.0
== true
>> zero? 123456.0
== true
>> zero? 1234567.0
== true
>> zero? 12345678.0
== false
```


