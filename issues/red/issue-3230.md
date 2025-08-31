
#3230: Typo in description of `arc` shape
================================================================================
Issue is closed, was reported by toomasv and has 4 comment(s).
[type.documentation] [status.contribution]
<https://github.com/red/red/issues/3230>

### Expected behavior
In https://doc.red-lang.org/en/draw.html#_arc, `arc` shape syntax should be:

> `arc <end> <radius-x> <radius-y> <angle> sweep large       (absolute)`
`'arc <end> <radius-x> <radius-y> <angle> sweep large       (relative)`

I.e. `large` in the end.
### Actual behavior
Currently it is:

> `arc <end> <radius-x> <radius-y> <angle> sweep closed       (absolute)`
`'arc <end> <radius-x> <radius-y> <angle> sweep closed       (relative)`

### Steps to reproduce the problem
### Red version and build date, operating system with version.



Comments:
--------------------------------------------------------------------------------

On 2018-03-15T15:40:45Z, 9214, commented:
<https://github.com/red/red/issues/3230#issuecomment-373421240>

    https://github.com/red/docs/pull/39

--------------------------------------------------------------------------------

On 2018-03-15T18:08:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3230#issuecomment-373471883>

    Thanks!

