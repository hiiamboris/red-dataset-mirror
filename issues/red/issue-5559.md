
#5559: Molding of unset still doesn't round-trip
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5559>

**Describe the bug**

This was reported twice but still remains unsolved:
- https://github.com/red/red/issues/3409#issuecomment-557267592
- https://github.com/red/red/issues/4126#issuecomment-557804476

```
>> type? load "#(unset)"
== unset!
>> mold/all ()
== "unset"
>> type? load mold/all ()
== word!
```

**To reproduce**

`type? load mold/all ()`

**Expected behavior**

Returned type should be `unset!`

**Platform version**
`Red 0.6.5 for Windows built 9-Nov-2024/4:54:12+07:00  commit #fc80690`


Comments:
--------------------------------------------------------------------------------

On 2024-11-20T19:21:46Z, greggirwin, commented:
<https://github.com/red/red/issues/5559#issuecomment-2489372157>

    Copying from `none` should be easy enough. 
    ```
    		either all? [
    			string/concatenate-literal buffer "#(unset)"
    			part - 8
    		] [
    			form value buffer arg part
    		]
    ```
    OK with you @dockimbel ?

--------------------------------------------------------------------------------

On 2024-11-20T22:28:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5559#issuecomment-2489664317>

    @greggirwin Yes, it's fine.

--------------------------------------------------------------------------------

On 2024-11-26T01:30:35Z, greggirwin, commented:
<https://github.com/red/red/issues/5559#issuecomment-2499386282>

    Change made. Next need to update tests.

--------------------------------------------------------------------------------

On 2024-11-26T09:25:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5559#issuecomment-2500090425>

    Not good, can't call `form` there (see my comments in the commit page).

