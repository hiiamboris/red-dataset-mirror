
#10: WISH: generalisation of operations on numbers
================================================================================
Issue is open, was reported by meijeru and has 6 comment(s).
[Wish]
<https://github.com/red/REP/issues/10>

This is based in the following Red issues, now closed: red/red#1262, red/red#1263, red/red#1267 and red/red#1956.

Applicability is desired of
`round` on vectors of numbers, on pairs and on tuples
`complement` on vectors of integers, on pairs and on tuples
`absolute` on  vectors of numbers
`negate` on vectors of numbers

Numbers to be undestood as integers, floats and percent values.
The applicability on pairs is also desired when pairs will admit floats in addition to integers.
In all cases the application should take place element by element.
The applicability on tuples is of course limited by the range 0..255 per element.


Comments:
--------------------------------------------------------------------------------

On 2020-07-18T15:29:11Z, hiiamboris, commented:
<https://github.com/red/REP/issues/10#issuecomment-660499053>

    Regarding all mentioned ops except `complement` (which is binary by nature), there's a chance of overflow:
    ```
    >> absolute -2147483648
    *** Math Error: math or number overflow
    *** Where: absolute
    *** Stack:  
    
    >> negate -2147483648
    *** Math Error: math or number overflow
    *** Where: negate
    *** Stack:  
    
    >> round/to 2147483647 10
    *** Math Error: math or number overflow
    *** Where: round
    *** Stack:  
    
    >> round/to -2147483648 5
    == -2147483648
    >> round/to -2147483648 10
    == -2147483648
    >> round/to -2147483647 10
    *** Math Error: math or number overflow
    *** Where: round
    *** Stack:  
    ```
    As you can see, even with integers it's a bit weird and should be addressed at some point.
    But what about vectors? Do we just silently allow overflows in vectors? Obviously, in the current design, where vector is not copied, we can't throw an error, or we leave the vector in an inconsistent state: some of the items were modified, some were not. That's one more argument against the current vector design.
    
    By the way I don't see *non-copying* vector as a real optimization. How complex is allocation of a vector buffer (without zero-filling it), compared to application of a function over all of it's elements? I'd say negligible. What performance difference does it make to arithmetics if result is saved in place or into another buffer? Probably some cache size-related difference noticeable on the lowest level (one we're very far from).
    
    And what should ideally happen if you apply a series of copying operations on a single vector? (1) You allocate a new buffer, that is a target of all operations and one you return. After this (2) old buffer becomes unused. Next operation will likely target it and (3) no allocation should be needed at all for the next operation. Two buffers should just play ping pong with each other. This is what Red should do on it's allocator's level, not something each user should concern himself with.

--------------------------------------------------------------------------------

On 2020-07-18T23:10:20Z, greggirwin, commented:
<https://github.com/red/REP/issues/10#issuecomment-660555510>

    Inconsistent state on errors is something I hadn't thought of. Good catch.

--------------------------------------------------------------------------------

On 2022-09-10T16:47:54Z, hiiamboris, commented:
<https://github.com/red/REP/issues/10#issuecomment-1242765825>

    min/max also wanted for vectors (and this will make `clip` work on them)

