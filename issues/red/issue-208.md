
#208: Casting more than one doubly past float! argument to float32! corrupts function arguments
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/208>

```
test: function [
    a   [float!]
    b   [float!]
][
    print-wide [a b lf]
    print-wide [as-float32 a  as-float32 b  lf]
]
print-wide [as-float32 0.0  as-float32 1.0  lf]
test 0.0 1.0
```

0 1 
0 1 
0 00000004 00000000



Comments:
--------------------------------------------------------------------------------

On 2012-02-26T22:39:52Z, dockimbel, commented:
<https://github.com/red/red/issues/208#issuecomment-4185268>

    On which branch? Master or libc-init?

--------------------------------------------------------------------------------

On 2012-02-26T23:27:46Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/208#issuecomment-4185745>

    Both. I got an earlier error on faster-floats so I switched back to master.

--------------------------------------------------------------------------------

On 2012-02-27T05:40:26Z, PeterWAWood, commented:
<https://github.com/red/red/issues/208#issuecomment-4188320>

    When looking into Kaj's issue I found that printing a float! or float32! results in a segfault on Darwin. I've added a couple of trivial float tests to print-test.r. I will commit them to github later today as I'm trapped behind a firewall at the moment.
    
    Master branch.

--------------------------------------------------------------------------------

On 2012-02-27T05:47:36Z, PeterWAWood, commented:
<https://github.com/red/red/issues/208#issuecomment-4188376>

    I found no problem casting two float!s to float-32! arguments with fixed arity functions:
    
    Code
    
    ``` rebol
    
    Red/System []
    
    print ["declarations" lf]
    
    myfunc: function [
            a   [float32!]
            b   [float32!]
            return: [float32!]
        ][
          a + b
        ]
    
    print ["started" lf]
    
    y: myfunc as-float32 1.0 as-float32 2.0
    
    if y =  as-float32 3.0 [print ["ok" lf]]
    
    print ["finished" lf]
    
    ```
    
    Output:
    
    ```
    declarations
    started
    ok
    finished
    
    ```

--------------------------------------------------------------------------------

On 2012-02-27T06:02:29Z, PeterWAWood, commented:
<https://github.com/red/red/issues/208#issuecomment-4188471>

    The problem does seem to exist with typed functions. I've added a couple of tests to float-test.reds and float32-test.reds similar to this example. both currently fall on the master branch.
    
    Code
    
    ``` rebol
    
    
    Red/System []
    
    print ["declarations" lf]
    
    myfunc: function [
        [typed]
        count [integer!]
        list [typed-value!]
            return: [float32!]
            /local
              a [float32!]
              b [float32!]
        ][
         a: as float32! list/value
         list: list + 1
         b: as float32! list/value
         a + b
        ]
    
    print ["started" lf]
    
    y: myfunc as-float32 1.0 as-float32 2.0
    
    if y =  as-float32 3.0 [print ["3.0" lf]]
    if y <  as-float32 3.0 [print ["< 3.0" lf]]
    if y >  as-float32 3.0 [print ["> 3.0" lf]]
    
    print ["finished" lf]
    
    ```
    
    Output
    
    ```
    declarations
    started
    < 3.0
    finished
    
    ```

--------------------------------------------------------------------------------

On 2012-02-27T15:06:46Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/208#issuecomment-4195052>

    faster-floats crashes immediately on this issue:
    
    **\* Runtime Error 9: float invalid operation
    **\* at: 08048441h

--------------------------------------------------------------------------------

On 2012-02-28T23:14:32Z, dockimbel, commented:
<https://github.com/red/red/issues/208#issuecomment-4228059>

    Peter, the issue with typed function is unrelated to this one. Please open a new ticket for that.

