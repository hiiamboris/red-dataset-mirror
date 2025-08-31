
#2318: Crash when owned word re-set in an object
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2318>

If value of a owned word in an object set to a new value or set to a new series position both console and compiled exe crashes with access violation.

```
o: context [a: "x" on-deep-change*: function [owner word target action new index part] [ ] ]
o/a: "y"  ;crash
o/a: next o/a  ;crash

*** Runtime Error 1: access violation
*** at: 6A98E54Ch
```


