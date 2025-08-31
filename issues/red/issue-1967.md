
#1967: Error report when a View app is quitting on a user error
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/1967>

When a compiled View app encounters a non-crashing error, it currently just quits.

Desired behavior:
1. In debug mode, the app should error out in the GUI console, letting the user handle it from there.
2. In release mode, a simple window should display the error message with a [Quit] button. On closing the window or clicking the button, the app should simply quit.



Comments:
--------------------------------------------------------------------------------

On 2016-06-04T12:29:17Z, iArnold, commented:
<https://github.com/red/red/issues/1967#issuecomment-223753084>

    Personally, 1967 is much better than 1966.
    1. Users are never in debug mode, so in that case it will be the programmer. 
    2. For something that can be as harmless as a missing image, closing the entire app is maybe too much of a good thing. I would really prefer supplying a minimal red cross image in these cases and let the program continue, let the user decide if he/she want the missing image fixed.

--------------------------------------------------------------------------------

On 2018-04-23T01:52:03Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1967#issuecomment-383432668>

    Moved to Red/REP repo

