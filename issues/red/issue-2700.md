
#2700: mod and modulo give error on char! argument
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2700>

These functions are defined on `char!` arguments, but the function code uses `absolute` which is not defined on `char!` values.


