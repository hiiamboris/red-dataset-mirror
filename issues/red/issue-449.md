
#449: A doc string between a refinement and its parameter causes strange behavior
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/449>

Not all details are known, but it looks like the arg is not consumed in the function call, so it is not applied. e.g.

red>> s: copy ""
== ""
red>> append/dup s #"1" 10
== 10
red>> s
== "1"
red>> length? s
== 1



