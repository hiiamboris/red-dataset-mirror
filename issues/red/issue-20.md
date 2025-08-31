
#20: Compiler cannot cope with option link?: no
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.tested]
<https://github.com/red/red/issues/20>

The wrapper `%rsc.r` calls `system-dialect/compile` with option `link?: yes`. If one changes this to no, a REBOL error ensues, namely the third element of the block returned by compile, `length? job/buffer`, cannot be computed (obviously, `job/buffer` remains `none` when there is no linking). 



Comments:
--------------------------------------------------------------------------------

On 2011-04-27T21:36:34Z, dockimbel, commented:
<https://github.com/red/red/issues/20#issuecomment-1066839>

    Fixed in commit: https://github.com/dockimbel/Red/commit/16b5149a44c51028b50ec772374e43d419efe38a

--------------------------------------------------------------------------------

On 2011-05-09T11:41:10Z, dockimbel, commented:
<https://github.com/red/red/issues/20#issuecomment-1122362>

    Tested OK.

