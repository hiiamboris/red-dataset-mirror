
#48: Variable names are more restricted than documentation says
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/48>

Section 3 of the specs suggests that the following signs are allowed in names: ! ' \* + - . < = > ? _ ` \ ~ (computed by taking the complement of what is stated there to be forbidden). An exhaustive test revealed that \ (backslash) is also forbidden, and that ' < > cannot begin a name.



Comments:
--------------------------------------------------------------------------------

On 2011-05-23T22:39:27Z, dockimbel, commented:
<https://github.com/red/red/issues/48#issuecomment-1224785>

    Thanks for taking the time to test that.
    Specification fixed by commit: https://github.com/dockimbel/Red/commit/05eb9811d529c88b1d3c679c2a9cf1f14e312dd4

