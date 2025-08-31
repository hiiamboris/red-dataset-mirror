
#525: Tokeniser chokes on multi-line curlies
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/525>

I suspect this is a regression from #522:

red>> "^/"
== "^/"
red>> load "^/"
== []
red>> {^/}
**\* Load Error: string ending delimiter } not found!
== {
^}}
red>> {{^/}}
**\* Load Error: string ending delimiter } not found!
== {^{
^}^}}



