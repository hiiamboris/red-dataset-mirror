
#1193: Different definitions of GENERIC_READ and GENERIC_WRITE
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1193>

In `%system/library/windows.reds` we find

```
#define GENERIC_WRITE   80000000h
#define GENERIC_READ    40000000h
```

In `%runtime/simple-io.reds` and `%runtime/platform/win32.reds` we find

```
#define GENERIC_WRITE   40000000h
#define GENERIC_READ    80000000h
```

Which set of definitions is correct?



Comments:
--------------------------------------------------------------------------------

On 2015-05-31T14:05:44Z, dockimbel, commented:
<https://github.com/red/red/issues/1193#issuecomment-107190393>

    The second one is correct. The first one is coming from the common library code written by Bruno Anselme for his contributed libraries.

