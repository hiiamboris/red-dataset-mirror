
#102: EITHER crashes on returning unset
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/102>

```
x: does []
either true [x] [x]
```

Results in:

```
*** Compiler Internal Error: Script Error : equal-types? expected type1 argument of type: word
*** Where: comp-either 
*** Near:  [last-type: either equal-types? t-true t-false]
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-24T00:21:46Z, PeterWAWood, commented:
<https://github.com/red/red/issues/102#issuecomment-1429461>

    Test added to cond-expr-test.r to reflect this issue.

--------------------------------------------------------------------------------

On 2011-06-24T08:31:32Z, dockimbel, commented:
<https://github.com/red/red/issues/102#issuecomment-1431056>

    Now compiles without error.

