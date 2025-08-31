
#598: COLLECT INTO corrupts outer COLLECT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/598>

red>> parse "" [collect [(s: "") collect into s [] keep (s)]]
== [:s ""]
red>> parse [] [collect [(b: []) collect into b [] keep (b)]]
== [:b []]



