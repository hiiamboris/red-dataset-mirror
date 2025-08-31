
#344: Wrong byte!->logic!->integer! inversion
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/344>

```
Red/System []

b: as-byte 0
print-line as-integer not as-logic b
b: as-byte 1
print-line as-integer not as-logic b
b: as-byte 2
print-line as-integer not as-logic b
```

255
254
254



Comments:
--------------------------------------------------------------------------------

On 2013-01-04T22:57:49Z, dockimbel, commented:
<https://github.com/red/red/issues/344#issuecomment-11903847>

    Actually, the bug comes from `not`.

