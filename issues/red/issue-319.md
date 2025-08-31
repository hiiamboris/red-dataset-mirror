
#319: Preprocessor should replace all word types
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.wish] [Red/System]
<https://github.com/red/red/issues/319>

```
#define clear (variable) [
    variable: 0
]
clear (x)
```

This creates a variable `variable` instead of a variable `x`. Some cases can be done by passing in a set-word as argument to the macro, but the preprocessor would be more useful if it would replace all word types.



Comments:
--------------------------------------------------------------------------------

On 2012-11-27T09:05:17Z, dockimbel, commented:
<https://github.com/red/red/issues/319#issuecomment-10750531>

    Sounds fair enough.

--------------------------------------------------------------------------------

On 2012-12-07T12:33:38Z, dockimbel, commented:
<https://github.com/red/red/issues/319#issuecomment-11128555>

    Missing get-words processing.

