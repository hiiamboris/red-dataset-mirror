
#2158: Using -2147483648 or 2147483647 as an argument to modulo gives script overflow error
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2158>

```
red>> -1 // 2147483646
== 2147483645
red>> -1 // 2147483647
*** Math Error: math or number overflow
*** Where: +
red>> 1 // 2147483647
*** Math Error: math or number overflow
*** Where: +
red>> 0 // 2147483647
== 0
red>> 0 // -2147483648
*** Math Error: math or number overflow
*** Where: absolute
red>> 1 // -2147483648
*** Math Error: math or number overflow
*** Where: absolute
red>> -1 // -2147483648
*** Math Error: math or number overflow
*** Where: absolute
red>> 2147483647 // -10
*** Math Error: math or number overflow
*** Where: +
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-06T11:41:52Z, dockimbel, commented:
<https://github.com/red/red/issues/2158#issuecomment-238019384>

    This is not a bug, the behavior of Rebol's `//` operator corresponds to Red's `%` operator.
    
    Anyway, we need to make a new pass on how we handle modulos, to simplify it if possible.

