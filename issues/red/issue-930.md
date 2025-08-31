
#930: Can't compile named context where /local follows /extern
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/930>

```
Red []

c: context [
    f: function [
        /extern x
        /local y
    ][
        x: 1
        set 'y 2
    ]
]
```

-=== Red Compiler 0.4.3 ===- 

**\* Compilation Error: duplicate word definition in function: f 
**\* near: [f: function [/extern x /local y] [x: 1 set 'y 2]]

The interpreter fails to make Y local:

== make object! [
    f: func [][x: 1 set 'y 2]
]



Comments:
--------------------------------------------------------------------------------

On 2014-09-15T02:16:58Z, dockimbel, commented:
<https://github.com/red/red/issues/930#issuecomment-55547790>

    `/local` is not supported by `function` constructor in Red. So I mark this as a wish.

--------------------------------------------------------------------------------

On 2014-09-15T02:23:10Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/930#issuecomment-55548016>

    Actually, it is, if you switch /local and /extern around, or if you don't assign the context to a word.

--------------------------------------------------------------------------------

On 2016-05-10T15:54:36Z, dockimbel, commented:
<https://github.com/red/red/issues/930#issuecomment-218203320>

    Compiled version works fine now.

--------------------------------------------------------------------------------

On 2016-05-10T16:16:31Z, dockimbel, commented:
<https://github.com/red/red/issues/930#issuecomment-218210091>

    Both compiled and interpreted version work fine now.

