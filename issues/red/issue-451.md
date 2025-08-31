
#451: Doc strings (it seems) interfere with type? output if result is unset!
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
<https://github.com/red/red/issues/451>

```
red>> get 'x
red>> type? get 'x
==
red>> print type? get 'x
unset
```

The second result is the one in question.



Comments:
--------------------------------------------------------------------------------

On 2013-03-27T17:54:19Z, dockimbel, commented:
<https://github.com/red/red/issues/451#issuecomment-15540520>

    Closing this ticket, as it is exactly the same issue as #449.

