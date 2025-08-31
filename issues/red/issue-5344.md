
#5344: Set operations should allow mixing list types
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [test.written]
<https://github.com/red/red/issues/5344>

This has been discussed recently, but finding anything there is beyond me.

**Describe the bug**

Set operations internally promote block into hash, but annoyingly fail if (only) one is already promoted:
```
>> union [1 2] [2 3]
== [1 2 3]

>> union make hash! [1 2] make hash! [2 3]
== make hash! [1 2 3]

>> union make hash! [1 2] [2 3]
*** Script Error: expected hash! not block!
*** Where: union
*** Near : union make hash! [1 2] [2 3]
*** Stack:  

>> union [1 2] make hash! [2 3]
*** Script Error: expected block! not hash!
*** Where: union
*** Near : union [1 2] make hash! [2 3]
*** Stack:  
```

**Expected behavior**

Instead of erroring, I expect `hash!` to be returned from mixed `block!` + `hash!` inputs, because that doesn't require another conversion.

**Platform version**
```
Red 0.6.4 for Windows built 30-Jun-2023/16:48:30+03:00  commit #a3c4e0a
```


Comments:
--------------------------------------------------------------------------------

On 2023-07-10T16:21:43Z, dockimbel, commented:
<https://github.com/red/red/issues/5344#issuecomment-1629289654>

    Agreed on principle. @qtxie Should be easily done?

--------------------------------------------------------------------------------

On 2023-07-11T02:42:48Z, qtxie, commented:
<https://github.com/red/red/issues/5344#issuecomment-1630018979>

    > Agreed on principle. @qtxie Should be easily done?
    
    Pushed a commit to fix it.

