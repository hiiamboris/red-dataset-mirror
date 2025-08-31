
#592: COPY ruins file! type
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/592>

red>> type? %x
== file!
red>> type? copy %x
== string!



Comments:
--------------------------------------------------------------------------------

On 2013-12-05T11:32:28Z, dockimbel, commented:
<https://github.com/red/red/issues/592#issuecomment-29890517>

    Same issue for all block! derivative types.

