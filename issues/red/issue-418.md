
#418: FUNCTION can't include nested functions
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/418>

I also suspect FUNCTION tries to collect locals from nested functions, while it should skip them, at least if it's a FUNCTION or it has its own /local section.

```
Red []

f: function [
][
    g: func [
    ][
    ]
]
```

-= Red Compiler =- 
**\* Red Compiler Internal Error: Script Error : index? expected series argument of type: series port 
**\* Where: get-word-index 
**\* Near:  [index? find ctx name]



Comments:
--------------------------------------------------------------------------------

On 2013-02-27T00:39:19Z, dockimbel, commented:
<https://github.com/red/red/issues/418#issuecomment-14149402>

    This commit fixes that specific compiler crash, but remember that functions declared in functions is not really supported for now, so you might run into other unpredictable issues, that might not be fixable before a while. You would need to wait for the contexts support to be completed first (once object! will be fully supported).

