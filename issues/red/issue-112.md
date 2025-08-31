
#112: Redefinition of function as variable is not trapped 
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/112>

The following compiles OK while it should perhaps not:

```
f: func [/local h][h: func [ ][ ] h: 1]
```

The converse (defining `h` first as variable and then as function), _is_ trapped)



Comments:
--------------------------------------------------------------------------------

On 2011-06-26T17:07:56Z, dockimbel, commented:
<https://github.com/red/red/issues/112#issuecomment-1441830>

    Now it will raise a compilation error as in the reversed case.

