
#3441: TANGENT 90 should return infinity instead of overflow error
================================================================================
Issue is closed, was reported by Oldes and has 16 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3441>

### Expected behavior
```
>> tangent 90
== 1.#INF
>> tangent -90
== -1.#INF
>> tangent/radians (pi / 2)
== 1.#INF
```
### Actual behavior
```
>> tangent/radians (pi / 2)
*** Math Error: math or number overflow
*** Where: tangent
*** Stack:  
```



Comments:
--------------------------------------------------------------------------------

On 2018-06-25T01:31:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3441#issuecomment-399806491>

    Since the result is really "undefined", why should it return 1.#INF instead of throwing an error? Not disagreeing with the change, just trying to make sure we know why we're making it.

--------------------------------------------------------------------------------

On 2018-06-25T05:07:58Z, Oldes, commented:
<https://github.com/red/red/issues/3441#issuecomment-399832740>

    Maybe for the same reason why `1.0 / 0.0` is not throwing the error too.

--------------------------------------------------------------------------------

On 2018-06-25T13:31:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/3441#issuecomment-399952467>

    @greggirwin good point, should be 1.#NAN not 1.#INF since the limit of tan depends on where you approach the 90 from.

--------------------------------------------------------------------------------

On 2018-06-25T13:43:04Z, Oldes, commented:
<https://github.com/red/red/issues/3441#issuecomment-399956209>

    `1.#NaN` is no useful at all as it would break computations. If you don't like infinities, you may have what C's `tan` function gives you or some large enough numbers...btw.. this is from Lua:
    ```
    > math.tan(math.pi/2)
    1.6331239353195e+016
    > math.tan(-math.pi/2)
    -1.6331239353195e+016
    ``` 

--------------------------------------------------------------------------------

On 2018-06-25T13:46:48Z, Oldes, commented:
<https://github.com/red/red/issues/3441#issuecomment-399957356>

    According: https://math.stackexchange.com/a/189626
    _where we are motivated by the continuity of the tangent function on (−π/2,π/2), we may let tan(±π/2)=±∞ so that it is extended to a 1-1 well-behaving mapping between [−π/2,π/2] and the extended real line [−∞,∞]_

--------------------------------------------------------------------------------

On 2018-06-25T13:56:22Z, Oldes, commented:
<https://github.com/red/red/issues/3441#issuecomment-399960606>

    Which result you prefer in this case:
    ```
    >> arctangent/radians 1.#INF
    == 1.5707963267948966
    >> (pi / 2) = arctangent/radians 1.#INF
    == true
    ```
    versus
    ```
    >> arctangent/radians 1.#NaN
    == 1.#NaN
    >> (pi / 2) = arctangent/radians 1.#NaN
    == false
    ```
    And using the Lua's number:
    ```
    >> (pi / 2) = arctangent/radians 1.6331239353195e+016
    == true
    ```

--------------------------------------------------------------------------------

On 2018-06-25T14:12:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/3441#issuecomment-399966247>

    Yes I too find infinity more useful, albeit mathematically incorrect. The main point to have it is to have `x = tangent atan x` where you have series of trigonometric computations. Considering the whole imprecise nature of the floating point it may be useful to extend it to +-infinity like you propose.
    
    But then I don't write trigonometry on a daily basis so I can't be a good judge if it's worth it.

--------------------------------------------------------------------------------

On 2018-06-25T16:36:40Z, greggirwin, commented:
<https://github.com/red/red/issues/3441#issuecomment-400015918>

    1.#INF does seem more useful here. Thanks for the thoughts guys. I'll comment on the PR direction for requested changes, then merge if those are made.

