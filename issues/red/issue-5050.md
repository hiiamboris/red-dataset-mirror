
#5050: sort/compare with integer comparator gives arg compatibility error
================================================================================
Issue is open, was reported by greggirwin and has 0 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/5050>

**Describe the bug**

```
>> sort/compare [[a 3] [c 1]] 2
*** Script Error: incompatible or invalid refinements
*** Where: sort
*** Near : 2
*** Stack:
```

Should work. In May-2020 it changed from "value out of range" to this error. 

**To reproduce**

Use `sort/compare` with an integer on a block of blocks.

**Expected behavior**

```
>>  sort/compare [[a 3] [c 1]] 2
== [[c 1] [a 3]]
```

**Platform version**

Red 0.6.4 for Windows built 21-Jan-2022/14:50:14-07:00  commit #c581e89



