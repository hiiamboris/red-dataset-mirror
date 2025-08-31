
#1251: MAKE/TO error messages inconsistent
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1251>

At the moment, MAKE and TO share the same error messages. But there are already cases where this is inappropriate:

```
red>> to logic! 0
*** Script error: cannot MAKE/TO logic from: 0
*** Where: to
red>> make logic! 0
== false
```

Contrary to what it says in the error message, one **can** MAKE a logic value from 0.



Comments:
--------------------------------------------------------------------------------

On 2015-07-24T11:33:09Z, meijeru, commented:
<https://github.com/red/red/issues/1251#issuecomment-124493102>

    The issue can be closed.

