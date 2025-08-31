
#1276: Compiler does not type-check GET/SET arguments
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1276>

Compiled GET/SET and probably most of what the compiler processes as keywords , don't provide arguments type-checking, leading to runtime crashes if the right types are not provided.

```
Red []

probe get none
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-06T17:44:02Z, dockimbel, commented:
<https://github.com/red/red/issues/1276#issuecomment-180819081>

    Implemented by commit [2595d57c](https://github.com/red/red/commit/24e03a995071818a3cf36d90466b4fa82595d57c).

