
#408: New symbol table too strict
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/408>

```
Red []

x: 'y
set x 1
probe y
```

**\* Compilation Error: undefined word y 
**\* near: [y]



Comments:
--------------------------------------------------------------------------------

On 2013-02-10T21:50:47Z, dockimbel, commented:
<https://github.com/red/red/issues/408#issuecomment-13362001>

    The compiler cannot compile statically such kind of code as `y` is never assigned to a value, so the compiler has no way to know if it is a legitimate word or not. For example, instead of `x: 'y`, you could call a function that would return  the word `y`, there is no way the compiler can see that, so returning a `undefined word y` error is the right behavior.
    
    If you want to use such kind of indirect word setting, you need to invoke the interpreter using `do` as in:
    
    ```
    x: 'y
    set x 1
    probe do [y]
    ```

--------------------------------------------------------------------------------

On 2013-02-10T22:05:27Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/408#issuecomment-13362323>

    That's odd, because the master branch could always compile this code. The problem is limited to the new lex-scope branch.
    
    Also, it's a difference with REBOL.

--------------------------------------------------------------------------------

On 2013-02-10T22:14:30Z, dockimbel, commented:
<https://github.com/red/red/issues/408#issuecomment-13362499>

    Yes, master branch could compile it but is unable to distinguish a defined word from an undefined one, we can't have both features at the same time. The compiler needs to know what is a variable and what is not to be able to report words used without being ever defined. With such kind of indirect word access, the compiler has no way to understand that `y` has been defined, because it happens at runtime, and cannot be statically inferred from the source code only by the compiler. 
    
    Yes, it is a difference because Red is statically compiled and REBOL is interpreted. Some semantics can only be resolved by an interpreter or a JIT-compiler.

--------------------------------------------------------------------------------

On 2013-02-10T22:18:12Z, dockimbel, commented:
<https://github.com/red/red/issues/408#issuecomment-13362578>

    We could revert it to allow `y` to be compiled in such case, but the compiler will be again unable to report any undefined word used in code, it will just compile them all and resolve them as unset! values. I think that reporting undefined words (usually typos in source code) is more useful than being able to compile indirect word accesses.

--------------------------------------------------------------------------------

On 2013-02-10T22:44:21Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/408#issuecomment-13363111>

    OK, I understand why now. That's reasonable, but it will have to be documented as a gotcha compared to REBOL.

