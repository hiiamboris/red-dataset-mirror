
#5268: Excess of authority in `browse` native
================================================================================
Issue is open, was reported by hiiamboris and has 18 comment(s).
[type.review]
<https://github.com/red/red/issues/5268>

**Describe the bug**

This is a quite surprising and exploitable behavior:
![](https://i.gyazo.com/f3550aa2842e32583240865250fbfb77.gif)

**To reproduce**
`browse as url! "cmd.exe"`

**Expected behavior**

Should open the browser at `cmd.exe` or `https://cmd.exe` site.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4623 date: 29-Dec-2022/20:00:14 commit: #6af0b708408aeab6ca70dcdf7522d03278b7586e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-01-15T17:20:28Z, meijeru, commented:
<https://github.com/red/red/issues/5268#issuecomment-1383205413>

    confirmed on W11

--------------------------------------------------------------------------------

On 2023-01-18T18:02:07Z, dockimbel, commented:
<https://github.com/red/red/issues/5268#issuecomment-1387489700>

    In Red, `browse` is more capable than just opening URL in browsers, it can also open any file using its default associated app. So passing any filename is valid. That feature is a side-effect of using [`shellexecute()`](https://learn.microsoft.com/en-us/windows/win32/api/shellapi/nf-shellapi-shellexecutea) on Windows and `system("open <arg>")` on other platforms. I am not aware of any other simple way of launching the default web browser on all supported platforms.
    
    The only possible improvement that I see is renaming that function to something else and make `browse` a wrapper mezz with some parsing rules to validate that the argument starts with a `http(s)://` pattern. That said a web browser can handle more than just the HTTP/S protocol...

--------------------------------------------------------------------------------

On 2023-01-18T18:11:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5268#issuecomment-1387501397>

    In R2 browser is opened regardless of the input somehow. Even `browse "c:/windows/system32/cmd.exe"`.
    
    I agree that cross-platform opening of a file by its association is nice, but I also see this as a security breach in `browse`. Someone creates an exe with the website's filename and hello there.

--------------------------------------------------------------------------------

On 2023-01-18T18:20:16Z, dockimbel, commented:
<https://github.com/red/red/issues/5268#issuecomment-1387511271>

    IIRC, R2 relies on the registry to determine the browser's fullpath and be able to launch it. That works only on Windows (`browse` never worked on Linux, can't remember for MacOS) and does not guarantee that the default user-chosen browser will be launched (on my W10 box, R2 launches IE11... so IE choice might be enforced by R2).
    
    I'm open to any better cross-platform solution for that, but last time we checked, the one we use is the only way to go.
    
    Capabilities of the Red runtime will be handled by a future `secure` dialect, so one could disable `browse`, `call` and any other potentially harmful feature when needed.

--------------------------------------------------------------------------------

On 2023-01-18T18:28:25Z, meijeru, commented:
<https://github.com/red/red/issues/5268#issuecomment-1387525836>

    As to naming, I favour `execute` - that is the same as my program editor (Crimson) uses for starting a file in its associated program. 

--------------------------------------------------------------------------------

On 2023-01-18T18:38:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/5268#issuecomment-1387546269>

    FYI for me R2 opens my Pale Moon. 
    
    Does R3 work for you @dockimbel? https://github.com/Oldes/Rebol3/releases/tag/3.10.0
    On W10 it opens the browser on `cmd.exe` either as a website or as a search string, on Linux it opens `/bin/bash` again in the browser as a file to be downloaded.
    As I can see from the source code, it uses registry key on Windows, `/usr/bin/open` on OSX, and `xdg-open` or `x-www-browser` on Linux.

--------------------------------------------------------------------------------

On 2023-01-19T18:34:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5268#issuecomment-1397433502>

    > Does R3 work for you @dockimbel? 
    
    It opens IE11, though I'm using the official R3 release from Rebol's repo. Oldes' version opens Edge, which is again, not my default web browser.

--------------------------------------------------------------------------------

On 2023-01-19T18:51:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5268#issuecomment-1397450938>

    Damn. No wonder MS sounds like "a mess".

--------------------------------------------------------------------------------

On 2023-01-23T19:55:56Z, greggirwin, commented:
<https://github.com/red/red/issues/5268#issuecomment-1400896378>

    R2 also had `run` and `launch`. We need a systemic design for this area, which also includes `call`. I agree that we could limit some launcher funcs for safety.

