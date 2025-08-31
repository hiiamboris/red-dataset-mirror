
#5303: Mold issue when molding a file with index past its tail
================================================================================
Issue is open, was reported by Oldes and has 4 comment(s).
[status.waiting] [type.design]
<https://github.com/red/red/issues/5303>

Currently:
```red
>> src: %../
== %../
>> dir: tail src
== %""
>> clear src
== %""
>> dir
== %  ;<---- should be %""
```
It is related to: https://github.com/red/red/issues/3369


Comments:
--------------------------------------------------------------------------------

On 2023-04-09T03:44:07Z, qtxie, commented:
<https://github.com/red/red/issues/5303#issuecomment-1501031619>

    Either the modify actions/natives reset the head or the read actions/natives check it.

--------------------------------------------------------------------------------

On 2023-04-09T14:41:30Z, dockimbel, commented:
<https://github.com/red/red/issues/5303#issuecomment-1501144684>

    We'll see how to tackle that once we have an exhaustive specification for series. Currently, we just normalize past-end indexes back into the existing series range through the `_series/get-length` function.

