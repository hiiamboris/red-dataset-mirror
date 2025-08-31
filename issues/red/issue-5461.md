
#5461: [Lexer] Opens paren, closes point
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/5461>

**Describe the bug**

I understand it may be for performance but this quite a gotcha for tracers:
```
>> transcode-trace "(1,2,3)" 
PRESCAN  paren!       1x1          1    "(1,2,3)"
OPEN     paren!       1x1          1    "(1,2,3)"        <- paren was opened
PRESCAN  integer!     2x3          1    ",2,3)"
SCAN     integer!     2x3          1    ",2,3)"
LOAD     integer!     1            1    ",2,3)"
PRESCAN  string!      3x3          1    ",2,3)"
PRESCAN  integer!     4x5          1    ",3)"
SCAN     integer!     4x5          1    ",3)"
LOAD     integer!     2            1    ",3)"
PRESCAN  string!      5x5          1    ",3)"
PRESCAN  integer!     6x7          1    ")"
SCAN     integer!     6x7          1    ")"
LOAD     integer!     3            1    ")"
PRESCAN  paren!       7x7          1    ")"
CLOSE    point2D!     1x7          1    ")"        <- paren was never closed, point was never opened!
== [(1, 2, 3)] 
```
Maybe in tracing mode it should perform heavier prescanning.

Note also that `point2D!` was closed! Not `point3D!`.

**Expected behavior**

Would be great if `open` reported `point3D!` type, and `close` too.

**Platform version**

`Red 0.6.4 for Windows built 30-Dec-2023/17:13:04+03:00  commit #f8f2559`


Comments:
--------------------------------------------------------------------------------

On 2024-01-01T21:08:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/5461#issuecomment-1873480948>

    Another question is, if it's a scalar value, should it even have `open` and `close` events? Seems inconsistent.

--------------------------------------------------------------------------------

On 2024-01-27T13:12:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5461#issuecomment-1913153447>

    > Note also that point2D! was closed! Not point3D!.
    
    Fixed!
    

--------------------------------------------------------------------------------

On 2024-02-07T18:07:11Z, dockimbel, commented:
<https://github.com/red/red/issues/5461#issuecomment-1932602213>

    I have changed the internal implementation for point literals in the runtime lexer, so that it will generate events matching a single value instead of going the road of a paren list with integer/float values. So now it gives:
    
    ```
    >> transcode-trace "(1,2,3)" 
    PRESCAN  point2D!     1x8          1    ""
    SCAN     point3D!     1x8          1    ""
    LOAD     point3D!     (1, 2, 3)    1    ""
    == [(1, 2, 3)]
    ```
    
    Note that `prescan` mode will always return `point2D!` in such case, as it is not performing any component identification nor counting.

