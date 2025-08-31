
#2143: Runtime crash on making object with set-word! in spec.
================================================================================
Issue is closed, was reported by ifgem and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2143>

works.

```
ts: [10]
t-o: object []
make t-o ts
```

crashes red runtime.

```
ts: [test: 10]
t-o: object []
make t-o ts
```

raise a error as expected.

```
ts: [test:]
t-o: object []
make t-o ts
```



