
#332: exit and return are not checked to be inside a function
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/332>

At least, not by the Red compiler. An `exit` or `return` outside a function is only detected when compiling the Red-System code.



Comments:
--------------------------------------------------------------------------------

On 2012-12-05T21:35:10Z, dockimbel, commented:
<https://github.com/red/red/issues/332#issuecomment-11061652>

    Good catch!

