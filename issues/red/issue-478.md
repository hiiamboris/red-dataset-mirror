
#478: CONTEXT doesn't give itself priority
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [Red/System]
<https://github.com/red/red/issues/478>

```
Red/System []

c1: context [
    f: func [a [integer!]] []
]
with c1 [c2: context [
    f: does []
    f
]]
```

-= Red/System Compiler =- 
**\* Compilation Error: missing argument 
**\* at line: 8 
**\* near: [
    f
]



Comments:
--------------------------------------------------------------------------------

On 2013-05-18T17:09:50Z, dockimbel, commented:
<https://github.com/red/red/issues/478#issuecomment-18104556>

    IIRC, defining a new context in a WITH body block is not supported by the implementation. I will have a look to see if it can be supported. In the meantime, if you put the WITH inside the CONTEXT, that might work as a workaround.

--------------------------------------------------------------------------------

On 2013-05-19T02:51:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/478#issuecomment-18111481>

    I already tried that, with the same result. This seemed the best example to me to report, because the non-working CONTEXT is the most inner construct, so would be expected to have priority.

