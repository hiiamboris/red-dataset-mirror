
#632: FORM file! not escaped
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/632>

red>> append make file! 0 "a b"
== %a b

REBOL:

> > append make file! 0 "a b"
> > == %a%20b
> > %"a b"
> > == %a%20b



Comments:
--------------------------------------------------------------------------------

On 2014-01-02T03:22:43Z, dockimbel, commented:
<https://github.com/red/red/issues/632#issuecomment-31436380>

    File! datatype support is currently minimal, as it was added just for being able to LOAD file! literals. So, I'm tagging this ticket as "review" rather than "bug".

