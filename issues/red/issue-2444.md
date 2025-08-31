
#2444: It is not possible to use multiple zeros in exponent
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2444>

Rebol:

```
>> 1e0002
== 100.0
```

Red:

```
c> 1e0002
*** Syntax Error: invalid float! at "1e0002"
*** Where: do
```


Comments:
--------------------------------------------------------------------------------

On 2017-02-20T08:46:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2444#issuecomment-281019573>

    Rebol supports an arbitrary number of zeros in front of the exponent, Red does not. Rebol might just be re-using the lexer rule for parsing numbers, which accepts arbitrary number of leading zeros. For an exponent value, which follows the `e` or `E` character, I do not see any reason why leading zeros should be accepted, beyond the 4 digits allowed for IEEE754 format. For example, this is allowed:
    ```
    red>> 1e003
    == 1000.0
    ```

