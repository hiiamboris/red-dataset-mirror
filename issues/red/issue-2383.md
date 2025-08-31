
#2383: FIND complement bitset bug
================================================================================
Issue is closed, was reported by nicolas42 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2383>

whitespace: charset { ^-^/}
non-whitespace: complement whitespace
arg: "something this way comes"

find arg whitespace
== " this way comes"
find arg non-whitespace
== " this way comes"


Comments:
--------------------------------------------------------------------------------

On 2017-01-02T13:33:59Z, endo64, commented:
<https://github.com/red/red/issues/2383#issuecomment-269973061>

    I think this is related to or duplicate of #2308

