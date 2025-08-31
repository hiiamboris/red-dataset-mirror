
#1878: Parse crashing if COLLECTed block content is removed
================================================================================
Issue is closed, was reported by Zamlox and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1878>

Following sequence of code will lead to crash:

```
digit: charset "0123456789"
content: "a&&1b&&2c"
block: copy [] parse content [collect into block any [remove keep ["&&" some digit] (remove/part head block 1 probe head block) | skip]]
```

Stack trace:

```
--== Red 0.6.0 ==--
Type HELP for starting information.

== make bitset! #{000000000000FFC0}
== "a&&1b&&2c"
[]

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```



