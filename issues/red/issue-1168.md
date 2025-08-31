
#1168: "non-existant physical address" on incomplete CASE statement
================================================================================
Issue is closed, was reported by hostilefork and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1168>

If your CASE statement is incomplete (provides condition but no code block at end of input) it will crash:

```
>> case [1 > 2 [print "math is broken"]]
== none

>> case [1 > 2 [print "math is broken"] 1 < 2]

*** Runtime Error 27: non-existant physical address
*** at: 00016A0Fh
```

Does not occur if a block associated with the condition would not be run:

```
>> case [1 > 2 [print "math is broken"] 2 > 3]
== none
```

Observed in 0.5.3



