
#2624: pick <time> with non-integer index crashes
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2624>

The out-of-range test is guaranteed to fail, since it uses `all` instead of `any` 😸 . Therefore the next line is taken and this causes a crash. See `%time.reds` at lines 356-357
```
if all [index < 1 index > 3][fire [TO_ERROR(script out-of-range) boxed]]
push-field tm index
```



Comments:
--------------------------------------------------------------------------------

On 2017-04-24T00:39:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2624#issuecomment-296500878>

    Thanks for the analysis!

