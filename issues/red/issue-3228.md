
#3228: integer overflow in PAIR!
================================================================================
Issue is open, was reported by 9214 and has 6 comment(s).
[status.deferred]
<https://github.com/red/red/issues/3228>

### Expected behavior
Either meaningful error message or casting of element(s) to `float!` (once `float!` is supported in `pair!`s of course).
### Actual behavior
```Red
>> 123123123123x123123123123
== -2147483648x-2147483648
```
### Steps to reproduce the problem
See above.
### Red version and build date, operating system with version.
```Red
>> about
Red for Windows version 0.6.3 built 19-Feb-2018/13:19:23+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-09T17:12:23Z, dockimbel, commented:
<https://github.com/red/red/issues/3228#issuecomment-371878280>

    This is expected behavior, as `pair!` datatype is unfinished, `float!` support for it is pending.

--------------------------------------------------------------------------------

On 2024-03-30T12:57:33Z, 9214, commented:
<https://github.com/red/red/issues/3228#issuecomment-2028045946>

    Promotion of overflowed `pair!` to `point2D!` kinda makes sense, and is in line with `integer!` treatment:
    
    ```red
    >> 123123123123x123123123123
    == 0x0
    >> (123123123123, 123123123123)
    == (1.231231e11, 1.231231e11)
    >> 123123123123
    == 123123123123.0
    ```
    ```red
    Red 0.6.5 for Windows built 28-Mar-2024/15:41:54+05:00  commit #b301d7b
    ```

--------------------------------------------------------------------------------

On 2024-03-30T18:44:03Z, greggirwin, commented:
<https://github.com/red/red/issues/3228#issuecomment-2028439334>

    I agree with "kinda makes sense". I'm not 100% sure though. A key aspect being that the literal form is quite different in case you serialize it. More importantly, we need to decide what pair's use cases are, and if numbers that large make any sense for them. We can always argue that they are a 2-scalar value that is entirely general, but I don't love that either.

