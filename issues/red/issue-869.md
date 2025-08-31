
#869: Bug in trans-float
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/869>

```
red>> [1 2]
== [1 2]
red>> [1 2.3]
missing matching ]
*** Syntax Error: invalid Red value at: [1 2.3

red>> [1 2.3 ]
== [1 2.3]
```



