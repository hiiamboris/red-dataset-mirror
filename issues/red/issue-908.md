
#908: PARSE using CHARSET is case-sensitive despite lack of /CASE setting
================================================================================
Issue is closed, was reported by hostilefork and has 14 comment(s).
<https://github.com/red/red/issues/908>

If you say:

```
parse "abc" [some [#"A" | #"B" | #"C"]]
```

You will get TRUE.  But if you say:

```
c: charset [#"A" #"B" #"C"] 
parse "abc" [some c]
```

You will get FALSE.  This was a Rebol2 behavior that was changed in Rebol3 to return TRUE.

In the absence of a larger rethinking of switching to case-sensitive handling of character strings and characters by default, returning TRUE makes more sense.

Beyond intuitive reasons, there is the technical fact that there's no way to request a case-insensitive comparison on your charsets _if that is what you wanted_.



Comments:
--------------------------------------------------------------------------------

On 2014-08-25T20:36:42Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/908#issuecomment-53326395>

    I use this as a feature. parse/case is wholesale, so you must use charset! to make only parts of a PARSE case sensitive.

--------------------------------------------------------------------------------

On 2014-08-25T20:49:05Z, hostilefork, commented:
<https://github.com/red/red/issues/908#issuecomment-53328093>

    > I use this as a feature. parse/case is wholesale, so you must use charset! to make only parts of a PARSE case sensitive.
    
    That is quite an odd shaped tool, applying only to single character analysis at a time...and breaking the default assumptions of the language.
    
    Perhaps a better-shaped tool would be if CASE was not a refinement, but a mode switch you could change in mid-parse to be on and off?  E.g. `case on`, `case off`?  Then it could work with other things, like full strings.
    
    ```
    >> parse "aAaAHedgehog" [some "a" case on "Hedgehog"]
    == true
    
    >> parse "aAaAHEDGEHOG" [some "a" case on "Hedgehog"]
    == false
    ```

--------------------------------------------------------------------------------

On 2014-08-26T09:07:48Z, PeterWAWood, commented:
<https://github.com/red/red/issues/908#issuecomment-53393882>

    I suspect that this request comes from a misunderstanding about charset. There are no charset values, charset is a function that creates bitset! values. The name of the function is possibly a bit misleading.
    
    A more pragmatic approach to your proposal would seem to be to provide a refinement to charset that creates the appropriate bitset! with both the upper and lower case bits. (This would allow a Unicode module to replace a basic charset function with a Unicode aware one too.)
    
    Some time ago, it was requested that proposals such as this one were made via the Red Github Wiki and not submitted as issues. I have created a start of a proposal for this request in the Wiki at https://github.com/red/red/wiki/Add-a-Refinement-to-the-charset-function-to-make-a-case-insensitive-bitset!.
    
    I am closing this issue.

--------------------------------------------------------------------------------

On 2014-08-26T23:04:58Z, earl, commented:
<https://github.com/red/red/issues/908#issuecomment-53506034>

    > I suspect that this request comes from a misunderstanding about charset. There are no charset values,
    > charset is a function that creates bitset! values.
    
    I suspect this is a misunderstanding in itself. This is not so much about the CHARSET constructor or the underlying bitset! type but about how to _match_ a character against a bitset.
    
    Taking Unicode and the design as matching against the bit corresponding to the Unicode codepoint as a given, this matching can still be done with case-folding (effectively case-insensitive) or without case-folding (case-sensitive). In effect, this boils down to two or one checks against the bitset.

--------------------------------------------------------------------------------

On 2014-08-26T23:06:30Z, earl, commented:
<https://github.com/red/red/issues/908#issuecomment-53506165>

    > I use this as a feature. parse/case is wholesale, so you must use charset! to make only parts of a PARSE case sensitive.
    
    Regarding partial case-(in)sensitivity, be sure also see the proposed CASE / NO-CASE parse enhancement: http://www.rebol.net/wiki/Parse_Project#CASE_and_NO-CASE_keyword_pair -- that strikes me as a far better design, than using charsets as a workaround for this purpose.

--------------------------------------------------------------------------------

On 2014-08-27T00:40:45Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/908#issuecomment-53513118>

    Agreed.

--------------------------------------------------------------------------------

On 2014-08-27T08:03:22Z, PeterWAWood, commented:
<https://github.com/red/red/issues/908#issuecomment-53538252>

    I have updated the proposal -  https://github.com/red/red/wiki/Parse-should-be-consistent-in-applying-case-sensitivity-to-rules - to reflect Andreas's input. 

