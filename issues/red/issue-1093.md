
#1093: Parse: copy does not copy input after backtracking
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[type.bug] [status.reviewed] [test.written]
<https://github.com/red/red/issues/1093>

Copy does not seem to copy the matched input if specified after backtracking a non-matching rule:

```
red>> parse "abcde" [copy str to end (print str)]
abcde
== true
red>> parse "abcde" ["xyz" | copy str to end (print str)]

== true

```



Comments:
--------------------------------------------------------------------------------

On 2015-04-21T10:54:10Z, dockimbel, commented:
<https://github.com/red/red/issues/1093#issuecomment-94743671>

    Cannot reproduce the issue. Could you try it again with latest commit from master branch?

--------------------------------------------------------------------------------

On 2015-04-21T11:12:07Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1093#issuecomment-94747420>

    The code now works in the master branch.

