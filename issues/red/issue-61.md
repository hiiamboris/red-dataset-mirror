
#61: (non-value) exit from functions which return a value
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/61>

Exit is allowed in functions which should produce a return value. If the error reported in the previous issue does not occur, the value resulting from the function call is probably arbitrary.



Comments:
--------------------------------------------------------------------------------

On 2011-05-26T21:15:17Z, dockimbel, commented:
<https://github.com/red/red/issues/61#issuecomment-1245473>

    This one is really nasty, thanks for reporting it.

--------------------------------------------------------------------------------

On 2011-06-01T13:31:02Z, dockimbel, commented:
<https://github.com/red/red/issues/61#issuecomment-1274301>

    An EXIT-specific compilation error is raised now in such cases.
    Tested OK.

