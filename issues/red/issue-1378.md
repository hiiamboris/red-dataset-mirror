
#1378: Math operations problem on different sized tuple!s
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1378>

Math operations results on different sized tuple!s are unpredictable:

`red>> 0.0.0 + 1.1.1.1 ;== 5.1.1`

`red>> 1.0.0 + 1.1.1.1 ;== 5.1.1`

`red>> 1.2.3 + 3.2.1.0 ;== 7.4.4`

`red>> 0.1.2.3 + 3.2.1 ;== 3.3.3.3`

`red>> 1.1.1 * 2.2.2.0 ;== 8.2.2`

> Note from PeterWAWood
> Line 139 of tuple.reds may be the problem:

`tp1/1: as byte! size2`



