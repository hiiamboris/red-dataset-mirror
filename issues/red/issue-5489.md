
#5489: Native builds do not run under Windows XP even with WindowsXP target: calls D3D11 which is not supported on XP
================================================================================
Issue is open, was reported by wesinator and has 14 comment(s).
<https://github.com/red/red/issues/5489>

**Describe the bug**
Programs compiled natively with the toolchain for a WindowsXP target will not run on Windows XP.
The GUI view currently depends on a Windows DirectX11 API that is only available for Windows Vista/7 and up: see https://learn.microsoft.com/en-us/windows/win32/api/d3d11/nf-d3d11-d3d11createdevice

https://github.com/red/red/blob/dd5f213623ba8b060f7d0bf4ece406ea25e9fb56/modules/view/backends/windows/win32.reds#L2855
https://github.com/red/red/blob/dd5f213623ba8b060f7d0bf4ece406ea25e9fb56/modules/view/backends/windows/direct2d.reds#L1734

has the WindowsXP target build actually been tested on a Windows XP computer or VM?

followup to #5487

**To reproduce**
1. latest toolchain with dd5f213 , https://raw.githubusercontent.com/red/code/master/Showcase/calculator.red
2. `redc -r -t WindowsXP calculator.red`
3. XP host, run calculator.exe
4. See error
![redc_calc_view_windowsxp_target_d3d11 dll_not_found](https://github.com/red/red/assets/5124946/fa182c4a-7753-41ab-9713-05ea7d4f558e)

**Edit:** the same issue happens whether in WindowsXP target mode or MSDOS (console app) target mode
![image](https://github.com/red/red/assets/5124946/e5cdbb67-e9dd-41cf-9842-113d9e6fe9d5)

**Expected behavior**
A WindowsXP target build should run out of the box on Windows XP SP3 / NT 5.1, or this target should be dropped entirely if it isn't going to be supported.

There isn't a way to install DirectX 11 / D3D11 on Windows XP, so this won't ever work as it is currently.

**Platform version**
`red-toolchain-24feb24-dd5f21362`

[NO_TRAIN]::


Comments:
--------------------------------------------------------------------------------

On 2024-02-25T18:02:11Z, greggirwin, commented:
<https://github.com/red/red/issues/5489#issuecomment-1963014941>

    > this target should be dropped entirely if it isn't going to be supported.
    
    I think this is the best option. Much as we want to support older OSs, they need a champion who uses them and can help contribute. We have to look forward, which is already hard enough. 

--------------------------------------------------------------------------------

On 2024-02-26T00:01:54Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5489#issuecomment-1963109912>

    > > this target should be dropped entirely if it isn't going to be supported.
    > 
    > I think this is the best option. Much as we want to support older OSs, they need a champion who uses them and can help contribute. We have to look forward, which is already hard enough.
    
    If it is too much effort, drop it. If it is a small one, keep it as there are plenty of old industrial PC/Tablets/Notebooks wich still use XP.
    
    But as by now, I would drop it. Lets concentrate the scarse resources to what matters.
    
    

--------------------------------------------------------------------------------

On 2024-02-26T03:00:37Z, qtxie, commented:
<https://github.com/red/red/issues/5489#issuecomment-1963234761>

    I cannot make XP runs on virtualbox 7. It should work on virtualbox 6, but I hesitate to downgrade it as it may brokes my existing VMs.

--------------------------------------------------------------------------------

On 2024-02-26T03:12:30Z, wesinator, commented:
<https://github.com/red/red/issues/5489#issuecomment-1963243357>

    Note that the D3D API does work on Vista/Server 2008 with KB971644 installed, but the `GetGestureInfo` API that is automatically imported (whether used or not) by binaries compiled with the `Windows` target, is only available in Windows 7/Server 2008 R2+.
    
    So in a sense, the current `WindowsXP` target flag is really the Windows Vista/Server 2008 target 😆
    
    Honestly I don't think it makes a lot of sense that GUI view compiled programs import (i.e require) the `GetGestureInfo` API every time, so it may be good to change that in addition to removing the XP target. Many desktop programs targeting Windows 10+ never use that API (such as https://github.com/microsoft/winfile)
    
    That would mean: 
     - removing the `WindowsXP` target flag/switch.
     - The current `Windows` target would adopt the "XP" target backend, and the touch related `GetGestureInfo` would only be imported if needed by an imported library, or invoked explicitly.
    
     This would be the most sensible change IMO: a baseline of working on NT6.0+ and also not automatically importing unused APIs.
    
    [NO_TRAIN]::

--------------------------------------------------------------------------------

On 2024-02-26T08:50:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5489#issuecomment-1963600108>

    View module does not support any of the touch functions on Windows anyway, so I've no idea why it imports that :D

--------------------------------------------------------------------------------

On 2024-10-20T03:34:49Z, wesinator, commented:
<https://github.com/red/red/issues/5489#issuecomment-2424512553>

    may be fixed by adding a condition around https://github.com/red/red/blob/66af58e59b5baffcc6c3143253ecc2d564e00297/modules/view/backends/windows/direct2d.reds#L1730 for nt6+ only?
    
    [NO_TRAIN]::
    

--------------------------------------------------------------------------------

On 2024-10-23T01:21:59Z, qtxie, commented:
<https://github.com/red/red/issues/5489#issuecomment-2430606766>

    There are several places need to be modified to support XP.

