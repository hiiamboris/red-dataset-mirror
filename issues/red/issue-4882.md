
#4882: ROUND overflows with /to integer on some ranges
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug] [type.review]
<https://github.com/red/red/issues/4882>

**Describe the bug**
```
>> repeat i 20 [x: 10 ** i - 1 print [pad x 20 "->" round/to x 1]]
9                    -> 9
99                   -> 99
999                  -> 999
9999                 -> 9999
99999                -> 99999
999999               -> 999999
9999999              -> 9999999
99999999             -> 99999999
999999999            -> 999999999
9999999999.0         -> -2147483648
99999999999.0        -> -2147483648
999999999999.0       -> -2147483648
9999999999999.0      -> -2147483648
99999999999999.0     -> -2147483648
999999999999999.0    -> -2147483648
1.0e16               -> 1.0e16
1.0e17               -> 1.0e17
1.0e18               -> 1.0e18
1.0e19               -> 1.0e19
1.0e20               -> 1.0e20
```
Gives the same `MIN_INT` result for negative `x`s, and for float `x`s.

**Expected behavior**
```
9999999999.0         -> 9999999999.0
99999999999.0        -> 99999999999.0
999999999999.0       -> 999999999999.0
9999999999999.0      -> 9999999999999.0
99999999999999.0     -> 99999999999999.0
999999999999999.0    -> 999999999999999.0
```

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-23T12:55:44Z, qtxie, commented:
<https://github.com/red/red/issues/4882#issuecomment-825638990>

    ```
    REFINEMENTS:
         /to          => Return the nearest multiple of the scale parameter.
            scale        [number! money! time!] "Must be a non-zero value."
    ```
    The return value‘s type is the same as the `scale`. That's why it's overflowed.
    
    In Rebol2:
    ```
    >> round/to 9999999999999.0 1
    ** Math Error: Math or number overflow
    ** Where: throw-on-error
    ** Near: round/to 9999999999999.0 1
    ```

--------------------------------------------------------------------------------

On 2021-04-23T13:29:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4882#issuecomment-825659113>

    Most math functions silently promote int to float when this happens.

--------------------------------------------------------------------------------

On 2021-08-16T23:00:02Z, greggirwin, commented:
<https://github.com/red/red/issues/4882#issuecomment-899871135>

    Certainly it should never return bogus results. This leads back to https://github.com/red/red/issues/4462 on what to return. Integers are friendly for "human range" values, even if `repeat` and `loop` support floats now. But it _is_ also lossy from an information perspective. While I like the integer result based on my personal experience, I also prefer being less lossy when it's a gray area (and the lossiness here is really an implementation detail, which wouldn't exist if there was only one numeric type for everything; shades of gray areas). The question here is whether it's better to promote the result which changes what you get based on the value. That certainly seems the most useful behavior, and is easy enough to explain and reason about. 
    

