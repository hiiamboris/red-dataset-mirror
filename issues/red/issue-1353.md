
#1353: <anon> instead of value2 in errors for logic operators
================================================================================
Issue is closed, was reported by WiseGenius and has 10 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1353>

In the errors for `and`, `or` and `xor`, it says `<anon> argument` instead of `value2 argument`.

```
red>> none and true
*** Script error: and does not allow none for its value1 argument
*** Where: and
red>> true and none
*** Script error: and does not allow none for its <anon> argument
*** Where: and
```

```
red>> none or true
*** Script error: or does not allow none for its value1 argument
*** Where: or
red>> true or none
*** Script error: or does not allow none for its <anon> argument
*** Where: or
```

```
red>> none xor true
*** Script error: xor does not allow none for its value1 argument
*** Where: xor
red>> true xor none
*** Script error: xor does not allow none for its <anon> argument
*** Where: xor
```

The errors for `and~`, `or~` and `xor~` do say `value2 argument` where appropriate.



Comments:
--------------------------------------------------------------------------------

On 2015-09-17T01:48:18Z, qtxie, commented:
<https://github.com/red/red/issues/1353#issuecomment-140941423>

    It's caused by no type checking for op! in the interpreter.

--------------------------------------------------------------------------------

On 2016-02-06T18:35:30Z, WiseGenius, commented:
<https://github.com/red/red/issues/1353#issuecomment-180831033>

    This is now working as expected.

--------------------------------------------------------------------------------

On 2016-02-06T18:37:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1353#issuecomment-180832827>

    Fixed by commit [94e002b1](https://github.com/red/red/commit/b20d3c6147d81724c45c96753671fd2f94e002b1).

--------------------------------------------------------------------------------

On 2016-08-09T04:49:23Z, x8x, commented:
<https://github.com/red/red/issues/1353#issuecomment-238452749>

    Not sure what the issue is here, if it's about errors returning `<anon>`, then I'm still getting same results as above.

--------------------------------------------------------------------------------

On 2016-08-09T12:11:04Z, WiseGenius, commented:
<https://github.com/red/red/issues/1353#issuecomment-238534045>

    So am I. It must have had a relapse.

