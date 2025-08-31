
#692: error messages: resolve actions and datatypes to their names 
================================================================================
Issue is closed, was reported by IngoHohmann and has 4 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/692>

Giving action and dataype names in error messages will help in debugging, especially for new users.

```
*** Script error: action 38 not defined for type: 7
```

This would become (just guessing)

```
*** Script error: pick not defined for type: integer!
```

Given that I was using first, it may not be ideal, but maybe better.



Comments:
--------------------------------------------------------------------------------

On 2014-02-21T14:02:44Z, dockimbel, commented:
<https://github.com/red/red/issues/692#issuecomment-35732345>

    Error system is not implemented yet, so all the current errors are simply hardcoded. If this addition is cheap, it will be added, else you will need to wait for the error! datatype to be implemented.

--------------------------------------------------------------------------------

On 2014-04-20T15:52:45Z, dockimbel, commented:
<https://github.com/red/red/issues/692#issuecomment-40897790>

    I am closing this ticket as it requests a feature that is already planned.

