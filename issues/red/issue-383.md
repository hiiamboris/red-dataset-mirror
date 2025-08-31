
#383: LOAD doesn't strip literal string delimiters
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/383>

Not a blocker because FORM can be used as a workaround, but the interpreter would be a lot more demoable if this worked:

red>> s: "!"
== "!"
red>> print s
!"
red>> mold s
== ""!""
red>> form s
== "!"
red>> print form s
!



