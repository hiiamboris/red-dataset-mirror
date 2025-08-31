
#3384: Wrong error message when giving wrong accessor to time value
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
<https://github.com/red/red/issues/3384>

### Expected behavior
```
>> t: 0:00
== 0:00:00
>> t/day
*** Script Error: cannot access day in path t/day
*** Where: catch
*** Stack:  
```
### Actual behavior
```
>> t: 0:00
== 0:00:00
>> t/day
*** Script Error: cannot access day in path [script invalid-path]
*** Where: catch
*** Stack:  
```
### Steps to reproduce the problem
run the above code
### Red and platform version
```
any
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-10T18:58:22Z, meijeru, commented:
<https://github.com/red/red/issues/3384#issuecomment-388151613>

    I seem to remember having made a similar issue for another datatype (since then solved). For this one, I am not sure it has already been reported. 

--------------------------------------------------------------------------------

On 2018-05-10T19:04:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/3384#issuecomment-388153270>

    https://github.com/red/red/blob/e0a31a954b223ca9767c73d99ce26891d83440c1/runtime/datatypes/time.reds#L281
    should be `fire [TO_ERROR(script invalid-path) path element` ?
    same bug with pair!

--------------------------------------------------------------------------------

On 2019-01-06T20:58:01Z, meijeru, commented:
<https://github.com/red/red/issues/3384#issuecomment-451774235>

    Merged  and therefore solved.

