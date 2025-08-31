
#116: New % operator is also ///
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built]
<https://github.com/red/red/issues/116>

The pre-processor in LOADER converts `%` to `///` since a single `%` cannot be loaded by REBOL. As a consequence one can use `///` as an alternative freely, and also a mistyped `///` is not signalled. A "native" loader, perhaps along the lines I have sketched, would make pre-processing completely superfluous (also for hex-integers), and thus avoid the above situation. It would still have to store `///` instead of `%` internally, as long as the compiler is written in REBOL (2). Note that REBOL 3 admits `%`, as an "empty" file! literal.



Comments:
--------------------------------------------------------------------------------

On 2011-06-29T22:28:18Z, dockimbel, commented:
<https://github.com/red/red/issues/116#issuecomment-1471116>

    I only see two options:
    - document it properly in the specification (explain that `///` can also be used as `%`)
    - use your nicely done lexer
    
    The second option looks the more attractive (for a lot of reasons), I just need to review and test your lexer first to ensure it meets the requirements. I am putting this ticket in "wait" status in the meantime.

--------------------------------------------------------------------------------

On 2011-07-01T16:48:14Z, meijeru, commented:
<https://github.com/red/red/issues/116#issuecomment-1484210>

    My lexer is now in a decent shape (see latest gists). The awkward preprocessing has turned out to be completely unnecessary: the grammar can do everything, thanks to the capabilities of REBOL's parse. 

--------------------------------------------------------------------------------

On 2011-07-03T15:03:27Z, dockimbel, commented:
<https://github.com/red/red/issues/116#issuecomment-1493368>

    Specification draft updated to add `///` as reserved keyword and explain that it is an internal representation for `%` required by the current dependency on REBOL's lexical scanner.

