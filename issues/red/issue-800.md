
#800: ASK can't display input Chinese characters properly
================================================================================
Issue is closed, was reported by WayneCui and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/800>

Only tested on Windows 7

```
red >>ask "请输入:"
÷eQ:你好
== "你好"
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-01T02:18:44Z, JerryTsai, commented:
<https://github.com/red/red/issues/800#issuecomment-41873537>

    On MacOS, it automatically quits in this case.

--------------------------------------------------------------------------------

On 2014-05-01T09:54:05Z, dockimbel, commented:
<https://github.com/red/red/issues/800#issuecomment-41896463>

    This is due to a last-minute change in %input.red where the `ask` and `input` function bodies were swaped to avoid the "backspace key deleting the prompt" issue caused by underlying readline not accepting empty prompt string.

--------------------------------------------------------------------------------

On 2014-05-01T12:40:50Z, dockimbel, commented:
<https://github.com/red/red/issues/800#issuecomment-41906577>

    The fix works fine on MacOSX too.

