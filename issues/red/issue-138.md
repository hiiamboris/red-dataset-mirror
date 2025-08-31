
#138: Parens not recognized as part of an infix expression
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/138>

A paren expression used as left argument in an infix expression wrongly raises a compilation error.

Example:

```
Red/System []

(1 + 2) and 3
```

will produce on compilation:

```
*** Compilation Error: parens are only allowed nested in an expression
```



