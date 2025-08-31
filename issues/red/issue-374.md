
#374: Words not recognised as undefined within function
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/374>

Should issue a compile error on FOR, but doesn't:

```
Red []

f: does [
    for i 1 10  1 [
        print i
    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2013-01-24T17:44:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/374#issuecomment-12663395>

    This seems to apply to all undefined words.

--------------------------------------------------------------------------------

On 2013-02-10T11:29:46Z, dockimbel, commented:
<https://github.com/red/red/issues/374#issuecomment-13347575>

    Fixed in `lex-scope` branch.

