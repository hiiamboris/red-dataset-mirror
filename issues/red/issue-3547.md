
#3547: LAYOUT problem with bad keyword and COMPOSE 
================================================================================
Issue is closed, was reported by dsunanda and has 18 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3547>

### Expected behavior
Error message from LAYOUT - mistyped BOC for BOX

### Actual behavior
Console session often drops into endless loop - not always, but very likely if the command is repeated

### Steps to reproduce the problem
    layout compose [boc (mold system)]

Note that spelling BOX correctly does not provoke looping

### Red and platform version
Red for Windows version 0.6.3 built 8-Dec-2017/19:35:20



Comments:
--------------------------------------------------------------------------------

On 2018-09-27T21:19:31Z, 9214, commented:
<https://github.com/red/red/issues/3547#issuecomment-425246757>

    I'm sorry, but reporting bugs with a half-year old build is something counter-productive. Please update to [latest one](https://static.red-lang.org/dl/auto/win/red-latest.exe). Moreover, your issue is unrelated to `layout` or even to `compose` - dumping content of `system` object in an error message causes a significant lag on my system, probably this is the culprit.

--------------------------------------------------------------------------------

On 2018-09-27T21:48:45Z, dsunanda, commented:
<https://github.com/red/red/issues/3547#issuecomment-425254054>

    
    > I'm sorry, but reporting bugs with a half-year old build is something 
    > counter-productive. Please update to latest automatic build 
    > <https://static.red-lang.org/dl/auto/win/red-latest.exe>.
    >
    >
    Hello,
    >
    > I'm sorry, but reporting bugs with a half-year old build is something 
    > counter-productive. Please update to latest automatic build 
    > <https://static.red-lang.org/dl/auto/win/red-latest.exe>.
    >
    >
    Thanks for the almost instant reply - that is genuinely a brilliant tech 
    support.
    
    I got the latest Windows build looping in the same way.
    
    build-basename: %gui-console-2018-9-26-71095
    
    So sorry, still broken with the same line of code :-(
    
    Sunanda.

--------------------------------------------------------------------------------

On 2018-09-27T21:51:53Z, 9214, commented:
<https://github.com/red/red/issues/3547#issuecomment-425254857>

    @dsunanda which version of Windows are you using? 7 or 8? I can't reproduce this on W10.

--------------------------------------------------------------------------------

On 2018-09-28T00:11:46Z, dsunanda, commented:
<https://github.com/red/red/issues/3547#issuecomment-425280726>

    That's odd.
    
    > @dsunanda <https://github.com/dsunanda> which version of Windows are 
    > you using? 7 or 8? I can't reproduce this on W10.
    >
    >
    I'm using a fully-patched (ie up-to-date) Win10.

--------------------------------------------------------------------------------

On 2018-09-28T19:36:49Z, meijeru, commented:
<https://github.com/red/red/issues/3547#issuecomment-425543755>

    I have on W10:
    ```
    >> layout compose [boc (mold system)]
    *** Script Error: VID - invalid syntax at: [boc {make object! [^/    version: 0.6.3^/   (and so forth)
    ```

--------------------------------------------------------------------------------

On 2018-09-28T20:55:03Z, dsunanda, commented:
<https://github.com/red/red/issues/3547#issuecomment-425563298>

    <img width="599" alt="red-boc-2018-09" src="https://user-images.githubusercontent.com/16221143/46232904-b970e980-c368-11e8-9be6-3f2f75f5064e.png">
    
    The current live version usually goes unresponsive immediately.
    
    Yesterday's latest download sometimes gives the syntax error reported by Rudolf above....
    
    ....But repeat the line half a dozen times and you (or at least I) have a significant chance of triggering the behavior in the attached screenshot.
    
    This is under Win 10

--------------------------------------------------------------------------------

On 2018-09-28T22:50:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3547#issuecomment-425587668>

    @meijeru's test line of `layout compose [boc (mold system)]` is triggering something for sure. Each time you run it, it gets slower to respond. Watch memory for the process, it goes up and down a lot, which may indicate a loop and GC trying to clean things up.

--------------------------------------------------------------------------------

On 2018-10-06T15:13:12Z, endo64, commented:
<https://github.com/red/red/issues/3547#issuecomment-427581580>

    I get `*** Script Error: VID - invalid syntax at: [boc {make object! ...` on CLI console. I also get same error on GUI console but the console gets slower and slower on each try, if I press CTRL-L and clears the console window then it works normal again.

--------------------------------------------------------------------------------

On 2018-10-09T23:03:19Z, qtxie, commented:
<https://github.com/red/red/issues/3547#issuecomment-428382456>

    As @9214 said, this issue is unrelated to `layout` or `compose`.
    The `mold system` create a very long string and the gui-console cannot handle very long string efficiently. That's why the console gets slower.
    Use `CTRL-L` to clear the console window will make it fast again.

