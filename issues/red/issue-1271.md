
#1271: Treatment of conversions from string to number is inconsistent
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/1271>

`to integer! "1.0"`is not allowed (could result in `1`), but `to float! "1"`is allowed and results in `1.0`



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T09:12:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1271#issuecomment-178464116>

    See #1270.

