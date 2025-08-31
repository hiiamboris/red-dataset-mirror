
#2015: Power operations on time are flawed
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2015>

```
red>> 2 ** 5
== 32
red>> 16 ** 0.5
== 4.0
red>> 0:0:2 ** 5
== -792695240:286331153:07.378697629483821e19
red>> 0:0:16 ** 0.5
== 0:00:00.0001264911064067352
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-14T08:36:55Z, meijeru, commented:
<https://github.com/red/red/issues/2015#issuecomment-225815569>

    ... or perhaps it is just the `form` or `mold` which is flawed???

--------------------------------------------------------------------------------

On 2016-06-15T06:44:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2015#issuecomment-226101755>

    Power action has been forbidden for time! values. (Same as in Rebol)

