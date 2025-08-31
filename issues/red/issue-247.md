
#247: Red compiles into compiler directory on Linux
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.impending]
<https://github.com/red/red/issues/247>

instead of the working directory.



Comments:
--------------------------------------------------------------------------------

On 2012-09-16T17:21:19Z, dockimbel, commented:
<https://github.com/red/red/issues/247#issuecomment-8596718>

    The Red compiler use the current working directory as defined by REBOL (`system/script/path`). 
    
    If we want to use the shell current directory, we would need /Library component and import some OS functions (like [getcwd](http://linux.die.net/man/3/getcwd)) to get the actual working directory. 
    
    I need to check if /Library is available everywhere before making that change.

--------------------------------------------------------------------------------

On 2012-09-16T17:31:15Z, earl, commented:
<https://github.com/red/red/issues/247#issuecomment-8596813>

    Didn't we discuss using `system/options/path` for the working directory and `system/script/path` to locate the `red/` or `red-system/`root dir?
    
    As an aside: `getcwd` should be wrapped as `what-dir` in R2. (But that of course only works if nothing changes directory during script startup or execution. R2 seems to change-dir to the script location, during startup.)

--------------------------------------------------------------------------------

On 2012-09-16T17:35:10Z, dockimbel, commented:
<https://github.com/red/red/issues/247#issuecomment-8596859>

    Earl, yes we did, but what we really want is the "real" working directory and it can't be obtained from REBOL itself, we need to ask the OS.

--------------------------------------------------------------------------------

On 2012-09-16T17:36:48Z, dockimbel, commented:
<https://github.com/red/red/issues/247#issuecomment-8596875>

    The real issue is that we are using Red and Red/System from sources instead of an encapped binary version, where REBOL `system/options/*` would be enough to get that working directory.

--------------------------------------------------------------------------------

On 2012-09-16T17:37:15Z, earl, commented:
<https://github.com/red/red/issues/247#issuecomment-8596879>

    The OS won't help us, I fear, as R2 changes directory during startup.
    
    But `system/options/path` seems to reliably be the pre-R2-startup working directory. Here's a simple test script to try for yourself:
    
    ``` rebol
    REBOL []
    print [
           "what-dir" what-dir newline
           "script/path" system/script/path newline
           "options/path" system/options/path newline
    ]
    ```
    
    Results from Linux:
    
    ```
    $ pwd
    /home/earl
    $ rebol2 -qw /tmp/pwd.r 
    what-dir /tmp/ 
    script/path /tmp/ 
    options/path /home/earl/ 
    
    $ pwd
    /tmp
    $ rebol2 -qw /tmp/pwd.r 
    what-dir /tmp/ 
    script/path /tmp/ 
    options/path /tmp/ 
    
    $ pwd
    /home/earl
    $ rebol2 -qw ../../tmp/pwd.r
    what-dir /tmp/ 
    script/path /tmp/ 
    options/path /home/earl/
    ```
    
    I've pushed a proposed fix to that effect to my repository to the `fix-cwd` branch. A few tests seem to indicate it works fine, on Linux.

--------------------------------------------------------------------------------

On 2012-09-16T20:01:22Z, dockimbel, commented:
<https://github.com/red/red/issues/247#issuecomment-8598378>

    Thank you for digging up this issue. Please apply it directly to main repo.

--------------------------------------------------------------------------------

On 2012-09-16T20:24:42Z, earl, commented:
<https://github.com/red/red/issues/247#issuecomment-8598588>

    Ok, merged the fix into mainline.

