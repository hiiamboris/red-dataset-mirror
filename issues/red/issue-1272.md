
#1272: Conversion from string containing integer or float to percent is not allowed -- it should be
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/1272>

`to percent! "5%"` does work, but `to percent! "0.05"` does not, neither does `to percent! "1"`



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T09:12:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1272#issuecomment-178464357>

    See #1270.

