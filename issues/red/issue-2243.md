
#2243: POWER does not promote to float!
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2243>

red>> 999 *\* 999
== 933064983

R3 and R2 would raise an overflow error. Red (probably) should return a 1.#inf



Comments:
--------------------------------------------------------------------------------

On 2017-02-18T15:45:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2243#issuecomment-280853529>

    POWER will now promote its result to float if overflowing integer.

