
#3734: Initialization of VECTOR from BINARY is not working as expected
================================================================================
Issue is open, was reported by Oldes and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/3734>

**Describe the bug**
Initialization of `vector` from `binary` is not implemented, so this should throw an error or be working:
```
>> make vector! [integer! 16 2 #{00010002}]
== make vector! [integer! 16 [0 0]] ;<- I would prefer: make vector! [integer! 16 [1 2]]
```

**Platform version**
```
Red 0.6.4 for Windows built 14-Jan-2019/20:16:43+01:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-08-14T17:03:04Z, 9214, commented:
<https://github.com/red/red/issues/3734#issuecomment-674170781>

    What if the number of bits is not evenly divisible by unit size?

