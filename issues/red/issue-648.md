
#648: Series of control characters #"^@" - #"^_" has one exception: #"^^" is not U+001E
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.reviewed] [type.documentation]
<https://github.com/red/red/issues/648>

In the lexer, these are mapped on U+0000 - U+001F. However, the special case #"^^" is caught before, and is mapped on U+005E (escaped caret). Incidentally, REBOL has the same, both 2 and 3.



Comments:
--------------------------------------------------------------------------------

On 2014-02-07T15:40:58Z, dockimbel, commented:
<https://github.com/red/red/issues/648#issuecomment-34452087>

    Yes, the `^^` is used to escape the caret character which is U+005E.
    
    What is the issue you are reporting there?

--------------------------------------------------------------------------------

On 2014-02-07T16:02:52Z, meijeru, commented:
<https://github.com/red/red/issues/648#issuecomment-34456945>

    Mainly, to remember that such behaviour should be documented: #"^^" does not stand for U+001E (RS control character), and there is no other escape for this control character, except #"^(1E)". 

--------------------------------------------------------------------------------

On 2014-02-13T11:30:58Z, dockimbel, commented:
<https://github.com/red/red/issues/648#issuecomment-34970161>

    Ok, noted for future inclusion in the Red documentation.

