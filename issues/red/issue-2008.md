
#2008: Wish: ESC should return to >> level even when typed in response to ASK
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.wish] [status.duplicate]
<https://github.com/red/red/issues/2008>

This is Rebol 2 behaviour and it allows, amongst others, to terminate any computation prematurely (e.g. a FOREVER loop that has gone bad).

Currently, typing ESC into ASK yields the string "^[" i.e. the molded escape.



Comments:
--------------------------------------------------------------------------------

On 2016-06-19T07:28:32Z, x8x, commented:
<https://github.com/red/red/issues/2008#issuecomment-226983755>

    see https://github.com/red/red/issues/1844

--------------------------------------------------------------------------------

On 2016-06-19T16:37:07Z, meijeru, commented:
<https://github.com/red/red/issues/2008#issuecomment-227006876>

    Duplicates #1844.

