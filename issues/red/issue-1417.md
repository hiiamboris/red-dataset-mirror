
#1417: nonnegative remainder read as quotient
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1417>

red-master:

```
red>> -5 // 3
== 1
```

red-gui:

```
red>> -5 // 3
*** Script error: / operator is missing an argument
*** Where: /
```



Comments:
--------------------------------------------------------------------------------

On 2015-11-06T07:46:59Z, dockimbel, commented:
<https://github.com/red/red/issues/1417#issuecomment-154337916>

    Regression caused by recent change for parsing `/` as word in the runtime lexer.

