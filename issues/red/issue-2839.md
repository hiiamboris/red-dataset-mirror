
#2839: HELP issue with image! values in objects
================================================================================
Issue is closed, was reported by dockimbel and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/2839>

```
>> obj: object [i: make image! 10x10]
== make object! [
    i: make image! [10x10 #{
FFFFFFFFFFFFFFFFFFFFFFFFFF
>> help obj
     i  image!        ["size:" 10x10]
```
The last column should print `size: 10x10` instead of a block. This looks like a missing `rejoin` call.


Comments:
--------------------------------------------------------------------------------

On 2017-06-27T10:26:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2839#issuecomment-311318127>

    Additionally, `mold` on images does not seem to honor the indentation.

--------------------------------------------------------------------------------

On 2017-06-27T12:18:10Z, greggirwin, commented:
<https://github.com/red/red/issues/2839#issuecomment-311340733>

    Indeed, looks like a missing `form`. Good catch.

--------------------------------------------------------------------------------

On 2017-06-27T16:06:42Z, greggirwin, commented:
<https://github.com/red/red/issues/2839#issuecomment-311405996>

    https://github.com/red/red/pull/2840

