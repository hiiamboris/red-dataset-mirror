
#1130: Crash when getting HELP on numeric literal
================================================================================
Issue is closed, was reported by mydoghasworms and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1130>

The interpreter terminates with the following when getting help with `help` or `?` on a numeric literal, e.g. `? 1` or `help 2.2`:

```
*** Runtime Error 1: access violation
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-28T11:01:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1130#issuecomment-97016353>

    Thanks for reporting, not a friendly behavior indeed. :-)

