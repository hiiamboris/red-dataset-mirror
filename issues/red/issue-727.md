
#727: COLLECT in Parse ignores a word sub-rule
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/727>

```
rule: [(print "here")]
parse "a" [collect rule]
```

will not print anything.



