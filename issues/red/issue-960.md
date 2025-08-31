
#960: Compiler crash on accessing nested object from function
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/960>

```
Red []

c: object [
    d: object [
    ]
]

f: func [
][
    c/d
]
```

-=== Red Compiler 0.4.3 ===- 

**\* Red Compiler Internal Error: Script Error : Invalid path value: c 
**\* Where: emit-deep-check 
**\* Near:  [func-objs/c]



Comments:
--------------------------------------------------------------------------------

On 2014-10-18T23:52:42Z, PeterWAWood, commented:
<https://github.com/red/red/issues/960#issuecomment-59634177>

    Also gives an error under the interpreter

