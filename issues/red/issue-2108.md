
#2108: Parse to/thru rule does not work properly
================================================================================
Issue is closed, was reported by pekr and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2108>

red>> parse "x" [to ["." | end]]
== false



Comments:
--------------------------------------------------------------------------------

On 2016-07-12T16:41:12Z, pekr, commented:
<https://github.com/red/red/issues/2108#issuecomment-232104215>

    The same goes for thru rule ...

--------------------------------------------------------------------------------

On 2016-07-12T16:51:14Z, dockimbel, commented:
<https://github.com/red/red/issues/2108#issuecomment-232107176>

    Simpler form: `parse "x" [to [end]]`

