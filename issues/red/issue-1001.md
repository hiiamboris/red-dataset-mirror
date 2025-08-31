
#1001: Incorrect output of HELP on objects
================================================================================
Issue is closed, was reported by endo64 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1001>

"?" on objects doesn't show the correct datatypes of object fields, it shows "datatype!" instead:

```
red>> o: context [a: 1 b: "x"]
red>> ? o
`o` is an object! of value:
     a                datatype! 1
     b                datatype! x
```



Comments:
--------------------------------------------------------------------------------

On 2015-01-02T15:18:20Z, dockimbel, commented:
<https://github.com/red/red/issues/1001#issuecomment-68533481>

    Should have been in the commit log, posting here for the record: now `words-of` returns a block of words bound to the object's context.

--------------------------------------------------------------------------------

On 2015-01-02T16:17:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/1001#issuecomment-68538420>

    You can rewrite Git history.

