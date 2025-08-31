
#2054: WISH: GUI Console should also accept CTRL-X (CUT) and CTRL-Z (UNDO)
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [GUI] [type.task.wish]
<https://github.com/red/red/issues/2054>

It does accept CTRL-C and CTRL-V for copy/paste already. Especially when using the console for rapid testing, these two will come in handy.



Comments:
--------------------------------------------------------------------------------

On 2016-07-03T10:01:23Z, meijeru, commented:
<https://github.com/red/red/issues/2054#issuecomment-230145330>

    It could also accept CTR-L for clearing the screen.

--------------------------------------------------------------------------------

On 2016-07-03T10:20:40Z, dockimbel, commented:
<https://github.com/red/red/issues/2054#issuecomment-230146018>

    Agreed for CTRL-L, though for the other too, I'm afraid it's too much work, so it will wait for the next big iteration on the console (we plan to port more console code from R/S to Red).

--------------------------------------------------------------------------------

On 2016-07-04T09:09:01Z, dockimbel, commented:
<https://github.com/red/red/issues/2054#issuecomment-230242854>

    CTRL-L is now implemented by commit https://github.com/red/red/commit/6afc3fb001ff24ffe08f635e3847c95c152e108f.

--------------------------------------------------------------------------------

On 2018-11-21T02:04:33Z, qtxie, commented:
<https://github.com/red/red/issues/2054#issuecomment-440501329>

    CTRL-X (CUT) and CTRL-Z (UNDO) are implemented in new gui console.

