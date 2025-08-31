
#2859: make date! has problems (1st installment)
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
<https://github.com/red/red/issues/2859>

```
>> make date! [2017 1 1]
== 1-Jan-2017                        ; OK
>> make date! [2017 12 31]
== 31-Dec-2017                     ; OK
>> make date! [2017 31 12]
== 12-Mar-2017                    ; should error out - result does not make sense
>> make date! [2017 1 32]
== 31-Dec-2016                    ; nonsense
>> make date! [2017 2 29]
== 1-Mar-2017                     ; not nonsense, but is it a bug or a feature?
>> make date! [2017 2 30]
== 2-Mar-2017                     ; same remark
>> make date! [2017 2 31]
== 3-Mar-2017                     ; same remark
>> make date! [2017 2 32] 
== 28-Feb-2017                   ; now it fails!
>> 
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-07T15:45:00Z, ghost, commented:
<https://github.com/red/red/issues/2859#issuecomment-313718567>

    ```
    >> make date! [2017 2 29]
    == 1-Mar-2017                     ; not nonsense, but is it a bug or a feature?
    ```
    My personal inclination would be to consider this a bug. Because at a time, when most newer languages are focusing on "lesser bugs and safe code", edge cases which may cause unexpected behauviour should be avoided by the language.

--------------------------------------------------------------------------------

On 2017-07-08T10:41:15Z, meijeru, commented:
<https://github.com/red/red/issues/2859#issuecomment-313848365>

    Since the latest commits, this is now OK. Overflow cases are now handled, correctly, by `to`.

--------------------------------------------------------------------------------

On 2017-07-08T10:50:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2859#issuecomment-313848760>

    @nc-x
    > when most newer languages are focusing on "lesser bugs and safe code"
    
    Don't blindly buy the slogans, have a deeper look. ;-) For example, have a look at how Rust and Elm 
    languages (do not) deal with division by zero (and other similar cases), silently ignoring it, potentially resulting in catastrophic consequences for the application's data integrity. Programming languages are *always* about trade-offs.

