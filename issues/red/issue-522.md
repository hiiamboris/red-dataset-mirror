
#522: Tokeniser chokes on nested curlies
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/522>

red>> probe {"x"}
{"x"}
== {"x"}
red>> probe {{x}}
"{x"
**\* Error: word has no value!



