
#593: PARSE KEEP unstable
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/593>

red>> parse "12" [collect [keep skip]]
== [#"1"]
red>> parse "12" [collect [keep copy x skip]]
== ["1"]
red>> parse "12" [collect [keep skip]]
== ["1"]

I think having KEEP return a char! for a single SKIP is useful, because you can force it to always be a string! with COPY.



