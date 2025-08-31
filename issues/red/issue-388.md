
#388: type? lit-word! inconsistent between compiler and interpreter
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/388>

red>> type? 'a
== lit-word!

```
Red []

probe type? 'a
```

word!

REBOL:

> > type? 'a
> > == word!



Comments:
--------------------------------------------------------------------------------

On 2013-01-22T23:12:38Z, dockimbel, commented:
<https://github.com/red/red/issues/388#issuecomment-12572428>

    Agreed.

