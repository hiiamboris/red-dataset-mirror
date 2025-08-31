
#5073: GUI console doesn't start
================================================================================
Issue is closed, was reported by ushakov-s and has 62 comment(s).
[status.resolved]
<https://github.com/red/red/issues/5073>

It doesn't show any error messages. Just doesn't run.
I used precompiled binary for Windows. Any "latest" version for years. https://static.red-lang.org/dl/auto/win/red-latest.exe
Stable release works fine.
Windows 7 32bit Home.



Comments:
--------------------------------------------------------------------------------

On 2022-02-17T11:40:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5073#issuecomment-1042861148>

    It works fine with the latest version.

--------------------------------------------------------------------------------

On 2022-02-17T16:56:55Z, ushakov-s, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043185943>

    No, it doesn't.
    red-17feb22-c97690694.exe
    gui-console-2022-2-17-41962.exe
    
    Possibly, I have some kind of special environment. What can I inspect?

--------------------------------------------------------------------------------

On 2022-02-17T17:01:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043190606>

    I have tested on W10, we don't officially support Win7 anymore since a while. Though, if it's a Win7-specific issue, I guess it should not be a serious one.

--------------------------------------------------------------------------------

On 2022-02-17T17:03:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043192845>

    Try `flip-exe-flag %gui-console-2022-2-17-41962.exe` from a working Red console, then run this buggy console. Does it print anything?

--------------------------------------------------------------------------------

