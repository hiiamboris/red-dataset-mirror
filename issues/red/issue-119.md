
#119: Use PUT-* instead of PRIN?
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/119>

A reminder that we need a design decision on this. PRIN alone wasn't so bad, but because Red/System doesn't have polymorphism, it explodes into PRIN-INT and such, sticking out like a sore thumb ever more.

It has been noted that PRINT & PRINT-LINE would be too long for console use.

The alternative is to replace PRIN. The most likely candidate would be PUT.



Comments:
--------------------------------------------------------------------------------

On 2011-06-30T14:36:08Z, meijeru, commented:
<https://github.com/red/red/issues/119#issuecomment-1475225>

    PRIN suggests ouput to the console. PUT suggests nothing at all. Naively, I would expect an additional argument, e.g. a file-name, or a handle of some sort, to indicate where the output is to go.

--------------------------------------------------------------------------------

On 2011-06-30T14:55:20Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/119#issuecomment-1475361>

    Yes, I agree PRINT-LINE would be better, but we have the console argument.

--------------------------------------------------------------------------------

On 2011-06-30T21:07:14Z, dockimbel, commented:
<https://github.com/red/red/issues/119#issuecomment-1478121>

    _It has been noted that PRINT & PRINT-LINE would be too long for console use._
    
    There is no console planned for Red/System, only for Red.

--------------------------------------------------------------------------------

On 2011-07-01T01:48:26Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/119#issuecomment-1480261>

    Well, the console argument was yours. Anyway, I guess the naming of the functions should be consistent as much as possible between Red/System and Red.

--------------------------------------------------------------------------------

On 2011-08-01T16:09:19Z, dockimbel, commented:
<https://github.com/red/red/issues/119#issuecomment-1701573>

    After thinking about it, I think that `put` is not meaningful enough in this context (printing on screen). I do not wish that Red and Red/System looks like C, but I wish they look like REBOL.
    
    To solve the `PRIN-*` issue (leads to quite verbose code), I plan to add variable-arguments and a minimal [RTTI](http://en.wikipedia.org/wiki/Run-time_type_information) support to Red/System.

--------------------------------------------------------------------------------

On 2011-08-03T12:21:15Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/119#issuecomment-1717507>

    That sounds good.

