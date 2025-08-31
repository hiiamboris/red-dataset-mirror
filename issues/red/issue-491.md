
#491: LOAD doesn't respect index
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/491>

red>> load next "1 2"
== [1 2]



Comments:
--------------------------------------------------------------------------------

On 2013-06-19T06:54:16Z, dockimbel, commented:
<https://github.com/red/red/issues/491#issuecomment-19666052>

    Good catch!

--------------------------------------------------------------------------------

On 2013-06-19T16:50:43Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/491#issuecomment-19697109>

    It's probably from before the rs-head function, because it's not using it.

