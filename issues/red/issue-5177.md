
#5177: Deceptive error message from `set-quiet`
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5177>

**Describe the bug**
```
>> o: object []
== make object! []
>> set-quiet in o 'x 1
*** Script Error: set-quiet does not allow word! for its word argument    ;) what???
*** Where: set-quiet
*** Near : 1
*** Stack:  
```

**To reproduce**

`set-quiet none 1`

**Expected behavior**

"Doesn't accept none for it's word argument"

**Platform version**
```
red-view-14aug22-4eb8ad83f.exe
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-16T12:19:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5177#issuecomment-1216560246>

    https://github.com/red/red/issues/4516

