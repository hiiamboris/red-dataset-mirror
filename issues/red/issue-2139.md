
#2139: Percent! * integer! == float!
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2139>

```
red>> 1% * 1
== 0.01
```

I expected percent! as a result. It seems correct for `1 * 1%` to return a float! though, which it does.

If it's by design, it needs to be doc'd.



