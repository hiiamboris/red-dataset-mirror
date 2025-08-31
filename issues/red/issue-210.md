
#210: Complex float invalid operation on faster-floats
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/210>

I don't seem to be able to reduce this one further:

```
print [as-float32 0.0  lf]
print-wide [as-float32 0.0  as-float32 1.0  lf]

test: function [
    a       [float!]
    b       [float!]
][
    print-wide [a b lf]
    print-wide [as-float32 a  as-float32 b  lf]
]
print-wide [as-float32 0.0  as-float32 1.0  lf]
test 0.0 1.0
```

0
0 1 
0 1 
0 1 
0 
**\* Runtime Error 9: float invalid operation
**\* at: 08048765h



Comments:
--------------------------------------------------------------------------------

On 2012-02-29T12:25:32Z, dockimbel, commented:
<https://github.com/red/red/issues/210#issuecomment-4236528>

    The crash is caused by return values from `prin-float` and `prin-float32` that are not used, and so accumulate in the x87 stack until exhaustion, causing runtime errors.
    
    Making the compiler smart enough to figure out when the return values are used or not would lead to (probably big) recursive source code static analysis that would be out of the scope of the current Red/System compiler architecture. So the easy fix is to remove return values from `prin-float` and `prin-float32`.
    
    Removing also return values from other `prin-*` function could also be done for sake of consistency.

--------------------------------------------------------------------------------

On 2012-02-29T12:27:17Z, dockimbel, commented:
<https://github.com/red/red/issues/210#issuecomment-4236543>

    A possible internal workaround would be to pass the float return values from functions in CPU registers and move them to FPU if they need to be used.

--------------------------------------------------------------------------------

On 2012-02-29T12:58:06Z, dockimbel, commented:
<https://github.com/red/red/issues/210#issuecomment-4236926>

    I have found a way to avoid the static analysis and discard the return value on FPU stack if not used.

--------------------------------------------------------------------------------

On 2012-02-29T16:34:22Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/210#issuecomment-4241056>

    I see the code got smaller by fixing this bug. :-)

--------------------------------------------------------------------------------

On 2012-02-29T16:37:04Z, dockimbel, commented:
<https://github.com/red/red/issues/210#issuecomment-4241109>

    Some runtime conversions for returned values were moved at the end of the function body rather than after the call site, hence the code reduction.

