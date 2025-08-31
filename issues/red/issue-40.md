
#40: alias not preceded by set-word crashes compiler
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.tested]
<https://github.com/red/red/issues/40>

comp-alias assumes that the lexical element preceding the word alias is a set-word and does a to-word on it. This crashes the compiler if the element in question is something different.

Try
1 alias integer!



Comments:
--------------------------------------------------------------------------------

On 2011-05-19T19:30:38Z, dockimbel, commented:
<https://github.com/red/red/issues/40#issuecomment-1205775>

    Good one, this is clearly a regression.

--------------------------------------------------------------------------------

On 2011-05-21T15:16:56Z, dockimbel, commented:
<https://github.com/red/red/issues/40#issuecomment-1214656>

    Tested OK.

