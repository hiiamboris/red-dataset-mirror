
#75: size? of non-simple value crashes compiler
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/75>

The function size? should be applied to a literal or word/path. When applied to a struct, it produces a crash instead of a compilation error.

``` rebol
size? struct [i [integer!]]
```

Error:

```
** Script Error: Cannot use path on none! value
** Where: resolve-type
** Near: unless base-type? type/1 [
type: select aliased-types type/1
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-10T16:43:23Z, dockimbel, commented:
<https://github.com/red/red/issues/75#issuecomment-1343531>

    Now a proper compilation error is raised on such case: `assignment expected for struct value`
    
    Tested OK.

--------------------------------------------------------------------------------

On 2011-06-10T20:30:17Z, meijeru, commented:
<https://github.com/red/red/issues/75#issuecomment-1344828>

    The error is also raised with `size? pointer [integer!]`, so the text should be `... pointer/struct value`

