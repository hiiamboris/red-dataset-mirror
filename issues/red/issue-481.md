
#481: WITH can't find symbols in cascaded CONTEXTs
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/481>

```
Red/System []

c1: context [
    x: 1
    f: does []
]
with c1 [
    c2: context [
        x: 2
        f: does []
    ]
]
with c2 [
    c2/f
    print-line c2/x
    print-line x
    f
]
```

c2/f is the only form found, the other three fail:

-= Red/System Compiler =- 
**\* Compilation Error: undefined symbol: c2/x 
**\* at line: 15 
**\* near: [c2/x 
    print-line x 
    f
]



Comments:
--------------------------------------------------------------------------------

On 2013-06-05T16:51:39Z, dockimbel, commented:
<https://github.com/red/red/issues/481#issuecomment-18991227>

    That is a complex one to solve...

--------------------------------------------------------------------------------

On 2013-08-09T13:19:29Z, dockimbel, commented:
<https://github.com/red/red/issues/481#issuecomment-22393546>

    Fixing this is postponed for now, once Iget a wide enough window to process it, I will try to fix it.

--------------------------------------------------------------------------------

On 2013-10-24T18:34:47Z, dockimbel, commented:
<https://github.com/red/red/issues/481#issuecomment-27018052>

    The fix was done for another context issue, but it fixes a whole class of namespaces issues, including this one.

