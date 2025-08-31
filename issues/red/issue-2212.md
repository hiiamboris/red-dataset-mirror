
#2212: Assigning result of repeat appending to block leads to crash when compiled
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2212>

This code works fine in interpreter:

```
red>> x: repeat i 2 [append [] 1]
== [1 1]
```

When compiled, it will result in `access violation` crash.



