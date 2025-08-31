
#321: Result of if, when condition is false, is arbitrary
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/321>

Try `print type? if false [1]` ; this is `logic!`
Try `print 1 + if false [2]` ; this is `41` on my computer

I would guess that something is not set here. What does the language definition say? Should `if false [anything]` be `none`? It is in REBOL. 



Comments:
--------------------------------------------------------------------------------

On 2012-11-29T08:26:59Z, dockimbel, commented:
<https://github.com/red/red/issues/321#issuecomment-10838853>

    Red should return `none` too in such case.

