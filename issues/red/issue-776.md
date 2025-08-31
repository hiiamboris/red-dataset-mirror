
#776: Infix operators creation from functions can't use local variables.
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/776>

Only occur in Console.

```
red>> infix: function [a b][r: 1 either a > 0 [a + r][b]]
== func [a b /local r][r: 1 either a > 0 [a + r] [b]]
red>> ***: make op! :infix
== make op! [[a b /local r]]
red>> 3 *** 7
== 4025119                ; maybe crash
red>> -3 *** 7
== 7
```



