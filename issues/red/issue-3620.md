
#3620: [R/S] Add the result of integer div and the result of EITHER, will get incorrect value
================================================================================
Issue is closed, was reported by bitbegin and has 18 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/3620>

**Describe the bug**

```
Red/System []

size: 1 / 1 + either 0 <> 0 [1][0]
print-line size

```

the `size` should be `1`, but i get `1703785`

**To Reproduce**

compile and run the above sample code

**Expected behavior**

the `size` should be `1`


**Platform version(please complete the following information):**
```
Red 0.6.4 for Windows built 28-Nov-2018/9:34:42+08:00 commit #d463f89
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-30T07:32:19Z, bitbegin, commented:
<https://github.com/red/red/issues/3620#issuecomment-443116910>

    ```
    Red/System []
    
    size: 1 * 1 + either 0 <> 0 [1][0]
    print-line size
    ```
    
    this sample also failed.

--------------------------------------------------------------------------------

On 2018-11-30T07:33:40Z, bitbegin, commented:
<https://github.com/red/red/issues/3620#issuecomment-443117171>

    other one:
    
    ```
    Red/System []
    
    size: 1 * 1 <> either 1 <> 0 [1][0]
    print-line size
    
    ```

--------------------------------------------------------------------------------

On 2018-11-30T09:33:56Z, qtxie, commented:
<https://github.com/red/red/issues/3620#issuecomment-443145788>

    Inline `either` in math expression is not supported in R/S. 

--------------------------------------------------------------------------------

On 2018-11-30T09:45:01Z, bitbegin, commented:
<https://github.com/red/red/issues/3620#issuecomment-443148802>

    but,
    
    ```
    Red/System []
    
    size: 1 + either 0 <> 0 [1][0]
    print-line size
    
    size: 1 <> either 0 <> 0 [1][0]
    print-line size
    
    ```
    work right.

--------------------------------------------------------------------------------

On 2018-11-30T09:53:45Z, meijeru, commented:
<https://github.com/red/red/issues/3620#issuecomment-443151200>

    In the Red/System specification, section 5.1, there is an example:
    `b: 1 + (2 * a - either zero? a [0][a + 100])`
    Is this not supported?!?

--------------------------------------------------------------------------------

On 2018-11-30T10:22:38Z, qtxie, commented:
<https://github.com/red/red/issues/3620#issuecomment-443159087>

    Ok. I have been known this issue since 3 years ago. That's why I thought it's unsupported. 😅

--------------------------------------------------------------------------------

On 2018-11-30T10:49:54Z, meijeru, commented:
<https://github.com/red/red/issues/3620#issuecomment-443166255>

    It may be that it _should_ be supported, but that there is sometimes a problem in code generation. Then it is a genuine issue. _Or_, the example is not appropriate, and it is not supported, then the issue can be dismissed. Only @dockimbel can tell, I think. But he seems to be very busy...

--------------------------------------------------------------------------------

On 2018-11-30T11:21:44Z, qtxie, commented:
<https://github.com/red/red/issues/3620#issuecomment-443174332>

    FYI: duplicated issue #1096.

--------------------------------------------------------------------------------

On 2022-09-05T19:49:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3620#issuecomment-1237420685>

    The compiler will now throw an error when `either` is used nested in such expressions. Using `either` after an assignment is still supported though. The main reason for not supporting it is that it would require deep changes in the compiler and its backend, which is not worth doing now. The new toolchain though should support it, or an alternative ternary operator.

