
#495: prefix operators do compile but are not implemented
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/495>

The following code complies:

```
Red []
a: func [] [
    + 3 6
]
print a
```

when run it outputs value `3`.

Also, in the console: `+ 3 6` yields `6`.

Regards,
   Arie



Comments:
--------------------------------------------------------------------------------

On 2013-07-08T17:47:41Z, dockimbel, commented:
<https://github.com/red/red/issues/495#issuecomment-20623129>

    Infix operators cannot be used as prefix ones. Use the real prefix counterparts: `add`
    
    red>> add 3 6
    == 9
    
    I dismiss this ticket, but this use-case was worth reporting and should be listed in a Red vs Rebol comparison page.

