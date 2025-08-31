
#1204: Misleading error message given by TO
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1204>

I was experimenting with the new map literals.

```
red>> to block! #()
*** Script error: to does not allow map for its type argument
*** Where: to
```

Should this not be .`..for its *spec* argument`?



Comments:
--------------------------------------------------------------------------------

On 2015-06-07T08:42:31Z, dockimbel, commented:
<https://github.com/red/red/issues/1204#issuecomment-109722402>

    `to` is not officially supported yet, the implementation is pending. Only `integer!` <=> `float!` conversions are supported for now.

