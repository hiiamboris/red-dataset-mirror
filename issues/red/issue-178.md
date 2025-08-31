
#178: Red lexer grammar contains any in wrong places
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/178>

Both in the `expression` and the `header` rules the grammar contains `any pos: ws` which should be `pos: any ws`.



Comments:
--------------------------------------------------------------------------------

On 2011-10-11T14:03:13Z, dockimbel, commented:
<https://github.com/red/red/issues/178#issuecomment-2361639>

    I will release tonight a more advanced version that will fix that issue.

