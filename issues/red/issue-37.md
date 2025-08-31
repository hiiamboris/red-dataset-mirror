
#37: Some REBOL values allowed on input that are not usable
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.tested]
<https://github.com/red/red/issues/37>

The current implementation of the compiler allows `decimal!` and `struct!` values (I mean REBOL `struct!` literals, presumably created with `#[struct! [...][...]]`) which are only trapped if they are used in an expression. They could be eliminated earlier in the process.



Comments:
--------------------------------------------------------------------------------

On 2011-05-19T13:55:14Z, dockimbel, commented:
<https://github.com/red/red/issues/37#issuecomment-1203516>

    Tested OK, both decimal! and struct! literals now produce a "datatype not allowed" compilation error.

