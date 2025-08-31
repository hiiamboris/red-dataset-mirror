
#58: type casts not accepted for initialization
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/58>

Both
    i: as integer! null 
and
    p: as [pointer! [integer!]] 0

are not accepted by the compiler



Comments:
--------------------------------------------------------------------------------

On 2011-06-04T10:28:27Z, dockimbel, commented:
<https://github.com/red/red/issues/58#issuecomment-1301272>

    Feature now supported (in global context only) as a side-effect of commit [819a482c](https://github.com/dockimbel/Red/commit/819a482c9448627780daf9ca76ddfbc2919f579a)

--------------------------------------------------------------------------------

On 2011-06-04T10:46:33Z, dockimbel, commented:
<https://github.com/red/red/issues/58#issuecomment-1301302>

    Added support for local variables too with commit [d4ab0287](https://github.com/dockimbel/Red/commit/d4ab0287baebea7dc90573f2a0bff322346283c4)

--------------------------------------------------------------------------------

On 2011-06-04T10:47:25Z, dockimbel, commented:
<https://github.com/red/red/issues/58#issuecomment-1301303>

    Tested OK (with simple test cases only)

