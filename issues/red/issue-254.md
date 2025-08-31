
#254: Cannot use #enum as argument type in CONTEXT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/254>

```
c: context [
    #enum e! [
        x
    ]

    f: function [
        a [e!]
    ][
    ]
]
```

**\* Compilation Error: invalid definition for function c/f: [e!] 
**\* in file: %/users/administrator/Red/Red-C-library/examples/test.reds 
**\* at line: 8 
**\* near: [function [
        a [e!]
    ] []

I thought this was fixed somewhere before, but I'm not sure.



Comments:
--------------------------------------------------------------------------------

On 2012-09-18T08:08:47Z, dockimbel, commented:
<https://github.com/red/red/issues/254#issuecomment-8644735>

    Fixed in v0.3.0 branch.

