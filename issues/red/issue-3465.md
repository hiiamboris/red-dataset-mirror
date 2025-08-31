
#3465: transparent `base` won't render text with `to-image`
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
<https://github.com/red/red/issues/3465>

### Steps to reproduce the problem
In the GUI console:
`view/no-wait [x: panel [base 100x100 yello green "text" base 100x100 glass green "text"]]  ? (to-image x)`
### Actual behavior
On the top is the original window, on the bottom is the one made by `?`
![](https://i.gyazo.com/ce840417e23096603c6bdf007b21ca3f.png)
Notice the right base text disappeared, and also the scaling issue (again) mentioned in https://github.com/red/red/issues/3336#issuecomment-399263899
### Expected behavior
Both windows should look identical
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 779 date: 5-Jul-2018/15:38:08 commit: #963ec55a6bab860f8b259246f794bde6ea0172be ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-13T00:38:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3465#issuecomment-404691408>

    ![image](https://user-images.githubusercontent.com/460079/42666475-97d7a3a2-8602-11e8-8a7a-d9e28a1a9f06.png)
    ```
    -----------RED & PLATFORM VERSION-----------
    RED: [ branch: "master" tag: #v0.6.0 ahead: 3524 date: 28-Jun-2018/8:12:27 commit: #330af8539bd0aec5b326876fa42a951bfb44b5f5 ]
    PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
    --------------------------------------------
    ```

--------------------------------------------------------------------------------

On 2018-07-13T19:17:17Z, endo64, commented:
<https://github.com/red/red/issues/3465#issuecomment-404928154>

    I get exact same output as @greggirwin 

--------------------------------------------------------------------------------

On 2018-12-17T17:34:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/3465#issuecomment-447930403>

    The core of this issue is that MS docs on `PrintWindow` are an outright lie. See https://stackoverflow.com/a/44062144 for more info. I'm going to just send the `WM_PRINT` message directly to the window to fix it.

--------------------------------------------------------------------------------

On 2018-12-30T16:17:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/3465#issuecomment-450570889>

    I fixed this in https://github.com/red/red/pull/3683 and it's okay to close this one. Tested on W7 and Mac.

