
#454: POKE doesn't work on strings yet
================================================================================
Issue is closed, was reported by greggirwin and has 8 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/454>

Working on a few mezzanines that could use CHANGE or POKE. Right now I'm using POKE in a mezz level CHANGE, which works for blocks, but crashes on strings right now.



Comments:
--------------------------------------------------------------------------------

On 2013-03-30T22:29:36Z, dockimbel, commented:
<https://github.com/red/red/issues/454#issuecomment-15683071>

    Gregg, could you please paste here a code example that shows the error?

--------------------------------------------------------------------------------

On 2013-03-30T23:16:30Z, greggirwin, commented:
<https://github.com/red/red/issues/454#issuecomment-15683647>

    red>> s: "123456"
    == "123456"
    red>> poke s 1 "A"
    
    Just realized this should be an error condition, which is how REBOL treats it. Poking at char! works fine.

--------------------------------------------------------------------------------

On 2013-03-30T23:19:56Z, dockimbel, commented:
<https://github.com/red/red/issues/454#issuecomment-15683682>

    Right analysis. You need to write only correct code for now until error management is implemented.

--------------------------------------------------------------------------------

On 2013-04-02T09:34:42Z, dockimbel, commented:
<https://github.com/red/red/issues/454#issuecomment-15765505>

    I'm closing this ticket as it refers to an unimplemented feature.

