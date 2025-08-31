
#359: empty block returns wrong value in compiler
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/359>

`if true []` should give `unset!`, but it gives `true`

it looks like the compilation of an empty block results in `stack/reset` only



