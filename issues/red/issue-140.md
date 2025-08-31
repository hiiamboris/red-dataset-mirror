
#140: Pointer arithmetic question 
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.resolved]
<https://github.com/red/red/issues/140>

The allowed operand types for addition and subtraction are now either any combination of `integer!` and `byte!` for left and right operand, or any combination of `integer!` and `any-pointer!` (`c-string!`, `pointer!` or `struct!`) . The documentation suggests that `pointer - pointer` should yield an `integer!` result, but this is a deviation from the previous rule that the type of the result is that of the left operand. I list the possible cases:

```
integer! +- byte! => integer!
byte! +- integer! => byte!
integer! +- any-pointer! => integer!
any-pointer! +- integer! => any-pointer!
any-pointer! - any-pointer! => integer!
any-pointer! + any-pointer! => ??? (makes little sense)
```

What is it to be?



Comments:
--------------------------------------------------------------------------------

On 2011-07-27T22:20:58Z, dockimbel, commented:
<https://github.com/red/red/issues/140#issuecomment-1668400>

    You are right, I need to clarify that.

--------------------------------------------------------------------------------

On 2011-08-01T15:22:06Z, dockimbel, commented:
<https://github.com/red/red/issues/140#issuecomment-1701140>

    The mention about returning an `integer!` type on addition or subtraction on two pointers has been removed. Same rule as for other arithmetic operations is applied. No code changes as it is already the current code behavior.

