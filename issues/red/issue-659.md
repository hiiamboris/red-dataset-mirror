
#659: Nested recursive PARSE INTO crash
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/659>

red>> f: does [parse [] []]
== func [][parse [] []]
red>> r: [
[         ahead block! into [r]
[         | skip (f)
[   ]
== [ahead block! into [r] | skip (f)]
red>> parse [[0]] r

**\* Runtime Error 1: access violation
**\* at: 080907E3h



