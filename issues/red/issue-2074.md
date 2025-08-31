
#2074: %View-hanoi.red doesn't work when compiled.
================================================================================
Issue is closed, was reported by greggirwin and has 8 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/2074>

%View-hanoi.red doesn't work when compiled. First disk goes up, then animation stops. Tried both with and without -t (Windows). 

https://gist.github.com/greggirwin/5da11ee2893f87ccdfc883f670f70368



Comments:
--------------------------------------------------------------------------------

On 2016-06-27T11:54:53Z, iArnold, commented:
<https://github.com/red/red/issues/2074#issuecomment-228725116>

    In my old gui-console this script crashes on 
        Date:   "4-Oct-2001 — 26-Jun-2016"
    red>> do %../script/view-hanoi.red
    **\* Access error: invalid UTF-8 encoding: #{97203236}
    **\* Where: do
    Perhaps it is related or it is a bug on its own.
    
    Sometimes the blocks on the left stick are cut of on the left side
    Pressing "Close" also closes console, so should do an unview, not a quit?

--------------------------------------------------------------------------------

On 2016-06-27T13:19:01Z, greggirwin, commented:
<https://github.com/red/red/issues/2074#issuecomment-228742692>

    I just checked, and it's UTF-8 here, but I pasted to the gist again, to see if that helps.
    
    Under the official 0.6.0 interpreter, the disks aren't colored, but the alignment is fine. I do want to align the buttons differently.
    
    For demos, do we want to quit or just unview? In some cases, with a manual event loop, we have to make sure we don't leave it spinning.

--------------------------------------------------------------------------------

On 2016-06-28T03:39:16Z, ghost, commented:
<https://github.com/red/red/issues/2074#issuecomment-228939989>

    Using latest Red Master Binary, I get this error while try to compile -
    
    ```
    Compiling C:\Users\ABC\Desktop\a.red ...
    *** Compilation Error: expected a block for WHILE-CONDITION instead of word! value
    *** in file: %/C/Users/ABC/Desktop/a.red
    *** near: [test [move-face face way process-events]]
    ```
    
    According to https://github.com/red/red/issues/2075, modifying line 94 to `while [do test] [move-face face way  process-events]` helped to compile it.
    
    How long is the animations supposed to be? I mean, for me, both when interpreting, as well as when compiled, the animation stops after about 3 seconds. The disk usage goes up to about 35%.

--------------------------------------------------------------------------------

On 2016-06-29T09:50:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2074#issuecomment-229310441>

    Closing this ticket as duplicate for #2075.

