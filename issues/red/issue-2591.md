
#2591: Interpreter crash on invalid path
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2591>

Interpreter will crash when executing `system/words/:word` with `word` being a `native!`.
Example:
```
system/words/:do

*** Runtime Error 1: access violation
*** at: 000394EDh
```


