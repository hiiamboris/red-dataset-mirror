
#55: "attempt to change type of variable" not properly treated
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/55>

I tried various combinations of subsequent assignments to values of different type. All are compiled with no error message except the following: 

```
i: 0 
i: "A"
** Script Error: Cannot use path on none! value
** Where: emit-store
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-25T17:42:15Z, dockimbel, commented:
<https://github.com/red/red/issues/55#issuecomment-1236873>

    The compiler is still missing some checks to block variables redefinition.

--------------------------------------------------------------------------------

On 2011-06-06T11:16:02Z, dockimbel, commented:
<https://github.com/red/red/issues/55#issuecomment-1308568>

    Tested OK.

--------------------------------------------------------------------------------

On 2011-06-06T11:48:11Z, dockimbel, commented:
<https://github.com/red/red/issues/55#issuecomment-1308676>

    Forgot to run the unit tests before committing, the fix is not good, it creates a lot of regressions. I am working on a new fix for this issue.

--------------------------------------------------------------------------------

On 2011-06-06T14:03:42Z, dockimbel, commented:
<https://github.com/red/red/issues/55#issuecomment-1309344>

    Tested OK. 

