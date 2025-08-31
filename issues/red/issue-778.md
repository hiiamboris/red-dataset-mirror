
#778: Error occurs where set-word with the return value of a function
================================================================================
Issue is closed, was reported by WayneCui and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/778>

Only in console but not with the compiler.

```
f: function[][ return 1 ]
probe t: (f)               ;1
probe f                    ;1
probe t: f
*** Runtime Error 1: access violation
*** at: 00434710h
```

It seems that this error relates to `return`:

```
f: function [] [ 1 ]
probe t: (f)         ;1
probe f              ;1
probe t: f           ;1
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-17T19:43:41Z, dockimbel, commented:
<https://github.com/red/red/issues/778#issuecomment-40754492>

    Good catch!

--------------------------------------------------------------------------------

On 2014-04-18T14:47:41Z, WayneCui, commented:
<https://github.com/red/red/issues/778#issuecomment-40814007>

    Hi Doc! There is a regression caused by this fix, see: https://github.com/red/red/issues/770

