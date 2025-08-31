
#1825: on-change* needs to know the owner, just like on-deep-change* does.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1825>

> on-change\* : func [word [word!] old new] [...]
> on-deep-change\* : func [owner word target action new index part] [...]



Comments:
--------------------------------------------------------------------------------

On 2016-04-19T04:24:44Z, dockimbel, commented:
<https://github.com/red/red/issues/1825#issuecomment-211724454>

    Use `self` in `on-change*` handler. The `owner` argument in `on-deep-change*` was meant for some extended semantics which are not implemented for now, it is not strictly required.

