
#1605: Different behaviour in remainder and infix //
================================================================================
Issue is closed, was reported by mikeparr and has 4 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/1605>

red-054.exe , Windows 7
remainder function seems OK, but infix // objects to pair and vector type.

```
red>> 5x10 // 4
*** Internal error: reserved for future use (or not yet implemented)
*** Where: >
red>> remainder 5x10 4
== 1x2
red>> make vector![5 5 10] // 4
*** Script error: % does not allow block for its value1 argument
*** Where: %
red>> remainder make vector![5 5 10] 4
== make vector! [1 1 2]
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-08T02:08:04Z, qtxie, commented:
<https://github.com/red/red/issues/1605#issuecomment-181161169>

    The operator for `remainder` is `%`.  `//` is modulo operator.
    
    ```
    red>> modulo 5x10 4
    *** Internal error: reserved for future use (or not yet implemented)
    *** Where: >
    red>> 5x10 // 4
    *** Internal error: reserved for future use (or not yet implemented)
    *** Where: >
    ```

--------------------------------------------------------------------------------

On 2016-02-08T04:02:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1605#issuecomment-181185777>

    We should maybe reexamine that and stick to Rebol convention. Needs more studying.
    
    Though,  `make vector! [5 5 10] // 4` is incorrect expression and the error message legitimate. The right expression is:  `(make vector![5 5 10]) // 4`, as infix has priority over left to right evaluation rule.

