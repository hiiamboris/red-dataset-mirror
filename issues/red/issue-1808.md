
#1808: Error says "has no value" when should say "needs a value"
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1808>

Rebol (_as expected_):

```
>> x
** Script error: x has no value

>> x:
** Script error: x: needs a value

>> x: do []
** Script error: x: needs a value
```

Red:

```
red>> x
*** Script error: x has no value

red>> x:
*** Script error: x: needs a value

red>> x: do []
*** Script error: x: has no value
```

The difference in the last line mislead me a significant distance while debugging.



Comments:
--------------------------------------------------------------------------------

On 2016-04-12T19:07:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1808#issuecomment-209057021>

    Good catch!

