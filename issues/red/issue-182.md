
#182: Lexer still recognizes numbers preceded by '  :  or /  as lit/get-word!  resp. refinement!
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/182>

This is because the fact that a word cannot begin with a digit is not reflected in the grammar. There should probably be two rules: one for word-starting characters and one for subsequent characters.



Comments:
--------------------------------------------------------------------------------

On 2011-10-13T12:00:55Z, dockimbel, commented:
<https://github.com/red/red/issues/182#issuecomment-2393913>

    Right, I forgot to add a rule for the first word character.

--------------------------------------------------------------------------------

On 2011-10-13T22:46:23Z, dockimbel, commented:
<https://github.com/red/red/issues/182#issuecomment-2401224>

    Issue fixed for numbers preceded by `'` or `:`, but `/` is allowed.

