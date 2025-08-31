
#156: Pointer arithmetic: is integer + pointer allowed?
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/156>

The documentation says: "Note: for + and - operators, a pointer!, struct! or c-string! value can be used for both arguments or as first argument with an integer expression as second argument (see "Pointer arithmetic")." In the section "Pointer arithmetic" it is explained that in the latter case there is multiplication by the size of the pointed value.

In apparent contrast to this, the compiler allows a first argument which is an integer and a second argument which is a pointer. It is not clear what multiplication, if any, is applied here.



Comments:
--------------------------------------------------------------------------------

On 2011-08-16T13:55:57Z, dockimbel, commented:
<https://github.com/red/red/issues/156#issuecomment-1816407>

    The specification is not documenting that combination as it is hard to think of a use-case in practice where it could be used. Anyway, the default rule of implicit casting to left operand is applied in `<integer!> op <pointer!>` case, and no multiplication or  other special operation is added.

