
#1994: WISH: refinement /hide on ASK and INPUT
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/1994>

This is in analogy with R3 (where the implementation is defective, though). The effect is to replace the echo'ed characters by \* or similar. Typical application: input of passwords.



Comments:
--------------------------------------------------------------------------------

On 2016-06-11T11:27:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1994#issuecomment-225354461>

    The current implementations of `ask` and `input` are temporary until we get proper I/O support in 0.7.0, so I doubt we'll implement this feature before 0.7.0.

--------------------------------------------------------------------------------

On 2016-06-11T11:28:59Z, meijeru, commented:
<https://github.com/red/red/issues/1994#issuecomment-225354540>

    Fine! It can wait, but I think in the end it will prove useful.

--------------------------------------------------------------------------------

On 2016-06-11T12:10:36Z, dockimbel, commented:
<https://github.com/red/red/issues/1994#issuecomment-225357062>

    I didn't say it wasn't useful, just that we usually don't invest in polishing features which are implemented  with temporary code.

--------------------------------------------------------------------------------

On 2016-06-15T10:20:46Z, dockimbel, commented:
<https://github.com/red/red/issues/1994#issuecomment-226147334>

    I will close this ticket as it's among planned features, but they won't come until 0.7.0 at least, where `ask` and `input` will be reimplemented in their final form.

--------------------------------------------------------------------------------

On 2019-08-29T16:31:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1994#issuecomment-526263901>

    We need this feature now for the `eth://` scheme.

--------------------------------------------------------------------------------

On 2019-08-29T18:11:44Z, 9214, commented:
<https://github.com/red/red/issues/1994#issuecomment-526300404>

    @dockimbel coincidentially, @bitbegin wanted to implement this after recent [request](https://gitter.im/red/help?at=5d6777724b1189084e830624).

