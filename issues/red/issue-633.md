
#633: Can't compile #"^(back)"
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/633>

-=== Red Compiler 0.4.1 ===- 

Compiling /home/kaj/Red/XML/examples/bug.red ...
**\* Syntax Error: Invalid char! value
**\* line: 3
**\* at: {#"^^(back)"}

This is a very recent regression.



Comments:
--------------------------------------------------------------------------------

On 2013-12-29T15:41:20Z, dockimbel, commented:
<https://github.com/red/red/issues/633#issuecomment-31319103>

    It was most probably caused by the recent fix on the hexa characters handling in strings. Now, qtxie has added proper support for it.

