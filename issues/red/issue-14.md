
#14: error handling in red/system compiler
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built]
<https://github.com/red/red/issues/14>

I have observed various styles of exception (error) handling in the compiler source:
1. a function `throw-error`, internal to the compiler context (`%compiler.r`) which is used also in the other source files (`compiler/throw-error`)
2. direct error! value creation, like `make error! "..."`
3. explicit test, like `if error? set/any 'err try [...][print [... mold disarm err]]`

This does not count the internal error checking done by REBOL2, e.g. type-compatibility of actual and formal function arguments. I suppose there is a rationale for each of the approaches. Still, I wonder if there is no scope for more uniformity, and/or a centralized error handling approach.



Comments:
--------------------------------------------------------------------------------

On 2011-04-22T21:17:31Z, dockimbel, commented:
<https://github.com/red/red/issues/14#issuecomment-1045664>

    The target is the approach you have described as (1) for all compilation errors. Adding proper and clean error management has been postponed until the type checking (and other syntactic and semantic checks) will be implemented. These checks are listed in the current todo-list (see https://github.com/dockimbel/Red/wiki). 
    
    About (2) & (3) cases, they are waiting to be converted to method (1). AFAIR, they are remains of pre-(1) error handling.
    
    So, to answer your last point, a centralized approach is the goal to reach (including unexpected runtime errors), with a probably globally-defined 'throw-error function (to avoid the compiler/ prefix).
    
    I am leaving this ticket open in "pending" status until all errors are rewritten in (1) style.

--------------------------------------------------------------------------------

On 2011-06-10T11:42:02Z, dockimbel, commented:
<https://github.com/red/red/issues/14#issuecomment-1341649>

    Errors handling were improved by this commit: [aebe59cb](https://github.com/dockimbel/Red/commit/aebe59cbd533cc51149ef594c1458cf0661a4e39)
    
    Cases (2) were maintained where appropriate (used as failed assertions). Cases (3) are required to "proxify" specific REBOL errors and rewrite them to be more meaningful.

