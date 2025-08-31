
#28: Multiplication by zero crashes the compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.tested] [type.bug]
<https://github.com/red/red/issues/28>

 I've found that multiplying by zero crashes the compiler. Code:

```
Red/System []
i: 1 * 0
```

Compiler output:

```
do/args %rsc.r "%/c/code/red-system/test.reds"
Script: "Red/System compiler wrapper" (none)

-= Red/System Compiler =-
Compiling /c/code/red-system/test.reds ...
Script: "Red/System IA32 code emitter" (none)
** Math Error: Positive number required
** Where: power-of-2?
** Near: to integer! log-2 n
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-09T11:46:06Z, dockimbel, commented:
<https://github.com/red/red/issues/28#issuecomment-1122377>

    Tested OK.

