
#1697: AND on binary! returns wrong result
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1697>

```
red>> #{ff} and #{0f}
== #{FF} ; should be #{0F}
red>> #{ff} and #{00}
== #{FF} ; should be #{00}
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-12T14:44:15Z, dockimbel, commented:
<https://github.com/red/red/issues/1697#issuecomment-195752443>

    Fixed by PR #1705.

