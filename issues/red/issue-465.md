
#465: make string! 0 and appending char! values produces incorrect results
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/465>

red>> s: make string! 0
== ""
red>> append s #"B"
== "^A"
red>> append s #"C"
== "^A^@"
red>> append s #"D"
== "^A^@^@"

Making a string of length 1 or more works fine, as does appending string values (even if they just contain a single character) to a "make string! 0" string.



