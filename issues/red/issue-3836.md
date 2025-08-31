
#3836: Crashes in FORALL
================================================================================
Issue is closed, was reported by qtxie and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3836>

**Describe the bug**
```
Red []

b: make block! 100000
loop 100000 [append b random 99999]
forall b [
    bb: copy b
]
```

**To reproduce**
Run code above in the console, will get a crash.
```
... ...
root size: 2667, root max: 4470, cycles: 8448
root size: 2667, root max: 4470, cycles: 8449

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

**Expected behavior**
No crashes

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 3-Apr-2019/11:42:28+02:00
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-03T10:41:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/3836#issuecomment-479435829>

    Can't reproduce on W7:
    GUI console:
    ```
    >> forall b [
    [        bb: copy b
    [    ]
    == [94965]
    ```
    Custom-built cli console with view and -d:
    ```
    root size: 3488, root max: 4899, cycles: 51309
    root size: 3488, root max: 4899, cycles: 51310
    root size: 3488, root max: 4899, cycles: 51311
    == [94965]
    ```
    
    @qtxie most likely you've encountered the heisenbug that's been annoying me for months. I can already reproduce it more or less stably with the RebolSDK-built console, but it happens very rarely and randomly in the debug (`-d`) version on W7.

--------------------------------------------------------------------------------

On 2019-04-03T20:49:44Z, qtxie, commented:
<https://github.com/red/red/issues/3836#issuecomment-479653347>

    I compiled the the cli conosle in debug mode (-d) without view. It always crashes.

--------------------------------------------------------------------------------

On 2019-04-03T20:52:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/3836#issuecomment-479654322>

    Great!

