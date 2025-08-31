
#2980: can't quit Red console after input invalid clause
================================================================================
Issue is closed, was reported by Dieken and has 8 comment(s).
<https://github.com/red/red/issues/2980>

Input this line into Red console and press Enter, then I can't quit Red console, Ctrl-c/d/z all doesn't work.

```
print ["aa"}
```

Red 0.6.3 on macOS 10.12.5.


Comments:
--------------------------------------------------------------------------------

On 2017-08-18T00:27:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2980#issuecomment-323228469>

    Just for information. Pressing Esc works.
    ```text
    >> print ["aa"}
    [    
    (escape)
    >> 
    ```

--------------------------------------------------------------------------------

On 2017-08-24T10:22:40Z, Dieken, commented:
<https://github.com/red/red/issues/2980#issuecomment-324596204>

    oh, so it's not a bug, just like I didn't know how to quit Vi editor :-D

--------------------------------------------------------------------------------

On 2017-08-24T13:07:53Z, davidxifeng, commented:
<https://github.com/red/red/issues/2980#issuecomment-324629565>

    pressing Esc works, so shall we close this?

--------------------------------------------------------------------------------

On 2017-08-24T14:50:52Z, greggirwin, commented:
<https://github.com/red/red/issues/2980#issuecomment-324658494>

    Yes, thanks all.

