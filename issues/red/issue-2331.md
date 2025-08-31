
#2331: make any-list!/any-path! with a binary value does NOT treat the binary as a number to pre-allocate
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2331>

I am not sure that the intended implementation described in the table is a good idea. In any case, it is not implemented,. Instead, the binary is just put in the block etc.


Comments:
--------------------------------------------------------------------------------

On 2016-11-18T16:04:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2331#issuecomment-261568617>

    Binary! is not a number, it's a series, the MAKE table is incorrect.

