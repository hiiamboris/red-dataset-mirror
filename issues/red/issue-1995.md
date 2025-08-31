
#1995: LOAD/NEXT fails to error out on "(]"
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1995>

```
red>> load/next "(]" 'a
== []
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-11T12:01:07Z, dockimbel, commented:
<https://github.com/red/red/issues/1995#issuecomment-225356532>

    The delimiters opening/closing handling in current runtime lexer is too limited and can't handle all the cases. It needs a more accurate matching method.

