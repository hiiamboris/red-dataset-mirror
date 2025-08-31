
#360: Compiler chokes on redefined `equal?` function
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/360>

I was testing if operators and natives/actions could be redefined. This is true for almost all names, whether by using a set-word or by using the `set` construction. The only operator name that the compiler has difficulty with, is `equal?`

```
equal?: 1
-= Red Compiler =-
Compiling red/tests/mytest.red ...
*** Red Compiler Internal Error: Script Error : Invalid path value: equal?
*** Where: rejoin
*** Near:  [forall ops [
comp-expression/no-infix
emit make-func-prefix ops/1
insert-lf -1
emit-close-frame
unless tail? next ops [pc: next pc]
]
return true
]
```



Comments:
--------------------------------------------------------------------------------

On 2013-01-03T14:30:56Z, dockimbel, commented:
<https://github.com/red/red/issues/360#issuecomment-11845210>

    This is a tough one. The issue is caused by redefining an action! used as source for an op!. The crash occurs in the first  function! compiled that uses `=` (happens to be `action?` defined in %boot.red). As function! values compilation is deferred, the crash happens once the main code is compiled (so `equal?: 1` is compile without problems). As functions deferred compilation doesn't saves all internal structures (symbols table, functions table,...), such code can cause side-effects in functions body blocks compilation.
    
    I need some time to think about this issue and how to fix it. I will need to re-examine the way functions are compiled anyway when introducing objects, so the resolution for this issue might need to wait for the work on objects to really start.

--------------------------------------------------------------------------------

On 2017-03-26T07:41:59Z, dockimbel, commented:
<https://github.com/red/red/issues/360#issuecomment-289264286>

    I will close this ticket as the compiler is not meant to support the redefinition of such words for now. Such feature may or may not be added on the road to 1.0, but as it is speculative, there is no need to keep this ticket open.

