
#334: Macro doesn't take paren! anymore
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/334>

This worked before #319:

```
Red/System []

#define def (a) [
    v: a
]
b: true
def ((not b))
```

**\* Compiler Internal Error: Script Error : Expected one of: word! - not: paren!
**\* Where: inject
**\* Near:  [change/only pos to type pick]



Comments:
--------------------------------------------------------------------------------

On 2012-12-08T12:08:02Z, dockimbel, commented:
<https://github.com/red/red/issues/334#issuecomment-11157982>

    Fixed by commit [f183414f](https://github.com/dockimbel/Red/commit/f183414fa4ec35a74c5e70907bf593ca0023130d) (commit references the wrong ticket).

