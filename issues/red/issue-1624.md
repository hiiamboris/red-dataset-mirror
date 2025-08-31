
#1624: In GUI console, "dead" keys are repeated instead of stalling.
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1624>

I have Windows 10 and a keyboard setting which gives special treatment to the quote keys (single, double and back tick), the circumflex and the tilde: hitting them once does not show anything, hitting a vowel key (or also n in the case of tilde and c in the case of single quote) afterwards produces the accented letter (e.g. á, ä, à, ã, â, ñ, ç), hitting another key produces both the quote etc. and the other sign, hitting a space afterwards produces the intended quote etc. on its own without advancing further.

Now in the GUI console, hitting any of these dead keys produces _two_ quotes etc. immediately, without waiting for the next keypress.



Comments:
--------------------------------------------------------------------------------

On 2016-02-20T01:56:16Z, dockimbel, commented:
<https://github.com/red/red/issues/1624#issuecomment-186484801>

    Fixed by the merge of `key-down` branch to master.

