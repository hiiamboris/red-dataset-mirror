
#2697: integer ** percent value gives wrong result
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2697>

`**` is defined for two `number!` arguments. I tried all combinations
```
>> 2 ** 3
== 8
>> 2 ** 3.0
== 8.0
>> 2 ** 300%
== 1      ;; <------  wrong!!
>> 2.0 ** 3
== 8.0
>> 2.0 ** 3.0
== 8.0
>> 2.0 ** 300%
== 8.0
>> 200% ** 3
== 800%
>> 200% ** 3.0
== 800%
>> 200% ** 300%
== 800%
```
Conclusion: with integer/integer the result is integer, with percent as first argument, the result is percent,
and otherwise the result is float, except that integer ** percent does not work.



Comments:
--------------------------------------------------------------------------------

On 2017-05-18T20:39:09Z, meijeru, commented:
<https://github.com/red/red/issues/2697#issuecomment-302534574>

    See the following lines in %integer.reds 616-618:
    ```
    		up?: any [
    			TYPE_OF(exp) = TYPE_FLOAT
    			negative? exp/value
    		]
    ```
    The test should include TYPE_PERCENT.

--------------------------------------------------------------------------------

On 2017-06-07T08:44:04Z, dockimbel, commented:
<https://github.com/red/red/issues/2697#issuecomment-306730572>

    Percent! has been excluded from allowed types for the exponent.

