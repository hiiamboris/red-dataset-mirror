
#85: Usage of undeclared struct field crashes the compiler
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/85>

Compiling

```
1 + s/i
```

one gets

```
** Script Error: Cannot use path on none! value
** Where: resolve-type
** Near: unless base-type? type/1 [...
```

Curiously, `s/i` by itself gives a proper compiler error message, albeit the fairly unhelpful one of `datatype not allowed` 



Comments:
--------------------------------------------------------------------------------

On 2011-06-09T19:13:45Z, dockimbel, commented:
<https://github.com/red/red/issues/85#issuecomment-1336490>

    A compilation error is now raised in both cases.
    
    Tested OK.

