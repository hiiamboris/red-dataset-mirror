
#1146: Console crash when entering following key sequence '{' + '/' + '(tab)'
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1146>

Type `{/(tab)` in the console and you get:

```
red>> {/*** Syntax error: invalid string at ""
                                              *** Where: do
                                                           %
```



