
#1524: `keep` without `collect` causes an access violation
================================================================================
Issue is closed, was reported by Skrylar and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1524>

Tested on: Red 0.5.4

Code to reproduce:

```
ralette-grammar: [
   'decompose 'to ['rgb keep ([things])]
]

print parse [decompose to rgb] ralette-grammar
```



