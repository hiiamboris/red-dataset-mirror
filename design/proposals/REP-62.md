
#62: WISH: FORM binary! should use ENBASE/BASE 16
================================================================================
Issue is open, was reported by rebolek and has 4 comment(s).
<https://github.com/red/REP/issues/62>

`form` help text says:

> Returns a user-friendly string representation of a value.

However `form` on `binary!` returns molded string:

```
>> form #{deadcafe}
== "#{DEADCAFE}"
```

If you want to have *user-friendly* representation, you need to use `enbase/base 16`:

```
>> enbase/base #{deadcafe}
== "DEADCAFE"
```

It would be nice if `form` switched to this *form* (pun intended).



Comments:
--------------------------------------------------------------------------------

On 2020-01-24T06:39:19Z, 9214, commented:
<https://github.com/red/REP/issues/62#issuecomment-578010651>

    Duplicate of https://github.com/red/red/issues/3133 which is already addressed https://github.com/red/red/pull/4148.

--------------------------------------------------------------------------------

On 2020-01-24T06:41:00Z, rebolek, commented:
<https://github.com/red/REP/issues/62#issuecomment-578010995>

    So let's hope it gets merged soon.

