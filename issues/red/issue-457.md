
#457: FIND/TAIL doesn't work on char! values in strings.
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/457>

red>> find/tail "a/b" #"/"
== "/b"
red>> find "a/b" #"/"
== "/b"



