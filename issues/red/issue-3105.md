
#3105: Window is not centered when setting size to the screens size
================================================================================
Issue is open, was reported by a-nick-fischer and has 12 comment(s).
[GUI]
<https://github.com/red/red/issues/3105>

### Expected behavior
![expected](https://user-images.githubusercontent.com/19800702/32692100-6d42f51a-c712-11e7-9549-f970220fcb44.png)

### Actual behavior
![actual](https://user-images.githubusercontent.com/19800702/32692109-84771130-c712-11e7-9cf1-97cbb9e42425.png)
A gap left of the window.

### Steps to reproduce the problem
`view [ size system/view/screens/1/size ]`

but this works:
`view/options [ size system/view/screens/1/size ][offset: -10x0]`

### Red version and build date, operating system with version.
`Red for Windows version 0.6.3 built 12-Aug-2017/21:38:44+02:00`
Windows 10
`system/view/screens/1/size: 1366x768` (This is right)


Comments:
--------------------------------------------------------------------------------

On 2017-11-13T21:24:27Z, endo64, commented:
<https://github.com/red/red/issues/3105#issuecomment-344063134>

    It works as expected on Win10 x64.
    ```
    >> system/view/screens/1/size
    == 1536x864
    ```

--------------------------------------------------------------------------------

On 2017-11-13T21:53:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3105#issuecomment-344071226>

    On Win7 x64, multi monitor setup, I get a slight overhang on the *right* side, onto the second monitor. Looks about the same as the space in the screenshot above.

--------------------------------------------------------------------------------

On 2019-10-07T18:56:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/3105#issuecomment-539155325>

    This still actual? Can't reproduce on W7. No gap on the left. Just the window does not fit, and it's border hangs over, which is expected I guess.

--------------------------------------------------------------------------------

On 2019-10-07T19:14:05Z, greggirwin, commented:
<https://github.com/red/red/issues/3105#issuecomment-539161847>

    Just re-tested. Same behavior for me, but now I notice a tiny gap on the left. If I snap align it, the right side still hangs over a bit. May have to do with OS padding on borders for resizing purposes.

--------------------------------------------------------------------------------

On 2019-10-07T19:14:55Z, greggirwin, commented:
<https://github.com/red/red/issues/3105#issuecomment-539162172>

    Hmm, using `resize` flag makes it even bigger.

--------------------------------------------------------------------------------

On 2019-10-07T20:46:48Z, endo64, commented:
<https://github.com/red/red/issues/3105#issuecomment-539197126>

    I also see a tiny gap on the left on Win10.

