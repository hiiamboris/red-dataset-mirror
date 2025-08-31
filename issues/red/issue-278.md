
#278: Checking for type-casting in Red-System does not seem to work as described
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/278>

Hello! I am back and following the exciting new developments. Trying to update my BNF grammar for Red-System. Saw the following:
(1) the type-casting matrix as documented in 4.9 suggests a Warning when casting to the identical type. Not so!
(2) the same suggests an error when casting floats and pointer types to byte!. Not so!
(3) as integer! 1.0 yields 0, likewise as logic!  1.0 yields true

I provoke these results by compiling

```
print as integer! 1.0
```

etc. I hope this does not cloud the test...



Comments:
--------------------------------------------------------------------------------

On 2012-10-29T15:19:24Z, dockimbel, commented:
<https://github.com/red/red/issues/278#issuecomment-9870584>

    Glad to see you back! Thanks for reporting those issues, I will give them a look later today.

--------------------------------------------------------------------------------

On 2012-10-29T23:07:17Z, dockimbel, commented:
<https://github.com/red/red/issues/278#issuecomment-9889260>

    How do you conclude (1) from that example code? I guess for (1), it would be rather `print as integer! 1` which does compile silently (no warning).

--------------------------------------------------------------------------------

On 2012-10-29T23:28:30Z, PeterWAWood, commented:
<https://github.com/red/red/issues/278#issuecomment-9889811>

    I have added some tests to cast-test.r which hopefully cover all the cases that Rudolf kindly reported.
    
    Rudolf would you mind providing an example of when casting a pointer type to byte! did not result in an error. I'm asking because the following tests that I ran passed:
    
    ``` rebol
            --test-- "cast byte! error 5"
        --compile-this {
            cfe5-byte: as byte! "a pointer"
        }
        --assert-msg? "type casting from c-string! to byte! is not allowed"
    
        --test-- "cast byte! error 6"
        --compile-this {
          cfe6-pointer: declare pointer! [integer!]
            cfe6-byte: as byte! cfe6-pointer
        }
        --assert-msg? "type casting from pointer! to byte! is not allowed"
    ```

--------------------------------------------------------------------------------

On 2012-10-30T08:52:34Z, meijeru, commented:
<https://github.com/red/red/issues/278#issuecomment-9898292>

    The cases reported under (1) were indeed tested with `print as integer! 1` etc. and the warning is not produced (I also checked there is no code in the compiler to do that).
    The cases under (2) were tested with `print as byte! "abc"` etc. and there is no error produced. Your tests ran with an assignment rather than a function argument passing.
    The cases under (3) are just curious. I suspect that instead of raising an error, the compiler makes code accessing the lower 32 bits. 

--------------------------------------------------------------------------------

On 2012-10-30T13:18:42Z, PeterWAWood, commented:
<https://github.com/red/red/issues/278#issuecomment-9905128>

    Thanks for the clarification Rudolf. I have now added tests which exactly match your findings.

