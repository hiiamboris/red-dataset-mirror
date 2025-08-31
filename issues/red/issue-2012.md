
#2012: Inconsistent behaviour of ROUND for time! values
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2012>

Type `time!` is derived from `float!` and inherits all arithmetic operations from it. Apart from worries whether some of these make sense (multiplying time by time, for instance), there is a strange behaviour of `round`.

```
red>> t: random 0:0:1
== 0:00:00.6006634899418164
red>> round t
== 0:00:00.60066349
red>> t: random 1.0
== 0.6089340274263797
red>> round t
== 1.0
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-14T08:22:23Z, meijeru, commented:
<https://github.com/red/red/issues/2012#issuecomment-225812273>

    Perhaps the behaviour of `random` should also be reviewed. Rebol 2 and 3 restrict randomizing to whole seconds only, so `random 0:0:1` is simply `0:0:1`.

--------------------------------------------------------------------------------

On 2016-06-14T09:37:25Z, iArnold, commented:
<https://github.com/red/red/issues/2012#issuecomment-225830061>

    And random 0:1:0 returns a number of seconds including 0:1:0 itself. (There is an error in Rebol 2&3 that makes it return 0:01 in that case instead of 0:01:00)

--------------------------------------------------------------------------------

On 2016-06-15T10:15:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2012#issuecomment-226146223>

    We keep `random` as is for now, users can `round` the result if required. We'll see which behavior is most useful in practice.

