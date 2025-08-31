
#3303: DOC: Red/System type-casting matrix needs more explanation for integer <-> float
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [type.documentation]
<https://github.com/red/red/issues/3303>

For conversion from `float!` and `float32!` to `integer!`, the entries say `to integer!`. Probably this implies truncation (rounding to the nearest integer), but it is not clear what happens to negative numbers. For conversion from `integer!` to `float!` and `float32`, the entries say `as float!` and `as float32!`. That this implies a change in bit pattern is not explicit, since the word `as` is also used for "conversions" that leave the bit pattern untouched. 


