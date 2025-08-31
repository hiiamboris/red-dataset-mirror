
#44: type casting only accepted in assignment (not documented, and not properly checked)
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.tested]
<https://github.com/red/red/issues/44>

When one tries to use a type casted value other than as right-hand side of an assignment, the compiler balks (in fact crashes with `** Script Error: call expected name argument of type: word`). Try `if 1 = as integer! true [print "OK"]`.



Comments:
--------------------------------------------------------------------------------

On 2011-05-23T22:44:42Z, dockimbel, commented:
<https://github.com/red/red/issues/44#issuecomment-1224806>

    Tested OK.

