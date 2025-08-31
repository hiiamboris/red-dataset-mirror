
#1682: Parse throws error
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
<https://github.com/red/red/issues/1682>

Take this code:

```
red>> parse {<title>asdf</title>} [thru <title> copy value to </title>]
*** Script error: PARSE - invalid rule or usage of rule: unset
*** Where: parse
```

This works fine in R3.



Comments:
--------------------------------------------------------------------------------

On 2016-03-08T09:39:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1682#issuecomment-193689146>

    Tag! datatype is not yet implemented.

