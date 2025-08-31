
#1865: Get-word! value at end of block or paren corrupts interpreter's stack
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1865>

```
red>> (a: 'ok 1 :a)
== ok

red>> (a: 'ok 1 + 1 :a)    ; NOT OK
== 2

red>> (a: 'ok 1 + 1 probe :a)
ok
== ok
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-01T08:13:07Z, rebolek, commented:
<https://github.com/red/red/issues/1865#issuecomment-244007879>

    Compiled version returns 2 here (W7 under Virtual Box, latest sources).

