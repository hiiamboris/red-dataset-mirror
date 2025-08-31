
#2: Error report when a View app is quitting on a user error
================================================================================
Issue is open, was reported by PeterWAWood and has 2 comment(s).
[Wish]
<https://github.com/red/REP/issues/2>

When a compiled View app encounters a non-crashing error, it currently just quits.

Desired behavior:
1. In debug mode, the app should error out in the GUI console, letting the user handle it from there.
2. In release mode, a simple window should display the error message with a [Quit] button. On closing the window or clicking the button, the app should simply quit.



Comments:
--------------------------------------------------------------------------------

On 2018-04-23T01:55:11Z, PeterWAWood, commented:
<https://github.com/red/REP/issues/2#issuecomment-383433029>

    This was previously red issue [1967](https://github.com/red/red/issues/1967) opened by @dockimbel.

