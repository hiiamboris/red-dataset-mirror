
#2187: Parsing of binary literal
================================================================================
Issue is closed, was reported by mikeparr and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2187>

Possible error in parsing of a binary!. Using 
Red 0.6.1:
red>> 64#{aaa }  ;nb trailing space after final a
== #{}

Without the trailing space, the aaa is correctly identified as an error.



