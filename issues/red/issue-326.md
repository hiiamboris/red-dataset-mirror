
#326: literal and get arguments do not allow a type spec
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/326>

`f: func[:a [integer!]][ ]` gives an error

```
*** Compilation Error: invalid function spec block: integer!
```

I suspect a bug in `check-spec`, or is this a feature? ;-)



Comments:
--------------------------------------------------------------------------------

On 2012-12-01T15:38:59Z, dockimbel, commented:
<https://github.com/red/red/issues/326#issuecomment-10918337>

    It looks like a bug. :-)

