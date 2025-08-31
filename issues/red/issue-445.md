
#445: PICK doesn't work on result of system/words
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
<https://github.com/red/red/issues/445>

PICK, and ordinal funcs based on it, work on a basic block:

```
red>> blk: [aaa bbb ccc]
== [aaa bbb ccc]
red>> first blk
== aaa
```

But not on the result of system/words:

```
red>> type? system/words
== block!
red>> first system/words
== d
red>> second system/words
== un
red>> third system/words
== non
```

The first three values in system/words are [datatype! unset! none!]

More interesting:

```
red>> first blk
== d
red>> second blk
== un
red>> print second blk
datatype
```

All values print "datatype"



Comments:
--------------------------------------------------------------------------------

On 2013-03-27T22:40:23Z, dockimbel, commented:
<https://github.com/red/red/issues/445#issuecomment-15557800>

    Same cause as #449. Fixed by the commit for #449.

