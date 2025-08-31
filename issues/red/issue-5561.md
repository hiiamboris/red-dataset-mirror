
#5561: Empty vector collapses when molded
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5561>

**Describe the bug**

Both integer-32 and float-64 vectors share the same `mold` prefix, so without any data they collapse:
```
>> append do load probe mold/all clear make vector! [0] 1
"make vector! []"
== make vector! [1]
>> append do load probe mold/all clear make vector! [0.0] 1.0
"make vector! []"
*** Script Error: invalid argument: 1.0
*** Where: append
*** Near : append do load probe mold/all clear make 
*** Stack:  
```
Note in the second case how float-64 vector became an integer-32 vector after a mold/load cycle, and cannot receive float values anymore.

**Expected behavior**

Vector type should round-trip.

The easiest solution I think is to mold the ambiguous case more strictly as `make vector! [float! 64 []]` for the empty float-64 vector.

**Platform version**
`Red 0.6.5 for Windows built 9-Nov-2024/4:54:12+07:00  commit #fc80690`


