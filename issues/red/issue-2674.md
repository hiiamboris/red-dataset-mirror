
#2674: function MOD does not work for pairs tuples and vectors
================================================================================
Issue is open, was reported by meijeru and has 0 comment(s).
[type.wish]
<https://github.com/red/red/issues/2674>

```
>> source mod
mod: func [
    "Compute a nonnegative remainder of A divided by B" 
    a [number! char! pair! tuple! vector! time!] 
    b [number! char! pair! tuple! vector! time!] "Must be nonzero" 
    return: [number! char! pair! tuple! vector! time!] 
    /local r
][
    if (r: a % b) < 0 [r: r + b] 
    a: absolute a 
    either all [a + r = (a + b) r + r - b > 0] [r - b] [r]
]
```
The code will always raise an error at the first comparison of a pair tuple or vector `< 0` since this is forbidden. Therefore, the  arguments and result of `mod` are best restricted to `number! char! time!`.
The same goes for `modulo` which is a wrapper for `mod`.



