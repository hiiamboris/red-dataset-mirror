
#2026: WISH: Stop changing system settings to affect later scripts also
================================================================================
Issue is closed, was reported by iArnold and has 4 comment(s).
[status.deferred]
<https://github.com/red/red/issues/2026>

Use case: Open a GUI-console.
Test the sparks.red script by Qtxie.
Stop that script and run the red-oclock.red script by Gregg.
The clock shows but does not run.

Workaround: either add a line
show clock 
at the end of the on-time event block
or reset the value of system/view/auto-sync? at the beginning of the script because the sparks.red script contains a line
system/view/auto-sync?: no

Wish for a proper solution:
Set these system settings using a special function.
This function
a) saves the current state
b) sets the desired value
c) sets a trigger

The trigger triggers the system setting to be returned to the saved value when the script finishes.



Comments:
--------------------------------------------------------------------------------

On 2016-06-15T08:16:18Z, SteeveGit, commented:
<https://github.com/red/red/issues/2026#issuecomment-226119155>

    Maybe a new flag 'no-sync in face/options checked by a new event-handler would do the trick.

--------------------------------------------------------------------------------

On 2016-06-15T08:37:24Z, dockimbel, commented:
<https://github.com/red/red/issues/2026#issuecomment-226123744>

    The plan is to move the auto-syncing flag into each face (in the 0.6.2 release probably).
    
    Closing this ticket as we already have a (different) plan for that.

