
#2184: Tests float-divide 37, 38, 47, & 48 fail on Windows.
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2184>

Tests float-divide 37, 38, 47, & 48 fail on Windows but pass on Linux and OS X.



Comments:
--------------------------------------------------------------------------------

On 2018-12-04T19:06:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/2184#issuecomment-444219348>

    The tests are totally wrong:
    `2.2250738585072014e-308 / 1.1` is `2,022794416824728(54)` = `2,022794416824728545454545454.......e-308`
    Can't blame FPU for being more precise than we expect it to:
    ```
    >> 2.022794416824728e-308 == (2.2250738585072014e-308 / 1.1)
    == false
    >> 2.0227944168247285e-308 == (2.2250738585072014e-308 / 1.1)
    == true
    ```
    Same for the other tests mentioned. To fix these an extra digit should be provided.

