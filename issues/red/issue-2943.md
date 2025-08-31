
#2943: CHANGE/PART gives wrong result when first two arguments are the same series
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/2943>

```
a: "ABC"
b: next a
c: next b
head change/part a b c
== "C"
```
The result is wrong, it should be "BCC" (it's correct in Rebol2/3). Another case:
```
a: "ABC...DEF"
head change/part at a 4 skip a 6 3
== "ABCDEF"
```
Wrong again, it should be `"ABCDEFDEF"`.

The reason is that the implementation of `change` wrongly assumes that `/part` is always an insertion, while it can be also an overwrite or, an overwrite+insertion.


Comments:
--------------------------------------------------------------------------------

On 2017-07-30T07:49:34Z, dockimbel, commented:
<https://github.com/red/red/issues/2943#issuecomment-318885191>

    I think we should rewrite CHANGE completely, maybe merging it with MOVE in a single function (they are very similar, and MOVE handles well the same series case).

