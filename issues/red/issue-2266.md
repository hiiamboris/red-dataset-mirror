
#2266: Comparison operators not allowed between integer and percent (in that order only)
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2266>

The other way around is no problem

```
red>> 50% < 1
== true
red>> 1 > 50%
*** Script Error: cannot compare 1 with 50%
*** Where: >
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-19T12:19:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2266#issuecomment-280915468>

    For sake of consistency and compatibility with Rebol, both ways should work.

