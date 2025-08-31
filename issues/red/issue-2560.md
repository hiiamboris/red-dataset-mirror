
#2560: to pair! from floats > max integer give unexpected results
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.deferred] [type.review] [test.written]
<https://github.com/red/red/issues/2560>

to pair! will always result in ```-2147483648x-2147483648``` when the value is a float that is greater than the maximum integer is provided:

```text
>> to pair! 2147483648.0
== -2147483648x-2147483648
>> to pair! 2147483649.0
== -2147483648x-2147483648
```



Comments:
--------------------------------------------------------------------------------

On 2017-04-11T05:20:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2560#issuecomment-293152649>

    Note: this will be automatically corrected once pair! values can be float!

--------------------------------------------------------------------------------

On 2019-08-15T16:12:00Z, dockimbel, commented:
<https://github.com/red/red/issues/2560#issuecomment-521699065>

    Currently, such operation will result in an undefined result, and as it should be automatically corrected once pair values can be floats, I will close it with a deferred status.

