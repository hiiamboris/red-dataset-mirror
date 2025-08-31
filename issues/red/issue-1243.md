
#1243: union with /skip refinement gives incorrect results
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1243>

```
red>> b: ["A" "a" "b" "B"]
== ["A" "a" "b" "B"]
red>> d: ["E" "e"  "b" "B"]
== ["E" "e" "b" "B"]
red>> union b d
== ["A" "b" "E"]
red>> union/skip b d 2
== ["A" "a" "b" "B" "E" "e" "B"]   ;; should be  ["A" "a" "b" "B" "E" "e"] 
```



