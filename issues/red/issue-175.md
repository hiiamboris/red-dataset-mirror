
#175: not as-logic alias broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/175>

```
s!: alias struct! [x [integer!]]
p: declare s!
print [p lf]
unless as-logic p [
    print "true = as-logic not non-null^/"
]
```

0804C5D6
true = as-logic not non-null



