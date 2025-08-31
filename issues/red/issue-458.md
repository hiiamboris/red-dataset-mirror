
#458: MOLD/ONLY omits brackets from nested blocks
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/458>

red>> mold [a [b] c]
== "[a [b] c]"
red>> mold/only [a [b] c]
== "a b c"



