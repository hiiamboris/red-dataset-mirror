
#216: Float math problem
================================================================================
Issue is closed, was reported by nicolas42 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/216>

red/system []

i: 2.0
print i / (i - 1.0) 

output
0.5

REBOL/Core 2.7.8.3.1 (1-Jan-2011)
dockimbel-Red-4d39557

-= Red/System Compiler =-
Compiling tests/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
Script: "Red/System PE/COFF format emitter" (none)

...compilation time:     361 ms
...linking time:         19 ms
...output file size:     5632 bytes
0.5== 0




Comments:
--------------------------------------------------------------------------------

On 2012-03-20T15:20:01Z, dockimbel, commented:
<https://github.com/red/red/issues/216#issuecomment-4597627>

    Issue is probably caused by `print` function, the calculation should be correct.

--------------------------------------------------------------------------------

On 2012-03-20T22:23:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/216#issuecomment-4606842>

    I don't think it is a print problem, the error appears to be in the calculation:
    
    Code
    
    ``` rebol
    
    
    Red/System []
    
    print ["declarations" lf]
    
    
    print ["started" lf]
    
    i: 2.0
    i: i / (i - 1.0)
    print i
    print lf
    
    j: 2.0
    k: j - 1.0
    l: j / k
    print [l lf]
    
    
    print ["finished" lf]
    
    ```
    
    Output
    
    ```
    
    declarations
    started
    0.5
    2
    finished
    
    ```
    
    I get the same behaviour with Float32.
    
    I will add this calculation to both float-test and float32-test.

