
#20: WISH: Make COMPOSE work on MAP!
================================================================================
Issue is open, was reported by rebolek and has 0 comment(s).
<https://github.com/red/REP/issues/20>

Right now, it's possible to pass `map!` to `compose`, but nothing happens:
```
>> compose #(a: (now))
== #(
    a: (now)
)
```

It would be nice, if `compose` worked on `map!`, so instead of:
```
>> make map! compose [a: (1 + 1)]
== #(
    a: 2
)
```
we could write:
```
>> compose #(a: (1 + 1))
== #(
    a: 2
)
```


