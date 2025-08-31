
#148: Cast lost in double addition
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/148>

```
i: declare pointer! [integer!]
b: declare pointer! [byte!]
i: (as pointer! [integer!] b) + 1 + 1
```

**\* Compilation Error: attempt to change type of variable: i
**\* from: [pointer! [integer!]]
**\*   to: [pointer! [byte!]]
**\* in file: %/users/administrator/Red/Red-SDL/examples/sdl-test.reds
**\* at:  [
    i: + + (as pointer! [integer!] b) 1 1
]



