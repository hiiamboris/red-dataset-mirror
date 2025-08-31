
#3705: stack overflow on limited append/insert
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3705>

**Describe the bug**
```
>> append/dup #{} #{20} 5000
*** Internal Error: stack overflow
*** Where: append
*** Stack:  

>> insert/dup #{} #{20} 5000
*** Internal Error: stack overflow
*** Where: insert
*** Stack:  
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Dec-2018/5:42:09+03:00 commit #6968dad
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-05T07:03:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3705#issuecomment-451633682>

    Confirmed. Seems to trigger at 3'968.

--------------------------------------------------------------------------------

On 2019-01-05T07:05:12Z, greggirwin, commented:
<https://github.com/red/red/issues/3705#issuecomment-451633750>

    Only seems to affect binary!, not string!

--------------------------------------------------------------------------------

On 2019-01-05T07:14:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3705#issuecomment-451634118>

    Integers are handled differently in binary! insert, and don't suffer from this problem. All other types do a stack/push*.

--------------------------------------------------------------------------------

On 2019-01-05T10:12:14Z, endo64, commented:
<https://github.com/red/red/issues/3705#issuecomment-451643292>

    Confirmed. Happens at 3970 for me. Same for `char!` values:
    
    ```
    >> append/dup #{} #"A" 3970
    *** Internal Error: stack overflow
    ```

