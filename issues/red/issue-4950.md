
#4950: Division by negative zero isn't handled correctly
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4950>

**Describe the bug**

See https://stackoverflow.com/questions/5095968/does-float-have-a-negative-zero-0f for the description of this edge case.

*R/S:*
```
Red/System [] probe 1.0 / -0.0
```
Output:
```
-1.#INF
```

*Red:*
```
>> 1.0 / -0.0
== 1.#INF
>> atan2 0.0 -0.0
== 3.141592653589793
>> atan2 -0.0 -0.0
== -3.141592653589793
>> -0.0 == 0.0
== true
>> -0.0 =? 0.0
== false
```

**Expected behavior**

All is correct except `1.#INF` result. Should be negative infinity.

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



Comments:
--------------------------------------------------------------------------------

On 2021-08-16T12:58:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4950#issuecomment-899488842>

    Proposed tests:
    
    ```
    ;-- most of these are taken from from https://en.wikipedia.org/wiki/Signed_zero#Arithmetic
    --assert         0.0 == -0.0
    --assert        -0.0 ==  0.0
    --assert not     0.0 =? -0.0
    --assert not    -0.0 =?  0.0
    --assert  1.0 *  0.0 =?  0.0
    --assert -1.0 *  0.0 =? -0.0
    
    --assert -0.0 *  1.0 =? -0.0
    --assert -0.0 /  1.0 =? -0.0
    --assert -0.0 * -0.0 =?  0.0
    
    --assert  1.0 +  0.0 =?  1.0
    --assert  1.0 + -0.0 =?  1.0
    --assert -0.0 + -0.0 =? -0.0
    --assert -0.0 +  0.0 =? -0.0		;) FAILS
    --assert  0.0 +  0.0 =?  0.0
    --assert  0.0 + -0.0 =?  0.0
    ; --assert  1.0 -  1.0 =?  0.0		;) depends on rounding mode, shouldn't be tested
    ; --assert  1.0 + -1.0 =?  0.0		;) depends on rounding mode, shouldn't be tested
    
    --assert  0.0 =? absolute -0.0
    --assert -0.0 =? sqrt     -0.0
    --assert -0.0 / -1.#INF =? 0.0
    --assert  1.0 / -0.0 =? -1.#INF		;) FAILS
    --assert  nan?  0.0 * -1.#INF
    --assert  nan? -0.0 * -1.#INF
    --assert  nan?  0.0 * -1.#INF
    --assert  nan? -0.0 * -1.#INF
    --assert  nan?  0.0 /  0.0
    --assert  nan? -0.0 /  0.0
    --assert  nan?  0.0 / -0.0
    --assert  nan? -0.0 / -0.0
    
    --assert pi         =? atan2  0.0 -0.0
    --assert (0.0 - pi) =? atan2 -0.0 -0.0
    ```

--------------------------------------------------------------------------------

On 2021-08-22T07:17:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4950#issuecomment-903225547>

    @qtxie I provided tests in hopes you'll include them, not just ignore ;)

--------------------------------------------------------------------------------

On 2021-08-23T00:00:47Z, qtxie, commented:
<https://github.com/red/red/issues/4950#issuecomment-903351991>

    @hiiamboris Thanks. Some of them in the list are already in the test suite. I'll add more from your list.

--------------------------------------------------------------------------------

On 2021-08-23T00:03:06Z, qtxie, commented:
<https://github.com/red/red/issues/4950#issuecomment-903352568>

    ```
    --assert -0.0 +  0.0 =? -0.0
    --assert  0.0 + -0.0 =?  0.0
    ```
    I don't see why those two should produce different results.

--------------------------------------------------------------------------------

On 2021-08-23T06:59:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4950#issuecomment-903495378>

    For symmetry. Or else they're both positive or both negative.
    Anyway, if I understood https://en.wikipedia.org/wiki/Signed_zero#Arithmetic correctly, these are IEEE754 recommendations.

