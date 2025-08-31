
#658: INTO doesn't take generic rule
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/658>

Only a block:

red>> parse [[]] [into []]
== true
red>> r: []
== []
red>> parse [[]] [into r]
**\* Parse Error: INTO invalid argument
== true



