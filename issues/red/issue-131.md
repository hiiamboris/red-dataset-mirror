
#131: Can assign null to byte variable
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/131>

I thought that pointer values (32 bits), i.e. `c-string! pointer![...]` or `struct![...]` could not be assigned to byte variables. But `null` _can_. Is this correct?



Comments:
--------------------------------------------------------------------------------

On 2011-07-06T12:34:41Z, dockimbel, commented:
<https://github.com/red/red/issues/131#issuecomment-1511346>

    No, it is not correct. A type check is probably missing.

