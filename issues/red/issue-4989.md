
#4989: if/either treatment of unset is diverse
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.duplicate] [type.design]
<https://github.com/red/red/issues/4989>

**Describe the bug**

```
>> unset 'x
>> either :x [1][0]
*** Script Error: block did not return a value
*** Where: either
*** Stack: 
```
R2 allows unset for `all`/`any`, but not for `if`/`either`/`case`
R3 allows it for `if`, `either`, `all`/`any`, but not for `case`
Red allows it for `if`, `all`/`any` but not for `either`/`case`

**Expected behavior**

Gregg suggests that we add error to `if ()` as well. 
In any case, consistency is preferable.

**Platform version**
```
Red 0.6.4 for Windows built 7-Oct-2021/14:56:13+03:00  commit #7218fb4
```



Comments:
--------------------------------------------------------------------------------

On 2023-08-24T18:01:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4989#issuecomment-1692176662>

    dupe of https://github.com/red/red/issues/4482

