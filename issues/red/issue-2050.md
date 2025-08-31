
#2050: REPL waits for closing square braces if there are open ones in pasted text
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2050>

paste this in console:

```
{[
[}
```

will return:

```
  {[
{    [}
[
*** Syntax error: missing #"[" at {^}^/^/]}
```



