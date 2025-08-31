
#2947: Different behaviors between REBOL3 and Red in DOing and REDUCEing a function value.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2947>

In REBOL 3:
```Red
>> do :now
== 31-Jul-2017/16:26:08+8:00
>> reduce :now
```
In Red:
```Red
>> do :now
== make native! [[
    "Returns date and time" 
    /year "Returns ye...
>> reduce :now
== 31-Jul-2017/16:26:50+08:00
```




Comments:
--------------------------------------------------------------------------------

On 2017-07-31T12:03:31Z, dockimbel, commented:
<https://github.com/red/red/issues/2947#issuecomment-319048056>

    `do` in Red does not evaluate functions, as that would make `do` a variable-arity function, which we want to avoid. R3 is inconsistent as `make` was made fixed-arity compare to R2, but `do` was not. 
    
    So, in Red, `do` can only have one argument, instead of a variable number in R3. Still, `do` and `reduce` should return the same value in that case.

