
#2244: Inconsistent trigonometry with 1.#inf
================================================================================
Issue is closed, was reported by dsunanda and has 6 comment(s).
[status.built] [status.tested] [test.written] [type.task.wish]
<https://github.com/red/red/issues/2244>

sin 1.#inf      ==> 1.#NaN
arcsine 1.#inf  ==> "math or number overflow"
tan 1.#inf      ==> 1.#NaN
arctangent 1.#inf ==> 90.0

Would expect 1.#NaN for the ARCSINE.

No sure best behavior for ARCTANGENT. Technically, 90.0 is right -- but only for certain values of infinity.



Comments:
--------------------------------------------------------------------------------

On 2016-09-29T16:28:24Z, geekyi, commented:
<https://github.com/red/red/issues/2244#issuecomment-250519164>

    Maybe related: #2000
    
    You may also be interested in _REP XXXX Add mathematical and time functions_ in the wiki

--------------------------------------------------------------------------------

On 2017-02-21T03:13:54Z, qtxie, commented:
<https://github.com/red/red/issues/2244#issuecomment-281233811>

    Technically, `sin 1.#inf` should return a range `[-1, 1]`, `arcsine 1.#inf` should return a complex number `(-i)∞`.
    As we granted wish #2000, for consistency, I think we should also return `1.#NaN` for `arcsine 1.#inf`.

--------------------------------------------------------------------------------

On 2017-02-21T05:49:00Z, dockimbel, commented:
<https://github.com/red/red/issues/2244#issuecomment-281251472>

    @qtxie Agreed.

