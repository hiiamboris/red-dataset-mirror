
#4781: Decimals in time! values not accepting comma
================================================================================
Issue is closed, was reported by raimundasa and has 4 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4781>

**Describe the bug**
```
>> 3:3:3.3
== 3:03:03.3
>> 3:3:3,3
*** Syntax Error: (line 1) invalid time at 3:3:3,3
*** Where: case
*** Stack: load
```

**Expected behavior**

`==3:03:03.3`

**Platform version**

`Red 0.6.4 for Linux built 25-Dec-2020/1:08:25+02:00 commit #98f31b5`


Comments:
--------------------------------------------------------------------------------

On 2021-01-06T14:06:21Z, meijeru, commented:
<https://github.com/red/red/issues/4781#issuecomment-755317640>

    It seems a feature rather than a bug, unless one is keen on consistency ;-)

--------------------------------------------------------------------------------

On 2021-01-06T18:14:04Z, greggirwin, commented:
<https://github.com/red/red/issues/4781#issuecomment-755468549>

    It used to work, and works in R2, so is a fast lexer regression.

