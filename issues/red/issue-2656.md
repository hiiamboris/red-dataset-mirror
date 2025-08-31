
#2656: Programming error and inconsistency in comparing integer, float etc.
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2656>

`float!` numbers can be compared to `time!` values but there is a programming error in `%float.reds`:
```
			TYPE_TIME
			TYPE_PERCENT
			TYPE_FLOAT [right: value2/value]

```
The  `struct!` member in `red-time!` is called `time` not `value`.
In any case, `integer!` values cannot be compared to `time!` values. There is no symmetry.


Comments:
--------------------------------------------------------------------------------

On 2017-07-25T08:30:46Z, dockimbel, commented:
<https://github.com/red/red/issues/2656#issuecomment-317667828>

    There is no programming error there, the different structs for `time!`, `percent!` and `float!` are overlapping for their float value on purpose, to be able to access that field using the same accessor.

--------------------------------------------------------------------------------

On 2017-07-25T08:31:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2656#issuecomment-317668011>

    Comparisons between `time!` and single-dimension scalar values should result in an error.

--------------------------------------------------------------------------------

On 2017-07-25T09:05:01Z, meijeru, commented:
<https://github.com/red/red/issues/2656#issuecomment-317676422>

    At the moment, such comparisons result in `false`. I seem to be remember that you once said that type incompatibility in comparisons need not yield an error, `false` is enough. Is that right?

--------------------------------------------------------------------------------

On 2017-07-25T14:59:15Z, dockimbel, commented:
<https://github.com/red/red/issues/2656#issuecomment-317765457>

    Equality and inequality tests should always return a `logic!` result. Other comparisons can return errors if the  comparison is meaningless or impossible.

--------------------------------------------------------------------------------

On 2019-08-16T13:36:46Z, dockimbel, commented:
<https://github.com/red/red/issues/2656#issuecomment-522011327>

    Actually, comparison between `time!` and single-dimension scalar values is possible, because `time!` values can be converted to `integer!` or `float!` values (and back to `time!`) using seconds as the base unit.
    
    So, it works as expected currently.

--------------------------------------------------------------------------------

On 2019-08-16T14:59:10Z, meijeru, commented:
<https://github.com/red/red/issues/2656#issuecomment-522039912>

    I beg to differ
    ```
    >> 3600 = 1:00:00
    == false
    >> 1:00:00 = 3600
    == true
    ```
    Thus it is not solved! See also #2662.

--------------------------------------------------------------------------------

On 2019-08-16T16:37:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2656#issuecomment-522072612>

    You should have reported that in #2662 rather...

