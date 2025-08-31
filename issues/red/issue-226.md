
#226: Arithmetical operation with as integer! uses pointer instead of value
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/226>

See this code:

```
array: declare pointer! [byte!]
array/value: as byte! 10
print [10 * as integer! array/value lf]
```

This doesn't return 100, but same value as:

```
print [10 * array/value lf]
```

To get right value, we need some temporary variable:

```
value: as integer! array/value
print [10 * value lf]
```



Comments:
--------------------------------------------------------------------------------

On 2012-07-30T15:57:55Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/226#issuecomment-7372531>

    You haven't allocated memory for the array, only for the pointer. So you're corrupting unknown memory locations, probably thereby corrupting your result.

--------------------------------------------------------------------------------

On 2012-07-30T16:18:19Z, rebolek, commented:
<https://github.com/red/red/issues/226#issuecomment-7373116>

    You are right, but even if I fix this issue, the bug is still present. Check this code:
    
    ```
    number: 10
    array: declare pointer! [byte!]
    array: as byte-ptr! :number
    value: as integer! array/value
    print [10 * as integer! array/value lf]
    ```
    
    It still returns wrong value.

