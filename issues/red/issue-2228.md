
#2228: Refinement /case on REPLACE
================================================================================
Issue is closed, was reported by Rebol2Red and has 4 comment(s).
[status.built] [status.contribution] [type.task.wish]
<https://github.com/red/red/issues/2228>

As implemented on Rebol



Comments:
--------------------------------------------------------------------------------

On 2020-03-26T15:12:39Z, 9214, commented:
<https://github.com/red/red/issues/2228#issuecomment-604487106>

    That one seems to be fulfilled.
    ```red
    >> replace/all/case [a b B c] 'b 'x
    == [a x B c]
    ```

--------------------------------------------------------------------------------

On 2020-03-26T15:17:52Z, meijeru, commented:
<https://github.com/red/red/issues/2228#issuecomment-604490057>

    This should be marked `status.built` and closed, then. There might be others of the same kind. @9214, you are apparently reviewing quite a lot of issues, I would hope you have the authority to close those that can be closed, since they contribute to reducing the (apparent) backlog...

