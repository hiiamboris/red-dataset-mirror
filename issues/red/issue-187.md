
#187: Initial NULL assignment blocks type inference
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/187>

```
Red/System []

test: function [
    address             [byte-ptr!]
    /local x
][
    x: null

    if yes [
        x: address
    ]
]
```

   **\* Compilation Error: Invalid null assignment

This must currently be fixed by specifying the type for X. I guess the type resolver should keep looking to infer the type further on.



Comments:
--------------------------------------------------------------------------------

On 2011-10-29T13:47:41Z, dockimbel, commented:
<https://github.com/red/red/issues/187#issuecomment-2564959>

    The type inference method built in Red/System compiler is very simple and intentionally limited. The compiler is doing his job in a single pass (parsing + code generation), so it is not able to perform a full look-ahead static analysis. Such approach would require a different compiler architecture, and would heavily impact compiler's complexity and performances.

--------------------------------------------------------------------------------

On 2011-10-29T16:15:24Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/187#issuecomment-2565589>

    This would be good to document in the manual, as it affects the language semantics.

--------------------------------------------------------------------------------

On 2012-01-05T16:43:00Z, dockimbel, commented:
<https://github.com/red/red/issues/187#issuecomment-3372249>

    It is already documented in 4.6.6: "So, null cannot be used as initializing value for a global variable or a local variable that does not have an explicit type specification."
    
    Let me know if I need to highlight this more or reformulate it.

--------------------------------------------------------------------------------

On 2012-01-05T21:50:53Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/187#issuecomment-3376923>

    I was thinking to document the fact that the compiler is single pass, including the type inference. This would have helped me to predict this situation.

