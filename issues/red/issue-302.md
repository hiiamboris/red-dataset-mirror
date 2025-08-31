
#302: Parentheses in expression give error
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/302>

Not sure if this is already part of the syntax that the compiler can handle. If not, please forget the issue.

```
1 + (2 * 3)

-= Red Compiler =-
Compiling red/tests/mytest.red ...
*** Red Compiler Internal Error: Script Error : search-expr-end expected pos argument of type: block
*** Where: check-infix-operators
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

On 2012-11-12T23:58:37Z, dockimbel, commented:
<https://github.com/red/red/issues/302#issuecomment-10310001>

    Parentheses support has not been yet implemented (it will be very soon).

