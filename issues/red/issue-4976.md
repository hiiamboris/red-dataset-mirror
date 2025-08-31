
#4976: I installed Red (2021-sept-30) and it cannot run from console on Win10 x64
================================================================================
Issue is closed, was reported by Alexey-T and has 6 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/4976>

Installed to c:\Red\red.exe, it created the console exe.

If I run c:\red\red.exe - it runs ok.
If I add c:\Red to system PATH and run "red" from terminal - it gives error
```
C:\Users\user>red
PROGRAM ERROR: Invalid encapsulated data.
```


Comments:
--------------------------------------------------------------------------------

On 2021-10-01T10:06:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4976#issuecomment-932095964>

    dupe of https://github.com/red/red/issues/543

--------------------------------------------------------------------------------

On 2021-10-01T10:07:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4976#issuecomment-932097079>

    use a batch file solution `red.bat`: `"%~dp0red-exe.exe" %*`
    there's nothing we can do about closed-source Rebol launcher for now

--------------------------------------------------------------------------------

On 2021-10-01T10:16:43Z, qtxie, commented:
<https://github.com/red/red/issues/4976#issuecomment-932103417>

    You need the CLI version of the console when communicating with editor.
    
    > red --cli

