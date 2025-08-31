
#21: Fetching a structure member does not always work
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.tested]
<https://github.com/red/red/issues/21>

The following program executes correctly:

```
  red/system []
  s: struct [a [integer!] b [c-string!]] 
  s/b: "hello"
  print s/b
```

But the following one does not, indicating that assignemtn of a fetched value is the problem, not storing or fetching as such.

```
  red/system []
  s: struct [a [integer!] b [c-string!]] 
  s/b: "hello"
  c: s/b
  print c
```



Comments:
--------------------------------------------------------------------------------

On 2011-04-28T21:31:41Z, dockimbel, commented:
<https://github.com/red/red/issues/21#issuecomment-1072451>

    The assignment support in the compiler is currently under heavy work so I guess this issue will be fixed in the next commit. Thanks for reporting it.

--------------------------------------------------------------------------------

On 2011-04-28T23:18:20Z, dockimbel, commented:
<https://github.com/red/red/issues/21#issuecomment-1073000>

    The issue is related to the different indirection levels between a c-string! stored in a global variable (variable points to the c-string!) and a c-string! stored in a struct! member (member holds the address of the c-string!). To solve this and other similar issues (same with struct! values wrt to global variables), the number of indirections for accessing a c-string! or struct! value, need to be consistent in all cases.

--------------------------------------------------------------------------------

On 2011-04-30T16:41:19Z, dockimbel, commented:
<https://github.com/red/red/issues/21#issuecomment-1081063>

    The new way to store struct! and c-string! global variables solved this issue.
    Fixed in commit: https://github.com/dockimbel/Red/commit/e55327fc91c9ea156aaf5777f8face36abade25f

--------------------------------------------------------------------------------

On 2011-05-09T11:41:55Z, dockimbel, commented:
<https://github.com/red/red/issues/21#issuecomment-1122365>

    Tested OK.

