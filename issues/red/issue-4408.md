
#4408: Series operations for vectors are too limited
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/4408>

**Describe the bug**
```
>> vi': copy vi: make vector! 10
== make vector! [0 0 0 0 0 0 0 0 0 0]
>> change vi' vi
*** Script Error: invalid argument: make vector! [0 0 0 0 0 0 0 0 0 0]
*** Where: change
*** Stack:
>> append vi vi'
*** Script Error: invalid argument: make vector! [0 0 0 0 0 0 0 0 0 0]
*** Where: append
*** Stack:  
>> append vi vi         ;) can't append the vector to itself!
*** Script Error: invalid argument: make vector! [0 0 0 0 0 0 0 0 0 0]
*** Where: append
*** Stack:  
```
Although it allows `change` on the same vector:
```
>> change next vi vi
== make vector! []
>> length? vi
== 11
```

**Expected behavior**

Both `append`(`insert`) and `change` should be allowed on vectors of the same type and on the same vector.

**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-22T09:33:22Z, endo64, commented:
<https://github.com/red/red/issues/4408#issuecomment-617666824>

    Also asked some other set-ops support for vectors, see #3711 like `difference`, `intersect` etc. But I don't have a strong use case,
    

--------------------------------------------------------------------------------

On 2023-01-02T14:05:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4408#issuecomment-1368974831>

    https://github.com/red/red/issues/4080

