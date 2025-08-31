
#1726: CHANGE-DIR works differently than in Rebol
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1726>

In both Red and Rebol, you can write `cd dir` to change dir to `%dir/`. In Red, this is also possible with `change-dir`, however in Rebol, `change-dir dir` interprets `dir` as normal word and gets its value. Also, Red does not accept `get-word!` as `change-dir` or `cd` argument, so it's not possible to use `change-dir :dir`. The result is that changing file path to stored value is impossible right now.



Comments:
--------------------------------------------------------------------------------

On 2016-03-23T09:16:44Z, dockimbel, commented:
<https://github.com/red/red/issues/1726#issuecomment-200263061>

    You can simply set `system/options/path` to whatever value you need, in order to change the current working folder.

--------------------------------------------------------------------------------

On 2016-03-23T09:17:15Z, rebolek, commented:
<https://github.com/red/red/issues/1726#issuecomment-200263159>

    Thanks for tip!

--------------------------------------------------------------------------------

On 2016-03-23T09:26:43Z, dockimbel, commented:
<https://github.com/red/red/issues/1726#issuecomment-200266390>

    We still need to enable that feature for `change-dir`, so I keep the ticket opened until it is done.

