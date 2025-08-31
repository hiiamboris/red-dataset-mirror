
#2663: comparison of objects is not lexicographic
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/2663>

The programming of object comparison seems to ensure lexicographic ordering for the field values.
But see this:
```
>> o: object [a: 1]
== make object! [
    a: 1
]
>> o < object [a: 1 b: 0]
== true                 ;; seems OK
>> o < object [a: 0 b: 0]
== true                 ;; should be false?
```
It looks like the "shorter" object (fewer fields) always is seen as smaller.



Comments:
--------------------------------------------------------------------------------

On 2017-07-25T11:53:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2663#issuecomment-317714389>

    Right, number of fields is the first property compared. Smaller objects will always return true on `lesser` comparison.

