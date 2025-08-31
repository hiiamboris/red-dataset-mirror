
#1449: clicking on a base face doesn't activate the window
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1449>

Clicking on a base face in an inactive window makes the current window inactive, but it doesn't bring the clicked window to the front. Clicking on any other area in the window does.
This is the case in both `view-test` and `vid` on both Windows XP and Windows 7.
`view-test` even continues to print the `down`, `up` and `double-click` events to the output console.



Comments:
--------------------------------------------------------------------------------

On 2015-11-17T11:37:41Z, WiseGenius, commented:
<https://github.com/red/red/issues/1449#issuecomment-157344869>

    This issue is now resolved for all cases.

