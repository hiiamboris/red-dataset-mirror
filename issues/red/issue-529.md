
#529: REDUCE can't execute native! references
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
<https://github.com/red/red/issues/529>

```
Red []

load*: :load
probe do [load* ""]
probe reduce [load* ""]
```

[]
[make native! [[{Returns a value or block of values by reading and evaluating a source.} source [file! url! string! binary! block!] /header "TBD: Include Red header as a loaded value" /all "TBD: Don't evaluate Red header" /type "TBD:" /into {Put results in out block, instead of creating a new block} out [block!] "Target block for results, when /into is used"]] ""]



Comments:
--------------------------------------------------------------------------------

On 2013-09-13T20:53:35Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/529#issuecomment-24423857>

    I don't remember: is REDUCE compiled?

--------------------------------------------------------------------------------

On 2013-09-13T20:55:09Z, dockimbel, commented:
<https://github.com/red/red/issues/529#issuecomment-24423951>

    Yes, it is. It has two implementations, one for the static compiler and one for the runtime (used by the interpreter).

--------------------------------------------------------------------------------

On 2013-09-13T20:55:48Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/529#issuecomment-24423983>

    Thanks. Fell in the trap again. :-)

