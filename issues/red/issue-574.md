
#574: SWITCH crashes on multiple keys in interpreter
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/574>

The following code:

```
Red []

probe do [switch 'a [a b [1] b [2]]]
```

results in the following crash when run:

```
*** Runtime Error 1: access violation
*** in file: block.reds
*** at line: 47
```



