
#2897: Red Console - Quit command malfunction without admin rights.
================================================================================
Issue is open, was reported by Phryxe and has 24 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2897>

Red Console with File menu and Quit doesn't work (Win 7 x64) unless I run Red Console as an administrator.

```
>> *** Access Error: cannot open: %/C/ProgramData/Red/console-cfg.red
*** Where: write
*** Stack: do-actor do-safe save
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-17T15:35:17Z, Phryxe, commented:
<https://github.com/red/red/issues/2897#issuecomment-315791104>

    Just to be clear. The user is administrator on the workstation, but Red Console wasn't opened with "Run as administrator".

--------------------------------------------------------------------------------

On 2017-07-17T15:41:31Z, geekyi, commented:
<https://github.com/red/red/issues/2897#issuecomment-315792773>

    Did this work before without admin rights?
    Do you have an empty or non-empty `console-cfg.red`? If not can you paste it?
    What about anti-virus?
    Works for me with win10 64 with red gui console 0.6.3 downloaded from http://www.red-lang.org/p/download.html

--------------------------------------------------------------------------------

On 2017-07-17T16:26:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2897#issuecomment-315805359>

    Related SO entry: https://stackoverflow.com/questions/22107812/privileges-owner-issue-when-writing-in-c-programdata

--------------------------------------------------------------------------------

On 2017-07-17T16:27:30Z, geekyi, commented:
<https://github.com/red/red/issues/2897#issuecomment-315805619>

    If you're curious, here's the code: [to get the directory](/red/red/blob/master/environment/console/gui-console.red#L87) and [save the config](https://github.com/red/red/blob/master/environment/console/gui-console.red#L155). You could compile that from source.
    
    Checking the permissions on `Red` folder (properties, or `alt+enter`), I see I myself (my user) don't have permissions.
    `Users` have read permissions
    Only the `Administrators` have full permissions.
    
    > The user is administrator on the workstation, but Red Console wasn't opened with "Run as administrator"
    
    Strangely, it works without this for me.
    Even stranger, those permissions are required to compile red console to that folder on first run, so I didn't know how that worked for you 😕
    
    Now that I know how most programs handle this case, I would suggest a workaround to saving under CURRENTUSER

--------------------------------------------------------------------------------

On 2017-07-17T17:13:25Z, Phryxe, commented:
<https://github.com/red/red/issues/2897#issuecomment-315818998>

    ```
    Red [
    	Purpose: "Red GUI Console Configuration File"
    ]
    
    win-pos: 841x525
    win-size: 640x400
    font-name: "Consolas"
    font-size: 11
    font-color: 0.0.0
    background: 252.252.252
    buffer-lines: 10000
    ```
    
    F-Secure Client Security 12.31 build 105.
    
    About the file system rights. My user (which is also admin) has full rights to C:\ProgramData\Red folder and all exe and dll files in that folder, except to console-cfg.red where the user has no specific rights.
    
    I don't know if it worked before as I don't think I tried it before. This is just a minor issue for me. I just thought you should know.

--------------------------------------------------------------------------------

On 2017-07-18T06:12:54Z, geekyi, commented:
<https://github.com/red/red/issues/2897#issuecomment-315968020>

    Minor but annoying ;) and you may not be the only one who'd encounter this in the future
    
    From the link in the above comment https://github.com/red/red/issues/2897#issuecomment-315805359,
    I'm guessing you ran the console as another user (or with admin rights) the first time. Simply deleting the config should allow the console to run and save the config. *If not, we need to investigate further*.
    
    Here's the security permissions for the *config file* for my (non-privileged) user: ![2017-07-18 10_46_42-security](https://user-images.githubusercontent.com/16749930/28302402-7c6498ae-6ba6-11e7-81b0-814d2ce47940.png)
    You should have something similar for the original user that created the file.
    
    @dockimbel shall I make a pull request to change `ALLUSERSPROFILE` env variable to `APPDATA` (AppData\Roaming)? looks like it's what others do for per user configs

--------------------------------------------------------------------------------

On 2017-07-18T06:47:50Z, Phryxe, commented:
<https://github.com/red/red/issues/2897#issuecomment-315973636>

    I deleted all files in ProgramData\Red, downloaded red-latest.exe and run it (not run as administrator). Now my user have specific rights (as you mention above) on console-cfg.red and the console quits like it should from File menu and Quit. 
    
    I have always used the same login to this computer.

--------------------------------------------------------------------------------

On 2017-07-18T06:48:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2897#issuecomment-315973826>

    @geekyi It's not that simple, IIRC, we chose `ALLUSERSPROFILE` because it was the one working across all Windows flavors while suiting our needs. So we should probably have different target folders depending on the Windows version.

--------------------------------------------------------------------------------

On 2017-07-18T07:25:48Z, Phryxe, commented:
<https://github.com/red/red/issues/2897#issuecomment-315980943>

    @geekyi is right. If the first time you run red-latest.exe with "Run as administrator" the console-cfg.red will not get the specific rights that is required for it to write the file when it closes. If you on the other hand first time run it just by double clicking it will create the proper rights on that cfg.

--------------------------------------------------------------------------------

On 2020-03-21T19:53:35Z, 9214, commented:
<https://github.com/red/red/issues/2897#issuecomment-602095154>

    Is this something that can be closed, or should it be revisited near the `0.6.5`, with a planned split of toolchain and console?

--------------------------------------------------------------------------------

On 2020-07-30T12:07:20Z, 9214, commented:
<https://github.com/red/red/issues/2897#issuecomment-666325359>

    ↑ ping.

--------------------------------------------------------------------------------

On 2020-10-05T11:43:24Z, dockimbel, commented:
<https://github.com/red/red/issues/2897#issuecomment-703578148>

    Does it work fine now using a non-admin profile?

