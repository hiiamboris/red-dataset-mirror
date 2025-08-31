
#2265: Shell console paste problem with func def, :type, tabs in comments
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
<https://github.com/red/red/issues/2265>

Yeah, it's an odd combination, and this is as far as I've tracked it down. The keys:
- Have a comment with a path ending in `/:type` in it
- _After_ `/:type` have one more more tabs, then another semicolon
- Paste into the shell console (GUI console works without issue)

```
red>> fn: does [
[    ; blk: __foo/:bar    ;
[     new-line/all [] on
[    ]
== func [][
    new-line/all [] on
]
red>>
red>> fn: does [
[    typeset! type? typeset?
[    ; blk: __foo/:type ;
[     new-line/all [] on
[    ]
== func [][
    new-line/all [] on
]
red>>
red>> fn: does [
[    typeset! type? typeset?
[    typeset! type? typeset?
[    ; blk: __foo/:type     ;
[     new-line/all [] on
[    ]
== func [][
    new-line/all [] on
]
red>>
red>> fn: does [
[    typeset! type? typeset?
[    typeset! type? typeset?
[    typeset! type? typeset?
[    ; blk: __foo/:type         ;
[     new-line/all [] on
[    ]
== func [][
    new-line/all [] on
]
red>>
red>> fn: does [
[    typeset! type? typeset?
[    typeset! type? typeset?
[    typeset! type? typeset?
[    typeset! type? typeset?
[    ; blk: __foo/:type             ;
[     new-line/all [] on
[    ]
== func [][
    new-line/all [] on
]
```

Seeing it as tab completion perhaps?



Comments:
--------------------------------------------------------------------------------

On 2017-05-10T15:05:44Z, qtxie, commented:
<https://github.com/red/red/issues/2265#issuecomment-300511695>

    Fixed by commit: 9625f3c52408fcd555e1a4346f98f56db59f588c

