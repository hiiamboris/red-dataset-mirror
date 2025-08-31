
#1762: GUI-Console crashes when performing find on an object with a string argument
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1762>

```
red>> o: make object! [a: 1]
== make object! [
    a: 1
]
red>> find o 'a
== true
red>> find o "a"
== gui-console crashes
```



