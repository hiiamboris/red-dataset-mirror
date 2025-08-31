
#913: Object! can't clone itself with SELF
================================================================================
Issue is closed, was reported by WayneCui and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/913>

For interpreter:

```
Red []

person: make object! [
    name: none
    new: func [ n ][
        make self [
            name: n
        ]
    ]
]

Bob: person/new "Bob"
probe Bob/name   ;the result is none; in Rebol, it is "Bob"
```

Changing `make self [...]` to `make person [...]` is fine.



