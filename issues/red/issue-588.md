
#588: PARSE INSERT paren! doesn't work
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/588>

Seems unimplemented:

red>> parse b: [] [insert (0)]
== true
red>> b
== [(0)]

R3:

> > parse b: [] [insert (0)]
> > == true
> > b
> > == [0]



Comments:
--------------------------------------------------------------------------------

On 2013-12-03T12:38:18Z, dockimbel, commented:
<https://github.com/red/red/issues/588#issuecomment-29706152>

    It was not meant to work with paren expressions, only fixed values. But it's a useful feature, so I agree that we should have it.

