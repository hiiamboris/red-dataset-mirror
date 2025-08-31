
#562: PARSE ANY IF broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/562>

red>> parse "+" [any [#"+" if (no)]]
== true

Should be FALSE.



