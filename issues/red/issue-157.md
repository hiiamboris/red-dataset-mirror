
#157: Missing test on system/stack gives Compilation error
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/157>

The compiler does not test for path-length > 3 in dealing with system/stack.

```
system/stack/top/bla

*** Compilation Error: undefined pointer index variable
```



Comments:
--------------------------------------------------------------------------------

On 2011-08-16T14:19:32Z, dockimbel, commented:
<https://github.com/red/red/issues/157#issuecomment-1816632>

    This case is caught by a compilation error, but the case where `bla` is defined compiles silently (which is much more worrying).

