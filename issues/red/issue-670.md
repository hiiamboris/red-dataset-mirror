
#670: Red intrinsics and Red native names form non-overlapping sets
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/670>

Red intrinsics are words that cannot be redefined (at least not for the compiler, the interpreter allows it). Most of them are the names of native functions (if, unless, etc.). The following intrinsics are not implemented as natives: break, exit, return, routine. It turns out that break is not recognized at all. The other three are compiled directly and there may be sufficient reason to do this. On the other hand, there are a number of native functions whose names are not in the intrinsic list, and which can therefore be redefined: not, do, bind, in, union, intersect, unique, difference, halt, print, prin, type?, load, compose, stats, parse, as well as the comparison natives (equal? etc.). The criteria for being intrinsic are not clear to me.



Comments:
--------------------------------------------------------------------------------

On 2014-02-12T13:14:43Z, dockimbel, commented:
<https://github.com/red/red/issues/670#issuecomment-34867242>

    `break` is not supported at all currently, as it requires exceptions support to be implemented first.
    
    `exit` and `return` are handled as _keywords_ by the interpreter, so no native implementation is required.
    
    `routine` cannot be handled by the interpreter, as it requires Red/System runtime compilation support. So, it can only be supported at runtime in the future using the JIT-compiler (probably in Red 2.0, we will not have time to go selfhosted in 1.0).
    
    The criteria for being _intrinsic_ is the ability for the compiler to produce a more efficient code than the runtime native version (but sometime loosing some flexibility in the process). So, if the compiler can generate a short and more efficient code for the native, it becomes an intrinsic. Control flow natives are very good candidates for such group, as they can often be mapped closely to their Red/System counterpart.
    
    The comparison natives are just wrapper other internal `compare` action, so they do not qualify for intrinsic group, because of their runtime resolution requirement. Note that the compiler will be able in the future to specialize op! based expressions in some cases, so that math and comparison expressions could then be handled by the compiler that will generated speciliazed code for them, limiting the native overhead at runtime.

