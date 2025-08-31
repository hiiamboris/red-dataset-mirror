
#979: Compilation error on SETting global function from unnamed context
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/979>

```
Red []

context [
    set 'f does []
]

f
```

```
*** Compilation Error: undefined word f 
*** near: [f]
```



Comments:
--------------------------------------------------------------------------------

On 2014-11-10T09:14:42Z, dockimbel, commented:
<https://github.com/red/red/issues/979#issuecomment-62358356>

    Unnamed contexts are not yet supported. I am working on it.

