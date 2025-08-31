
#3309: New Console hangs after closing Settings
================================================================================
Issue is closed, was reported by a-nick-fischer and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3309>

### Expected behavior
Console continues working after quiting the Settings menu through the X button.

### Actual behavior
Console does not respond to keys typed. Menu is working OK. The console reacts again if you go to Settings and quit the Settings menu through `OK` or `Cancel`

### Steps to reproduce the problem
Quit the Settings menu through the X.

![2018-04-02 12_19_23-new issue red_red](https://user-images.githubusercontent.com/19800702/38193083-701ef19e-3670-11e8-826d-50c8698e0027.png)

### Version (run `about` in the Red Console and paste the result here) also add OS version.
```
Red 0.6.3 for Windows built 2-Apr-2018/10:30:33 commit #ddacd32c
Windows 10 x64
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-02T19:13:09Z, gltewalt, commented:
<https://github.com/red/red/issues/3309#issuecomment-378014876>

    Confirmed. For Win7 x64 also.

--------------------------------------------------------------------------------

On 2018-04-06T11:05:46Z, dockimbel, commented:
<https://github.com/red/red/issues/3309#issuecomment-379221462>

    Confirmed too. If the focus is given to another window, then back to the console window, the key strokes are passing again.

