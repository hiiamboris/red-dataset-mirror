
#3681: REPEND forces a /ONLY mode on path series.
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3681>

Fron [Gabriele's comment on #3340](https://github.com/red/red/issues/3340#issuecomment-416622099):
```
>> p: make path! [a b]
== a/b
>> append p 1
== a/b/1
>> append p [2 3]
== a/b/1/2/3
>> repend p [2 3]
== a/b/1/2/3/[2 3]
```

Is there any good reason for the `not block? series` check in `repend`?


Comments:
--------------------------------------------------------------------------------

On 2018-12-26T05:15:26Z, dockimbel, commented:
<https://github.com/red/red/issues/3681#issuecomment-449905312>

    No good reason.

