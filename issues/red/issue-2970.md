
#2970: AS-COLOR not handle negative number properly
================================================================================
Issue is closed, was reported by qtxie and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2970>

Maybe we should give an error on negative number.
```
>> as-color 40 -214 40
== 40.42.255
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-10T14:03:43Z, geekyi, commented:
<https://github.com/red/red/issues/2970#issuecomment-321560490>

    Definitely didn't expect this:
    ```red
    >> as-color -1 10 128
    == 255.255.255
    ```

--------------------------------------------------------------------------------

On 2017-08-11T08:44:32Z, meijeru, commented:
<https://github.com/red/red/issues/2970#issuecomment-321759898>

    I wonder about the different programming of `as-color` and `as-ipv4`:
    ```
    >> source as-color
    ; AS-COLOR is a routine! value; its body is Red/System code.
    as-color: routine [
        r [integer!] 
        g [integer!] 
        b [integer!]
    ][
        arr1: (b % 256 << 16) or (g % 256 << 8) or (r % 256) 
        stack/set-last as red-value! tuple/push 3 arr1 0 0
    ]
    >> source as-ipv4
    ; AS-IPV4 is a routine! value; its body is Red/System code.
    as-ipv4: routine [
        a [integer!] 
        b [integer!] 
        c [integer!] 
        d [integer!]
    ][
        arr1: (d << 24) or (c << 16) or (b << 8) or a 
        stack/set-last as red-value! tuple/push 4 arr1 0 0
    ]
    ```

--------------------------------------------------------------------------------

On 2017-10-11T12:13:34Z, dockimbel, commented:
<https://github.com/red/red/issues/2970#issuecomment-335789757>

    > I wonder about the different programming of as-color and as-ipv4
    
    Color components are often the result of math operations with possible out of range results. In such case, taking the modulo ensures that the value is in range.
    
    For IP addresses, the calculations are most of the time just bitwise operations which don't result in out of range values.

--------------------------------------------------------------------------------

On 2017-10-11T12:19:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2970#issuecomment-335791103>

    Now both `as-color` and `as-ipv4` will return an error if one of the argument is negative.

