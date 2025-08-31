
#227: Float! minus float! in struct! changes sign
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/227>

See this code:

```
t: 2.2
s: declare struct! [v [float!]]
s/v: 2.0
print [t - s/v lf]
```

This prints -0.2 instead of 0.2



