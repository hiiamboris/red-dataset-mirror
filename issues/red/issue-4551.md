
#4551: on-enter on macOS not working
================================================================================
Issue is closed, was reported by rsheehan and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4551>

**Describe the bug**
An "on-enter" event is not caught when a user types enter/return on a field in macOS.

**To reproduce**
Steps to reproduce the behavior:
1. Enter some text in the field and push return on the following code.
view [field on-enter [print "works"]]

**Expected behavior**
"works" should appear in the terminal window. It works in Windows.
**Platform version (please complete the following information)**
Red 0.6.4 for macOS built 25-Jun-2020/4:06:05+12:00 commit #37801d2



