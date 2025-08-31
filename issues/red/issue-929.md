
#929: Compiled contexts can't call own methods
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/929>

```
Red []

c: context [
    f: does [
        print "*"
    ]
    g: does [
        do [f]
        print "!"
        f
    ]
]
c/g
```

*
!



