
#3523: Object's owner and owned properties can be set, but not reflected
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3523>


with series values, the `owned` property can be set by `modify` and interrogated by `reflect`;
with object values, `owner` and `owned` properties can be set by modify, but `reflect` with these properties is not implemented
### Red and platform version
all


Comments:
--------------------------------------------------------------------------------

On 2019-09-06T15:08:39Z, dockimbel, commented:
<https://github.com/red/red/issues/3523#issuecomment-528893057>

    Objects can be owners but cannot be owned currently.

--------------------------------------------------------------------------------

On 2019-09-06T15:21:39Z, dockimbel, commented:
<https://github.com/red/red/issues/3523#issuecomment-528898054>

    `owned` flag on an object can now be checked with `reflect`.

