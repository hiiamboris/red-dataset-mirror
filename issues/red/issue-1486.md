
#1486: In VID, it doesn't seem possible to draw on a base face
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
<https://github.com/red/red/issues/1486>

In `%view-test.red` the `draw` field of a `base` face is set programmatically. There does not seem to be a corresponding facility in the VID  DSL.



Comments:
--------------------------------------------------------------------------------

On 2015-12-04T12:05:53Z, meijeru, commented:
<https://github.com/red/red/issues/1486#issuecomment-161951916>

    I withdraw the issue. I found a way.

--------------------------------------------------------------------------------

On 2015-12-04T12:07:37Z, Oldes, commented:
<https://github.com/red/red/issues/1486#issuecomment-161952165>

    @meijeru You should at least paste _the way_ here, just for a record

--------------------------------------------------------------------------------

On 2015-12-04T12:13:58Z, meijeru, commented:
<https://github.com/red/red/issues/1486#issuecomment-161953125>

    Just follow the `base` spec by `draw [...]`. I think my fault was that I made a mistake in the contents of the draw block, and thought that `draw`was not permitted itself.

