
#601: KEEP 0 SKIP broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/601>

red>> b: [] parse "!" [collect into b [keep 0 skip]]
== false
red>> head b
== [#"!"]



