
#400: Using ANY nested in ALL produces wrong results
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/400>

This was the cause of Hello World failing at the DevCon demo.

```
Red []

probe all [
    any [
        true
        probe "*"
        true
    ]
    probe "!"
]
```

"*"
"!"
"!"

```
probe all [
    any [
        false
        probe "*"
        true
    ]
    probe "!"
]
```

none

```
probe all [
    any [
        none
        probe "*"
        true
    ]
    probe "!"
]
```

none



