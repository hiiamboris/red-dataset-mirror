
#2138: Set-path sets wrong value in interpreter
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2138>

`forall` is erroneous in this case:
red:

```
  b: [1 2 3 4 5]
;   [1 2 3 4 5]
  forall b [i: b/1: form b/1]
;   "5"
  b
;   [i: i: i: i: i:]
```

rebol:

```
  b: [1 2 3 4 5]                            
;   [1 2 3 4 5]
  forall b [i: b/1: form b/1]               
;   "5"
  b
;   ["1" "2" "3" "4" "5"]
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-31T08:31:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2138#issuecomment-236418009>

    It is not a `forall` bug, but a set-path bug, most probably the same as in #1993.

