
#2831: WISH: REJOIN/ONLY for ignoring NONE values
================================================================================
Issue is closed, was reported by rebolek and has 10 comment(s).
[status.waiting] [type.wish]
<https://github.com/red/red/issues/2831>

Currently, `none` values are added to `rejoin` output:
```
>> rejoin ["abc" if no ["def"]]
== "abcnone"
```
so above code must be written as
```
>> rejoin ["abc" either no ["def"][""]]
== "abc"
```
It would be nice to have `rejoin/only` that would ignore `none` values, so we could write:
```
>> rejoin ["abc" if no ["def"]]
== "abc"
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-23T10:36:29Z, geekyi, commented:
<https://github.com/red/red/issues/2831#issuecomment-310632897>

    I posted my thoughts on https://github.com/red/red/pull/2832#issuecomment-310632547
    **tl;dr**, when would you want `rejoin` to preserve `none` values?

--------------------------------------------------------------------------------

On 2017-06-24T07:16:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2831#issuecomment-310821486>

    `rejoin` is a temporary function, so we need to wait for the string concatenation final API before extending it (in case we keep `rejoin`).

--------------------------------------------------------------------------------

On 2017-06-24T08:31:01Z, rebolek, commented:
<https://github.com/red/red/issues/2831#issuecomment-310825090>

    I see. So the final API should support trimming `none` values :)

--------------------------------------------------------------------------------

On 2017-06-26T09:35:04Z, rebolek, commented:
<https://github.com/red/red/issues/2831#issuecomment-311010569>

    Btw, here is my take on it: https://gist.github.com/rebolek/da7f38e0e7a641000ad70a43660f2abc
    It supports `/trim` refinement for above functionality and also `/with` for adding separator.

--------------------------------------------------------------------------------

On 2018-04-25T06:20:37Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2831#issuecomment-384173088>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

