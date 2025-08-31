
#364: Red #include does not support relative path
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/364>

```
Red []

#include %../SQLite.red
```

-= Red Compiler =- 
Compiling /home/kaj/Red/SQLite/examples/test.red ...
**\* Compilation Error: include file not found: ../SQLite.red 
**\* in file: %/home/kaj/Red/SQLite/examples/test.red
**\* near: [
    #include %../SQLite.red 
]



Comments:
--------------------------------------------------------------------------------

On 2013-01-03T12:24:20Z, dockimbel, commented:
<https://github.com/red/red/issues/364#issuecomment-11842047>

    Can you confirm me that this fix works for you?

--------------------------------------------------------------------------------

On 2013-01-03T17:36:49Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/364#issuecomment-11852687>

    Yep, thanks!

