
#1191: empty? is subtly different from tail?
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/1191>

In `%environment/functions.red`, the function `empty?` used to be defined as identical to `tail?`. The statement doing that is now commented out, and a new definition is provided which accepts not only a series but also `none`. While this has no doubt advantages in programming, one wonders why `tail?` cannot have this same facility. 



Comments:
--------------------------------------------------------------------------------

On 2015-05-31T14:01:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1191#issuecomment-107190070>

    `empty?` is meant to be the _relaxed_ version of `tail?`. Sometimes you want the `empty? find` pattern to work even if `find` returns `none`, but in the general case, you expect a series, so `tail?` provides you with the safe variant (that will error out in case of `none` argument).

--------------------------------------------------------------------------------

On 2015-05-31T14:07:59Z, dockimbel, commented:
<https://github.com/red/red/issues/1191#issuecomment-107190707>

    The commented code has been removed and the `empty?` has been changed to return `false` instead of `none`.

