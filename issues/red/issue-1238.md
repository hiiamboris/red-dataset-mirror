
#1238: Incorrect error message for missing refinement with pick
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [type.documentation]
<https://github.com/red/red/issues/1238>

When trying to use pick with a missing refinement (/case), the error message referred to the refinement as pick instead of /case.

```
red>> pick/case #(a 1 b 2) 'B
*** Script error: pick has no refinement called pick
*** Where: pick
```



