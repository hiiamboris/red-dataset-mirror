
#420: FUNCTION crashes with nested functions
================================================================================
Issue is open, was reported by Kaj-de-Vos and has 6 comment(s).
[type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/420>

```
Red []

f: function [
][
    g: func [
    ][
    ]
]
f
```

**\* Runtime Error 1: access violation
**\* at: B7713036h



Comments:
--------------------------------------------------------------------------------

On 2013-04-25T13:20:16Z, PeterWAWood, commented:
<https://github.com/red/red/issues/420#issuecomment-17006119>

    I have added some tests to function-test.red for this case. There no longer seems to be a runtime error though return values don't seem to be passed back properly.

--------------------------------------------------------------------------------

On 2016-02-06T19:09:53Z, dockimbel, commented:
<https://github.com/red/red/issues/420#issuecomment-180839811>

    It compiles now. Support for nested functions is still limited, though, the specific issue reported in this ticket is now solved.

--------------------------------------------------------------------------------

On 2016-06-13T04:16:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/420#issuecomment-225486231>

    I have re-opened this issue as tests  "ri5" "ri6" and "funfun1" in function-test.red are failing.

