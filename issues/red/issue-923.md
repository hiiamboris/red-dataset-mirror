
#923: Compiled contexts don't bind methods deeply
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/923>

```
Red []

c: context [
    a: none
    ?? a

    f: does [
        ?? a
        print a
        print [a]
    ]
]
c/f
```

a: none
a: none
none
**\* Error: word has no value!
unset



