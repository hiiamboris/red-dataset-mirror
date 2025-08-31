
#4833: Unwanted allocation in `bind`
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.review]
<https://github.com/red/red/issues/4833>

**Describe the bug**

Two expressions tested should be equivalent in action, but one of them wastes RAM and is slower:
```
>> recycle/off
>> context [x: 1  profile/count/show [ [bind [x] 'x] [bind [x] self] ] 400000]
Count: 400000
Time         | Time (Per)   | Memory      | Code
0:00:00.065  | 0:00:00      | 440         | [bind [x] 'x]
0:00:00.106  | 0:00:00      | 17600284    | [bind [x] self]
== make object! [
    x: 1
]
```
[`profile` is here](https://gist.githubusercontent.com/giesse/1232d7f71a15a3a8417ec6f091398811/raw/d0081ea01b595af67debdf9fb27d7141f0fb8784/profile.red) btw

**Expected behavior**

Under 500 bytes both.

**Platform version**
```
Red 0.6.4 for Windows built 16-Feb-2021/11:41:34+03:00 commit #0187423
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-25T10:55:09Z, dockimbel, commented:
<https://github.com/red/red/issues/4833#issuecomment-785807203>

    It's under-optimized, but the behavior is correct, so it's not a bug. ;-)

--------------------------------------------------------------------------------

On 2021-02-25T15:18:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4833#issuecomment-785978792>

    Ok ;)

