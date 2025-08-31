
#1789: Error with ** exponent operator
================================================================================
Issue is closed, was reported by Bitsoma and has 2 comment(s).
[type.review] [status.wontfix]
<https://github.com/red/red/issues/1789>

On the Red 0.6.0 console
10 *\* 10 you get 1410065408 as a result.
10 *\* 9 is correct
But every exponent above produces wrong values.



Comments:
--------------------------------------------------------------------------------

On 2016-04-21T16:23:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1789#issuecomment-212994105>

    Integer math operations are limited to 32-bit representation. 10^9 fits, 10^10 does not. As we don't have yet automatic promotion of number types to larger representation (like integer to float), you end up with wrong values. That is a temporary situation, such upgrading to larger type is scheduled for one of 0.6.x releases.
    
    Notice that using a float value will give you the expected result:
    
    ```
    red>> 10.0 ** 10
    == 10000000000.0
    ```

