
#59: exit and return are not checked for occurrence inside function
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/59>

As a consequence, exit can be used anywhere, and return may crash the compiler if not within function, since the existence of the surrounding function is assumed for checking the return value type.



Comments:
--------------------------------------------------------------------------------

On 2011-05-26T21:20:28Z, dockimbel, commented:
<https://github.com/red/red/issues/59#issuecomment-1245511>

    Sometimes, having the nose too close to the code prevents from seeing the need for obvious checks like this one. Fortunately, you have hawk eyes. :-)

--------------------------------------------------------------------------------

On 2011-06-01T12:50:16Z, dockimbel, commented:
<https://github.com/red/red/issues/59#issuecomment-1274078>

    Tested OK.

