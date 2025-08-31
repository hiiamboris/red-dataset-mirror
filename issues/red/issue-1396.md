
#1396: Misleading error message when an incorrect value is enclosed in () or []
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1396>

```
red>> 5+2
*** Syntax error: invalid value at 5+2

*** Where: do
red>> (5+2)
*** Syntax error: missing ) at (5+2)
*** Where: do
red>> [5+2]
*** Syntax error: missing ] at [5+2]
*** Where: do
```



Comments:
--------------------------------------------------------------------------------

On 2015-10-22T06:59:30Z, Skrylar, commented:
<https://github.com/red/red/issues/1396#issuecomment-150125371>

    Confirmed with the latest release build (054)

