
#1275: SAME? doesn't work in some cases
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1275>

SAME? doesn't work for the following case:

```
>> o: context [f: does [self]]
>> x: o/f
>> same? o x
== false  ;should be true
```



Comments:
--------------------------------------------------------------------------------

On 2015-11-07T01:34:07Z, qtxie, commented:
<https://github.com/red/red/issues/1275#issuecomment-154595806>

    It works now in gui branch.

