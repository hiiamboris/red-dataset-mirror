
#871: Get-path! inconsistency between compiled and interpreted version.
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/871>

```
red>> type? first first [:a/b]
== word!                               ;returns get-word! in the compiled version
```

Both results should be same - just word!



