
#1548: WISH: `enter` event
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1548>

A new `enter` event:

| Name | Input type | Cause |
| --- | --- | --- |
| **enter** | keyboard | Enter key is pressed down. |

This effect can currently be achieved on a field in Red using:

```
view [field on-key [if event/key = #"^M" [print {Enter key pressed.}]]]
```

However, if there were an `enter` event:

```
view [field on-enter [print {Enter key pressed.}]]
```

It could then be designated the default event for `field` (instead of the current `change`) as in Rebol:

```
view [field [print {Enter key pressed.}]]
```



Comments:
--------------------------------------------------------------------------------

On 2016-01-28T07:57:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1548#issuecomment-176042580>

    Implemented in commit [e3ff482f](https://github.com/red/red/commit/40033fd0bd6b3f79d57463c4a814ec4be3ff482f).

