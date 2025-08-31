
#145: Literal hex values without letters not accepted
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.resolved]
<https://github.com/red/red/issues/145>

Values such as 100h are not recognised. Here's an example from the #define manual:

color: 550063h

**\* Loading Error: invalid hex literal: 550063h



Comments:
--------------------------------------------------------------------------------

On 2011-08-10T00:54:43Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/145#issuecomment-1768889>

    Oddly, sometimes prefixing a 0 helps, but not always.

--------------------------------------------------------------------------------

On 2011-08-10T01:02:45Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/145#issuecomment-1768933>

    Ah, I see only lengths of 2, 4 and 8 are allowed. Is that new? It seems to be the documentation that's at fault.

--------------------------------------------------------------------------------

On 2011-08-10T09:03:14Z, dockimbel, commented:
<https://github.com/red/red/issues/145#issuecomment-1771039>

    The specification document says: `Hex letters have to be written in uppercase and only 2, 4 and 8 characters are allowed (prefixing with leading zeros is allowed).`
    
    It is at least a couple of months old. The example from the doc you have mentioned needs to be fixed.

