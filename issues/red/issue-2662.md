
#2662: comparison of time and integer is inconsistent
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2662>

```
>> to-integer 1:00
== 3600
>> 1:00 = 3600
== false
>> 1:00 > 3600
== true
```
If `time!` and `integer!` values cannot be compared for equality, it should be forbidden to compare them for greater etc. 




Comments:
--------------------------------------------------------------------------------

On 2017-07-25T11:52:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2662#issuecomment-317714137>

    Equality testing (`=` and `==`)  on `time!` with another single-dimension scalar value should return `false`, `<>` should return `true`. Other comparisons should return an error.

--------------------------------------------------------------------------------

On 2019-08-16T16:32:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2662#issuecomment-522071076>

    Seems it has been fixed:
    ```
    >> 1:00 = 3600
    == true
    >> 1:00 > 3600
    == false
    >> 1:00 >= 3600
    == true
    ```
    Except for when integer is used on left and time on right: https://github.com/red/red/issues/2656#issuecomment-522039912

