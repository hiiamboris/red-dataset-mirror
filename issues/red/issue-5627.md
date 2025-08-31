
#5627: `about/debug` doesn't work in custom builds if you have no `git/` in path
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
<https://github.com/red/red/issues/5627>

**Describe the bug**

I don't suppose it's by design:
```
$ red+view-debug-master-2025-05-30-979d8e1.exe
--== Red 0.6.6 ==--
Type HELP for starting information.

>> about
Red 0.6.6 for Windows built 31-May-2025/11:23:26
>> about/debug
Looks like this Red binary has been built from source.
Please download latest build from our website:
https://www.red-lang.org/p/download.html
and try your code on it before submitting an issue.
```

**To reproduce**

1. make `git` accessible from the path but not in `git/` subdir
2. build any of Red consoles
3. `about/debug` won't work

**Expected behavior**

More reliable `git` detection

**Platform version**

`Red 0.6.6 for Windows built 23-Jun-2025/8:32:23`


Comments:
--------------------------------------------------------------------------------

On 2025-06-27T13:10:35Z, greggirwin, commented:
<https://github.com/red/red/issues/5627#issuecomment-3013034080>

    ```
    >> about
    Red 0.6.6 for Windows built 18-Jun-2025/3:52:24-06:00  commit #3d9dd1f
    >> about/debug
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.0 ahead: 9573 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
    PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
    --------------------------------------------
    ```
    Debug mode builds only, perhaps?

--------------------------------------------------------------------------------

On 2025-06-27T13:49:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/5627#issuecomment-3013155260>

    I'll investigate further. Could be git version even.

--------------------------------------------------------------------------------

On 2025-06-27T14:27:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5627#issuecomment-3013271358>

    I stand corrected, it's not a regression in Red, but a bug. The older exe was built on another laptop, so it had the git info included. On the current laptop all builds have no git info.
    
    I observe the following:
    ```
    R2>> do %build/git-version.r
    Script: "Get git version data" (none)
    == none
    ```
    ```
    Red>> find get-env 'PATH "git"
    == none
    ```
    I installed git using scoop, so there's no specific `git/` path:
    ```
    shell> where git
    d:\gear\git.bat
    C:\Users\1\scoop\shims\git.exe
    ```
    Which must be the reason

--------------------------------------------------------------------------------

On 2025-06-27T14:30:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5627#issuecomment-3013281888>

    I've edited the issue

--------------------------------------------------------------------------------

On 2025-06-27T19:29:56Z, greggirwin, commented:
<https://github.com/red/red/issues/5627#issuecomment-3014168056>

    Thanks for the deeper research @hiiamboris !

