
#2861: make date! has problems (3rd installment)
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
<https://github.com/red/red/issues/2861>

```
>> make date! [1 2 2017 24 10 0]
== 2-Feb-2017/0:10:00                    ; overflow is calculated OK
>> make date! [1 2 2017 23 70 0]
== 2-Feb-2017/0:10:00                    ; also in this way
>> make date! [1 2 2017 23 70 0 4:30]
== 1-Feb-2017/24:10:00+04:30       ; but NOT if there is a zone
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-08T10:38:42Z, meijeru, commented:
<https://github.com/red/red/issues/2861#issuecomment-313848248>

    As of commit `574762a` the first two examples give an error, but the last one still works (wrongly).

--------------------------------------------------------------------------------

On 2017-07-08T10:46:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2861#issuecomment-313848597>

    A validity test is missing for time components in `make`, such cases should return an error.

--------------------------------------------------------------------------------

On 2017-07-08T12:54:50Z, meijeru, commented:
<https://github.com/red/red/issues/2861#issuecomment-313854286>

    OK since last commit