On 2022-02-17T17:10:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043199709>

    Or better, can you build the console from sources?
    Instructions are [here](https://github.com/red/red/#running-red-from-the-sources-for-contributors), but command will be `do/args %red.r "-r -t -d Windows %environment/console/GUI/gui-console.red"` (notice -d)

--------------------------------------------------------------------------------

On 2022-02-17T17:10:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043200344>

    Correction: `do/args %red.r "-r -d -t Windows %environment/console/GUI/gui-console.red"`

--------------------------------------------------------------------------------

On 2022-02-17T18:07:15Z, ushakov-s, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043255431>

    Rebol output:
     do/args %red.r "-r -d -t Windows %environment/console/GUI/gui-console.red"
    
    -=== Red Compiler 0.6.4 ===-
    
    Compiling C:\Users\1\Sets\Äèñòðèáóòèâû\dev\Red\red-master\environment\console\GUI\gui-console.red ...
    Compiling compression library...
    ...compilation time : 6357 ms
    
    Target: Windows
    
    Compiling to native code...
    ...compilation time : 229777 ms
    ...global words     : 25832 (78.53%)
    ...linking time     : 32748 ms
    ...output file size : 5126144 bytes
    ...output file      : C:\Users\1\Sets\Äèñòðèáóòèâû\dev\Red\red-master\gui-console.exe
    
    == none
    
    And created gui-console.exe can't launch.

--------------------------------------------------------------------------------

On 2022-02-17T18:25:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043272609>

    What's GUI console output when it is run from the terminal?

--------------------------------------------------------------------------------

On 2022-02-17T18:41:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043290379>

    @ushakov-s also what is the *last working* version for you?

--------------------------------------------------------------------------------

On 2022-02-17T23:01:25Z, endo64, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043585960>

    No issue on Win11 x64
    `Red 0.6.4 for Windows built 17-Feb-2022/14:39:17+03:00  commit #c976906`

--------------------------------------------------------------------------------

On 2022-02-18T03:30:34Z, ushakov-s, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043823989>

    GUI console output is empty. It just try to run and then exit immediately. No any messages appears.
    
    I didn't update Red every night, so I can't to say which working version is really last, but red-04nov20-277584b4c.exe is working fine and all versions since 2021 doesn't.

--------------------------------------------------------------------------------

On 2022-02-18T06:11:09Z, ne1uno, commented:
<https://github.com/red/red/issues/5073#issuecomment-1043972423>

    Platform Update for Windows 7, SP1 may help?
     the gui windows back-end changed to Direct2D sometime around then.
    https://www.microsoft.com/en-us/download/details.aspx?id=36805

--------------------------------------------------------------------------------

On 2022-02-18T09:07:34Z, qtxie, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044185222>

    @ushakov-s Please try the Platform Update for Windows 7. If it's still not working, you can use the GDI+ backend by adding `draw-engine: 'GDI+` in the header of the `%environment/console/GUI/gui-console.red`.
    ```
    Red [
        ...
        Needs:	 [View JSON CSV]
        Config:	 [gui-console?: yes red-help?: yes draw-engine: 'GDI+]
        ...
    ```

--------------------------------------------------------------------------------

On 2022-02-18T17:11:29Z, ushakov-s, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044859834>

    Updating to Win7 SP1 has no effect.
    So, changing GUI backend to GDI+ is the same. Behavior remains unchanged.

--------------------------------------------------------------------------------

On 2022-02-18T17:15:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044865447>

    But recent `--cli` console works for you, and you can use `view`?

--------------------------------------------------------------------------------

On 2022-02-18T17:16:27Z, dockimbel, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044866199>

    At this point, it's most likely not an issue with Red, but your local environment. If you have any third-party anti-virus, disable it. Also disable the Windows Defender AV entirely to see if that's the one blocking this.

--------------------------------------------------------------------------------

On 2022-02-18T17:27:46Z, ushakov-s, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044880020>

    cli console works, but view inaccessible:
    *** Script Error: view has no value
    *** Where: catch
    *** Near : Red [title: "Hello" needs: 'view] view []
    *** Stack:

--------------------------------------------------------------------------------

On 2022-02-18T17:35:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044890069>

    Try automatically built CLI console, or add `Needs: View` into the header of `console/CLI/console.red` before building it.

--------------------------------------------------------------------------------

On 2022-02-18T18:05:01Z, ushakov-s, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044938946>

    Well, now CLI reports:
    *** Runtime Error 1: access violation
    *** at: 004F17B5h
    I will try to catch it by sysinternals tools.

--------------------------------------------------------------------------------

On 2022-02-18T18:17:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044956872>

    no, better build it with `-d` flag and paste the printed trace here

--------------------------------------------------------------------------------

On 2022-02-18T18:18:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044958662>

    I would expect GUI console built with `-d` also to crash with a message though... strange if it's silent

--------------------------------------------------------------------------------

On 2022-02-18T18:19:56Z, dockimbel, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044960856>

    > I would expect GUI console built with -d also to crash with a message though... strange if it's silent
    
    It also needs to target the shell instead of the GUI otherwise no output will be visible, so `-t Windows` needs to be removed when `-d` is used.

--------------------------------------------------------------------------------

On 2022-02-18T18:23:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044965308>

    No, it always worked for me with `-t` Windows. `-d` handles that.

--------------------------------------------------------------------------------

On 2022-02-18T18:25:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044968139>

    Ah sorry, it worked without `-t` for me. It probably defaults to `MSDOS` then.

--------------------------------------------------------------------------------

On 2022-02-18T18:28:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5073#issuecomment-1044972253>

    @ushakov-s the following commands both should output the stack trace then:
    `do/args %red.r "-r -d -t MSDOS %environment/console/GUI/gui-console.red"
    `do/args %red.r "-r -d -t MSDOS %environment/console/CLI/console.red"`

--------------------------------------------------------------------------------

On 2022-02-19T02:07:10Z, ne1uno, commented:
<https://github.com/red/red/issues/5073#issuecomment-1045557013>

    @ushakov-s, can you open the event viewer and see any error message?
    if you run dxdiag and  save info, at the end of the report it might list recent crashes.
    might be possible graphic drivers need update? openGL less than version 2?
    
    Press Windows+R to open the Run dialog, enter eventvwr (or eventvwr.msc) or DxDiag

--------------------------------------------------------------------------------

On 2022-02-19T02:23:41Z, qtxie, commented:
<https://github.com/red/red/issues/5073#issuecomment-1045578078>

    Yes, might be possible graphic drivers issue or no supported graphic card on the board. I pushed a commit to use software rendering automatically if no available hardware. I have tested it on a Win7 32bit VM.

--------------------------------------------------------------------------------

On 2022-02-19T03:45:06Z, ushakov-s, commented:
<https://github.com/red/red/issues/5073#issuecomment-1045678529>

    Yes, it reports DirectX error:
    *** Runtime Error 98: assertion failed
    *** in file: /C/Users/1/Sets/Äèñòðèáóòèâû/dev/Red/red-master/modules/view/backends/windows/direct2d.reds
    *** at line: 1579
    ***
    ***   stack: gui/DX-init
    ***   stack: gui/init
    ***   stack: ctx||454~init 001EA7BCh
    
    Why is dx? I select to use GDI+ : @ Config: [gui-console?: yes red-help?: yes draw-engine: 'GDI+]
    
    DxDiag reports no any errors, Event Viewer is the same.
    OpenGL version 2.1
    DirectX version 10

--------------------------------------------------------------------------------

On 2022-02-19T04:32:43Z, qtxie, commented:
<https://github.com/red/red/issues/5073#issuecomment-1045736555>

    It's still DX10 on your system. The latest Red uses DX11. This is the dxdiag on my Win7.
    ![image](https://user-images.githubusercontent.com/1673525/154786112-7b369b2a-1533-4daa-8cad-3b1a011da9b1.png)
    
    > Why is dx? I select to use GDI+
    
    The `gui-console` always use DX (DirectWrite), on `red-04nov20-277584b4c.exe` it uses DX10 which works on your system.
    
    So the issue is Red needs DX11 while it's not supported on @ushakov-s's system. It should be possible to add a fallback to support DX10 for Win7. Contribution is very welcome.

--------------------------------------------------------------------------------

On 2022-02-19T16:36:25Z, ushakov-s, commented:
<https://github.com/red/red/issues/5073#issuecomment-1046056154>

    Hmmm. Red was being support DX10 very recently. At least release 0.64 or red-04nov20-277584b4c.exe works fine with it.
    Is it difficult to merge that support back to the master branch?

--------------------------------------------------------------------------------

On 2022-03-01T04:24:13Z, gltewalt, commented:
<https://github.com/red/red/issues/5073#issuecomment-1055000921>

    Check quarantined Anti-virus files

