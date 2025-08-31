
#1895: COLLECT shadows 'body arg from caller
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1895>

```
fn: func [body [block!]] [
    collect [
        print mold body ; This is the body of COLLECT
        ;do body        ; << this crashes the console, even if 'body is empty
    ]
]
fn [print 'test]
```



