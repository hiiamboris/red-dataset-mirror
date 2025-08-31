
#309: Paren with infix expression leads to compiler error
================================================================================
Issue is closed, was reported by earl and has 6 comment(s).
[status.resolved]
<https://github.com/red/red/issues/309>

Test code:

``` rebol
Red []
(1 - 1)
```

Compiler error:

```
*** Red Compiler Internal Error: Script Error : search-expr-end expected pos argument of type: block 
*** Where: check-infix-operators 
*** Near:  [end: search-expr-end pos 
ops: make
] 
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-20T22:53:15Z, meijeru, commented:
<https://github.com/red/red/issues/309#issuecomment-10577595>

    See issue #302: parens not yet implemented

--------------------------------------------------------------------------------

On 2012-11-20T23:39:42Z, dockimbel, commented:
<https://github.com/red/red/issues/309#issuecomment-10579446>

    Right, parens support has not been yet added, it will be very soon, probably this week.

--------------------------------------------------------------------------------

On 2012-11-23T15:11:54Z, dockimbel, commented:
<https://github.com/red/red/issues/309#issuecomment-10662130>

    Parens datatype and compilation support added by commit [953857ec](https://github.com/dockimbel/Red/commit/953857ec4ae4aa2bc1fcb759e032307467e2e71c).

