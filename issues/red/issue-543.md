
#543: On Windows, Red added to the path, can't be run from another folder on cmd
================================================================================
Issue is closed, was reported by SoleSoul and has 10 comment(s).
[status.resolved]
<https://github.com/red/red/issues/543>

## Summary

Red can't be run from a different path on Windows.
## How to reproduce
- Put red.exe in a folder that is in the path
- On the command line, navigate to another folder (not the one where red.exe is)
- type 'red'
## Expected behavior

The Red interpreter should run.
## Observed behavior

c:>red
PROGRAM ERROR: Invalid encapsulated data.



Comments:
--------------------------------------------------------------------------------

On 2013-09-30T19:50:37Z, dockimbel, commented:
<https://github.com/red/red/issues/543#issuecomment-25398509>

    Some other crashing case (and workaround):
    
    ```
    C:\Dev\Red\build>..\red 
    PROGRAM ERROR: Invalid encapsulated data. 
    
    C:\Dev\Red\build>..\red.exe 
    
    -=== Red Console alpha version ===- 
    (only ASCII input supported) 
    
    red>>
    ```

--------------------------------------------------------------------------------

On 2013-09-30T20:41:05Z, hostilefork, commented:
<https://github.com/red/red/issues/543#issuecomment-25404212>

    This appears to be an issue with the encapper not being able to gracefully handle cases where it is not invoked via a fully specified path.
    
    It should have been able to use `system/options/boot` to do this without error, but... Rebol 2 and its encapper are not open source.  So unless it is hacked...or its requests to the filesystem hooked somehow... a simple workaround would be to invoke red through a batch file, which forces a fully specified path.
    
    To do that: rename **red.exe** to **red-exe.exe**, and in the same directory as that executable put a **red.bat** file containing the following line:
    
    ```
    "%~dp0red-exe.exe" %*
    ```
    
    Moving the exe out of the way means the batch file will be preferred.  The quotes sanitize the path, which uses the cryptic `%~dp0` to get the path (no close percent used, unlike envrionment variables).  The `%*` is a construct for taking the individual arguments, e.g. `%1 %2 ... %n`. 

--------------------------------------------------------------------------------

On 2013-09-30T22:20:56Z, dockimbel, commented:
<https://github.com/red/red/issues/543#issuecomment-25411447>

    Thanks a lot @hostilefork.

--------------------------------------------------------------------------------

On 2015-10-25T22:38:51Z, AJMansfield, commented:
<https://github.com/red/red/issues/543#issuecomment-150980813>

    I had this same issue when I was trying to get sublime text to use red as a build system on Ubuntu 15.04.
    My solution was similar; I created a shell script like this:
    
    ``` bash
    #!/bin/bash
    red $@
    ```
    
    and called that instead.

--------------------------------------------------------------------------------

On 2017-07-28T10:49:40Z, cdokolas, commented:
<https://github.com/red/red/issues/543#issuecomment-318622247>

    For the Windows batch file, I'd add a `@` in front, like this:
    ```
    @"%~dp0red-exe.exe" %*
    ```
    The way I've actually used it is by dropping the executable to my `C:\Utils\` folder (it's in the `PATH` variable) and also creating a `red.bat` file there with `@"%~dp0red-063.exe" %*` in it (I kept the original filename to keep track of the version I'm using).

