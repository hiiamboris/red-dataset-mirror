
#146: as-integer doesn't clear high bits on byte read from struct
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/146>

s: declare struct! [
    a   [byte!]
    b   [byte!]
    c   [byte!]
    d   [byte!]
]
s/a: as-byte 1
s/b: as-byte 1
s/c: as-byte 0
s/d: as-byte 0
print-hex as-integer s/a

> > 804AD01



Comments:
--------------------------------------------------------------------------------

On 2011-08-23T20:39:02Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/146#issuecomment-1883771>

    This bug is back after the casting reimplementation.

--------------------------------------------------------------------------------

On 2011-08-24T09:42:27Z, dockimbel, commented:
<https://github.com/red/red/issues/146#issuecomment-1888229>

    I cannot reproduce the issue, I get `00000001` as result from the above code, which is correct.

--------------------------------------------------------------------------------

On 2011-08-24T12:47:58Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/146#issuecomment-1889367>

    Sorry, #150 is the exact case that's back.

