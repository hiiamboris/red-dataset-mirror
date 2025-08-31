
#2303: parse error: into incorrect behavior
================================================================================
Issue is closed, was reported by JacobGood1 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2303>

When parse uses INTO to enter a structure in the code, if it matches the first element in that structure, it automatically matches the entire structure, regardless of the code contained within.

Example below:

red>> parse [[max 1 2 3]] [into ['max]]
== true


