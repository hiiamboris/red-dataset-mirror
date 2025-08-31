
#652: Lexer accepts a subset of type names for escaped-rule
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/652>

This parsing rule recognizes constructs of the form #[none] #[true] #[false] and type names enclosed in the same brackets #[ ]. In each case, it yields the value bound to the word. In that connection, it is curious that only 21 of the currently defined type names are accepted. Apart from the types that have not been implemented, get-path! is most notably absent, and also unset! and file!.

Incidentally, REBOL 3 uses this construct to offer to the lexer some values that could otherwise not be represented (serialization). If I remember correctly, the type names are automatically bound in REBOL 3.



Comments:
--------------------------------------------------------------------------------

On 2014-02-13T11:20:15Z, dockimbel, commented:
<https://github.com/red/red/issues/652#issuecomment-34969485>

    Support for construction syntax `#[...]` has not been completed yet. It might be done once the new runtime lexer will be in place or later. Please do not fill tickets about it.

