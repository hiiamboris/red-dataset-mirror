
#2968: Error code: 0xc000007b
================================================================================
Issue is closed, was reported by EleRam and has 14 comment(s).
[type.AV]
<https://github.com/red/red/issues/2968>

![image](https://user-images.githubusercontent.com/3352418/29057120-39816d50-7c1d-11e7-80b0-75c5ae4f4da2.png)

this is my first run :(


OS: Windows 10 x64 Build 16193
Anti-Virus: Windows Defender


Comments:
--------------------------------------------------------------------------------

On 2017-08-08T06:13:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2968#issuecomment-320860546>

    When submitting a ticket, you need to provide enough contextual information and steps to reproduce the issue, otherwise, there is little we can do about it.
    
    Which Windows version is it?
    Do you have any Anti-Virus running?
    Where does the `red-exe.exe` comes from, and how did you run it?
     

--------------------------------------------------------------------------------

On 2017-08-10T08:02:40Z, EleRam, commented:
<https://github.com/red/red/issues/2968#issuecomment-321480916>

    I'm sorry.
    
    Windows version: 10 x64
    Anti-Virus: Windows Defender
    
    I downloaded it from [this page](http://www.red-lang.org/p/download.html) and then I renamed it.
    
    I tried to run it normally (Double click on the exe file) and using **Run As Administrator**

--------------------------------------------------------------------------------

On 2017-08-10T12:01:57Z, qtxie, commented:
<https://github.com/red/red/issues/2968#issuecomment-321531788>

    @EleRam Mostly because the Windows Defender block or delete this file. Do you have this crush.dll file in that location?

--------------------------------------------------------------------------------

On 2017-08-12T07:47:09Z, EleRam, commented:
<https://github.com/red/red/issues/2968#issuecomment-321964470>

    @qtxie yes! 
    crush.dll exists in "C:\ProgramData\Red" dir

--------------------------------------------------------------------------------

On 2017-08-12T11:07:37Z, geekyi, commented:
<https://github.com/red/red/issues/2968#issuecomment-321974491>

    @EleRam Try checking if doing the steps in https://github.com/red/red/issues/2897#issuecomment-315973636 help.
    **Run As Administrator** may cause problems and you may have to delete the files in that folder
    
    P.S. @qtxie do we need a tag like `platform.windows`? Would help when searching for issues

--------------------------------------------------------------------------------

On 2017-08-17T07:58:15Z, EleRam, commented:
<https://github.com/red/red/issues/2968#issuecomment-322997464>

    @geekyi I removed that folder many times and nothing changed.

--------------------------------------------------------------------------------

On 2018-03-17T09:53:17Z, dockimbel, commented:
<https://github.com/red/red/issues/2968#issuecomment-373908091>

    @EleRam Did you find the cause of the issue on your machine? Could you try it again with latest automatic build version of Red?

