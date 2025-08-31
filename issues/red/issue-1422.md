
#1422: Dragging window to top of screen usually crashes in Windows 7
================================================================================
Issue is closed, was reported by WiseGenius and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1422>

In Windows 7, dragging a window to the top of the screen maximizes it. Doing this to the view-test window usually causes it to crash with:

```
*** Runtime Error 7: float divide by zero
*** at: 744D2F10h
```
- It often crashes instantly upon first reaching the top, but not always.
- It will always crash instantly if the dragging continues back down into a “Restore Down” size.
- If not dragged back down, it doesn't always crash, but it eventually will if the dragging continues, especially sideways.



Comments:
--------------------------------------------------------------------------------

On 2015-11-08T06:31:49Z, dockimbel, commented:
<https://github.com/red/red/issues/1422#issuecomment-154778176>

    Can't reproduce the crash on Win7 here, doing any of the combinations you mentioned. Will try with other Windows instances.

--------------------------------------------------------------------------------

On 2015-11-17T13:33:39Z, WiseGenius, commented:
<https://github.com/red/red/issues/1422#issuecomment-157371637>

    Currently, if the code is compiled, the error is:
    
    ```
    *** Runtime Error 7: float divide by zero
    *** Cannot determine source file/line info.
    ```
    
    If it's interpreted, the error is:
    
    ```
    *** Runtime Error 7: float divide by zero
    *** at: 742C2F10h
    ```
    
    This error still occurs when dragging the window to the top of the screen, but also occurs when dragging the window to the side of the screen (it probably always did this too).
    Lately, it began to give the same error whenever the window was moved around just in the middle of the screen. However, one of the recent commits (probably [the latest one](https://github.com/red/red/commit/bf9e18e4831ff8cdafa1cd3a79913f248f72dbdf)) made that much less common (and so far, only when interpreted).
    The same error is given in each case, for any `view` or `vid` window in Windows 7.
    
    Windows XP doesn't seem to have this issue at all.

--------------------------------------------------------------------------------

On 2016-01-15T11:42:51Z, dockimbel, commented:
<https://github.com/red/red/issues/1422#issuecomment-171940945>

    Can you still reproduce this issue with latest version?

--------------------------------------------------------------------------------

On 2016-01-15T12:36:38Z, WiseGenius, commented:
<https://github.com/red/red/issues/1422#issuecomment-171949933>

    Yes. Not in the exact same way as the initial report, but more like the last update where it doesn't matter so much _where_ the window is dragged anymore. I just drag the window in little circles now. Sometimes it crashes quickly, and sometimes it takes a fair bit of dragging. It doesn't seem to follow a pattern anymore.
    So just now, I compiled the latest console in Windows 7, opened it in a CMD, did `do %tests/view-test.red`, and then dragged the resulting window around randomly until it disappeared because because the console crashed with this message:
    
    ```
    *** Runtime Error 7: float divide by zero
    *** at: 747E2F10h
    ```
    
    Often, while dragging the window around, all the windows behind it (including the console) disappear because they have been silently minimized. And sometimes, while still dragging, the other windows reappear in the background. Eventually it crashes, though if dragged around long enough.

--------------------------------------------------------------------------------

On 2016-03-12T07:54:23Z, dockimbel, commented:
<https://github.com/red/red/issues/1422#issuecomment-195689832>

    @WiseGenius Can you still reproduce that crash?

--------------------------------------------------------------------------------

On 2016-03-14T09:18:18Z, WiseGenius, commented:
<https://github.com/red/red/issues/1422#issuecomment-196215828>

    Following the instructions in my previous comment using the CLI console, I couldn't get it to crash (maybe I wasn't dragging long enough?) but the windows behind it did keep disappearing and/or reappearing.
    
    However, it crashes quite quickly when doing the same using the GUI console:
    
    ![comment0004](https://cloud.githubusercontent.com/assets/7657453/13739875/630b7f72-ea19-11e5-8ad8-83ac0133107d.png)
    
    ```
    Problem signature:
      Problem Event Name:   APPCRASH
      Application Name: gui-console.exe
      Application Version:  0.9.0.0
      Application Timestamp:    56e70348
      Fault Module Name:    gui-console.exe
      Fault Module Version: 0.9.0.0
      Fault Module Timestamp:   56e70348
      Exception Code:   c0000094
      Exception Offset: 0007ce4c
      OS Version:   6.1.7601.2.1.0.256.48
      Locale ID:    3081
      Additional Information 1: 36f8
      Additional Information 2: 36f85da816156907981ffbf1034f4c02
      Additional Information 3: e598
      Additional Information 4: e598f317bf757fe8fa0db7192856cecb
    
    Read our privacy statement online:
      http://go.microsoft.com/fwlink/?linkid=104288&clcid=0x0409
    
    If the online privacy statement is not available, please read our privacy statement offline:
      C:\Windows\system32\en-US\erofflps.txt
    ```

--------------------------------------------------------------------------------

On 2016-03-14T09:25:08Z, qtxie, commented:
<https://github.com/red/red/issues/1422#issuecomment-196220806>

    I can reproduce it.

--------------------------------------------------------------------------------

On 2016-03-14T12:12:44Z, WiseGenius, commented:
<https://github.com/red/red/issues/1422#issuecomment-196284691>

    That latest crash for the GUI console seems to be fixed. If it's still considered a problem, though, all other windows still disappear and reappear when dragging a window around in Windows 7, whether the code is compiled or `do`ne from either console.

