
#1167: CASE refinement /ALL not running all cases, incorrect return value
================================================================================
Issue is closed, was reported by hostilefork and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1167>

In 0.5.3:

```
case/all [
    1 < 2 [print "This runs (as expected)"]
    true [print "This does not run (and it should)"]
]
```

Result is:

```
This runs (as expected)
== none
```

Expected it to run both clauses and return UNSET!, so:

```
This runs (as expected)
This does not run (and it should)
```

Behavior observed locally and at http://tryrebol.esperconsultancy.nl/



