
#2687: make-dir: code tests for url! argument, but only file! is allowed
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/2687>

See line 613 in `%environment/functions.red`


Comments:
--------------------------------------------------------------------------------

On 2017-05-19T00:04:17Z, qtxie, commented:
<https://github.com/red/red/issues/2687#issuecomment-302573602>

    Yes. We'll add the url! argument back once we have full IO support.

--------------------------------------------------------------------------------

On 2017-06-07T03:30:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2687#issuecomment-306676442>

    There is no usage for `make-dir` on `url!` for now, so only `file!` is allowed.

