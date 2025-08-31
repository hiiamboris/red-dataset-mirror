
#3570: MODIFY is defined on files and urls, but does not seem to do anything
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.deferred]
<https://github.com/red/red/issues/3570>

`file!` and `url!`  values inherit `modify` from `series!`. However, for `series!` values `modify` is only defined with the `owned` property -- this is presumably in connection with `on-change` for objects. There is no indication what `modify` would do for files, urls or ports for that matter.


Comments:
--------------------------------------------------------------------------------

On 2019-09-07T15:42:56Z, dockimbel, commented:
<https://github.com/red/red/issues/3570#issuecomment-529119030>

    The behavior of `modify` on those types will be defined once we implement the full I/O sub-system.

