
#5569: Odd rounding when mixing points of different dimensions
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5569>

**Describe the bug**

I made a mistake of trying to round both 2- and 3-D points to a 3-D precision, but the result is unexplainable:
```
>> round/to (1.234, 5.678) (1, 0.1)
== (1, 5.7)                       ;) how I expected it to work

>> round/to (1.234, 5.678) (1, 0.1, 0)
== (1.234, 5.678)                 ;) none of the results from now on I understand
>> round/to (1.234, 5.678) (1, 0.1, 10)
== (0, 0)
>> round/to (1.234, 5.678) (1, 0.1, 1)
== (1.234375, 5.679689)
>> round/to (1.234, 5.678) (1, 0.1, 2)
== (2, 6.000001)
>> round/to (1.234, 5.678) (1, 0.1, 3)
== (0, 0)

>> round/to (1.234, 5.678, 9.876) (10, 10)
== (1.234, 5.678, 9.876)           ;) and this doesn't do anything at all it seems
```

**Expected behavior**

Maybe an error?
Or just use existing dimensions and assume the missing ones to be `0`.

**Platform version**
`Red 0.6.5 for Windows built 27-Nov-2024/7:13:19+07:00  commit #445c17c`


Comments:
--------------------------------------------------------------------------------

On 2025-02-16T21:20:12Z, dockimbel, commented:
<https://github.com/red/red/issues/5569#issuecomment-2661623302>

    > Or just use existing dimensions and assume the missing ones to be 0.
    
    Implemented.

