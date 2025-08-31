
#2202: Invalid parsing of pair!
================================================================================
Issue is closed, was reported by ifgem and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2202>

```
10x
*** Script Error: x has no value
*** Where: catch
x: "wow"
10x => "wow"
10x10x => "wow"

100hx => "wow"
100hx100
*** Script Error: x100 has no value
*** Where: catch
100x1x00
*** Script Error: x00 has no value
*** Where: catch
100xx100
*** Script Error: xx100 has no value
*** Where: catch
```



