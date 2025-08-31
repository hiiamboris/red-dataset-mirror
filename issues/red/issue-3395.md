
#3395: max and min are not compatible with > and <
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3395>

### Expected behavior

for all `p` and `q` for which `>, >=, <, <=` are defined, it should hold that 
if `p >= q` then `(max p q) = p` and analogous for `min`
### Actual behavior

with tuples at least, this is not the case:
`1.2.3.4 >= 1.2.3` but `max 1.2.3 1.2.3.4` yields an error

### Steps to reproduce the problem

execute above example codes
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-21T20:46:02Z, meijeru, commented:
<https://github.com/red/red/issues/3395#issuecomment-390777178>

    See also this red/bugs discussion:  [May 21, 2018 9:58 PM](https://gitter.im/red/bugs?at=5b0324eb2df44c2d0646d0f4)

--------------------------------------------------------------------------------

On 2018-06-22T03:31:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3395#issuecomment-399310317>

    For pairs, it's not hard to see how the behavior could make some things easier, but I agree that consistency should win here, and helper funcs could take the place of it. The strongest argument against that is performance, which could be important in GUI and drawing scenarios.

--------------------------------------------------------------------------------

On 2018-06-22T03:36:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3395#issuecomment-399310987>

    @dockimbel needs to weigh in on this, as it's not behavior from R2 on tuples, and it's not a default. It was explicitly written to do this, so we need the design intent there.

--------------------------------------------------------------------------------

On 2019-08-20T19:37:37Z, dockimbel, commented:
<https://github.com/red/red/issues/3395#issuecomment-523163841>

    @greggirwin Looks like R2 implements `min/max` in a way consistent with comparisons for tuples.

