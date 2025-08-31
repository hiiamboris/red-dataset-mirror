
#3364: Latest GUI Console fails to start
================================================================================
Issue is closed, was reported by a-nick-fischer and has 22 comment(s).
<https://github.com/red/red/issues/3364>

### Expected behavior
GUI Console compiles and starts normaly.
### Actual behavior
Displays the following:
![2018-05-05 13_05_47-c__users_user_desktop_red-gui exe](https://user-images.githubusercontent.com/19800702/39662649-7cc10ba8-5065-11e8-8a64-5815ae779132.png)

Tried starting with the VS 2017 debugger (I have literary no experience with it through) and it gave me the following message (freely translated from german):
```
Exception at 0x657AFF75 (CoreUIComponents.dll) in red-gui.exe: 0xC0000602:  A fail fast exception occurred. Exception handlers will not be invoked and the process will be terminated immediately 
```
Original:
![2018-05-05 13_12_05-red-gui debugging - microsoft visual studio](https://user-images.githubusercontent.com/19800702/39662683-f4b54f2a-5065-11e8-9cfb-f78929c723b4.png)

### Steps to reproduce the problem
Download latest Windows build from https://www.red-lang.org/p/download.html. `red-04may18-1c0952c0.exe` at time of writing.

### Red and platform version
```
Lenovo E31-70
Windows 10 x64
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-05T11:30:36Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/3364#issuecomment-386798944>

    After renaming it from `red-gui.exe` to `red-latest.exe` it actually works. If I rename it back it doesn't.

--------------------------------------------------------------------------------

On 2018-05-05T11:37:32Z, Tallefer, commented:
<https://github.com/red/red/issues/3364#issuecomment-386799343>

    Some older version did leave some files (after crashing) in the temp/profile dir, and they somehow messed with running Red again, please check there. Just a wild guess.

--------------------------------------------------------------------------------

On 2018-05-06T12:48:52Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/3364#issuecomment-386877164>

    I tried deleting the `C:\ProgramData\Red` and `%AppData%\Red` folders but it didn't solve the problem. When I try to start the Red executable it now reports a `Rebol/Pro SDK` Error or just crashes without a message. It actually fails to compile the GUI Console, the `C:\ProgramData\Red` directory contains the source of it (several `.red` files, `crush-xxxxx.dll` and a `GUI` directory). Does Red store files anywhere else?

--------------------------------------------------------------------------------

On 2018-05-06T12:55:21Z, Tallefer, commented:
<https://github.com/red/red/issues/3364#issuecomment-386877532>

    Yep, those are the ones, I don't think there are others. Oh well.

--------------------------------------------------------------------------------

On 2018-05-06T16:58:26Z, 9214, commented:
<https://github.com/red/red/issues/3364#issuecomment-386893405>

    Do you have AV turned on by any chance?

--------------------------------------------------------------------------------

On 2018-05-07T13:15:42Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/3364#issuecomment-387060938>

    Nope, I always turn off Avira when working with Red.

--------------------------------------------------------------------------------

On 2018-05-13T20:56:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3364#issuecomment-388655415>

    @nickkoro02 does this still happen for the latest automated build? What about the stable build?

--------------------------------------------------------------------------------

On 2018-05-15T18:24:43Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/3364#issuecomment-389266074>

    Problem still persist in latest build (`red-13may18-154db91a.exe`). In stable build too.
    
    I don't think this is a relevant issue as I probably just messed something up with my Red installation. As nobody can reproduce this issue, we should probably close it.

--------------------------------------------------------------------------------

On 2018-05-15T21:16:00Z, Tallefer, commented:
<https://github.com/red/red/issues/3364#issuecomment-389316135>

    Another wild guess. @nickkoro02 did you try to clean "Downloaded from Internet" flag from executable/zip? Also maybe that particular folder's policy is different somehow? Did you try to run it from another folder/disk?

--------------------------------------------------------------------------------

On 2018-08-02T22:05:42Z, endo64, commented:
<https://github.com/red/red/issues/3364#issuecomment-410082760>

    Any update @nickkoro02 ? If not are we good to close this @greggirwin ?

--------------------------------------------------------------------------------

On 2018-08-03T05:14:20Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/3364#issuecomment-410146687>

    Oh, I've completly forgoten this issue. I reinstalled my Windows last week and cannot reproduce the issue now. 
    
    Feel free to close it and thank you for the reminder.

