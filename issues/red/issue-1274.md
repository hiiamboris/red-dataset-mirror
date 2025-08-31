
#1274: Conversion from string to file and url vice-versa is restricted
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/1274>

R2 and R3 do allow `to string! %abc` and `to file! "abc"` etc., but Red does not. This will be felt as a restriction.



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T02:16:16Z, dockimbel, commented:
<https://github.com/red/red/issues/1274#issuecomment-178314686>

    `to` is only partially implemented for now, the expected conversion rules will be there once we make the full implementation (unscheduled yet, though probably for 0.6.1).

