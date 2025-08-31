
#3074: `request-dir` and `request-file` ignore string! values
================================================================================
Issue is closed, was reported by endo64 and has 6 comment(s).
<https://github.com/red/red/issues/3074>

`request-dir` and `request-file` functions accept `string!` values for `/dir` and `/file` refinements respectively but silently ignores them. `file!` values work as expected.

Steps to reproduce:
`request-dir/dir "C:\windows\"`
`request-file/file "red.exe"`

I've fixed this PR #3138 



Comments:
--------------------------------------------------------------------------------

On 2018-04-23T17:19:09Z, endo64, commented:
<https://github.com/red/red/issues/3074#issuecomment-383653581>

    PR #3138 fixes this issue.

--------------------------------------------------------------------------------

On 2018-04-29T23:26:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3074#issuecomment-385290044>

    @endo64 I just merged PR #3138. Please confirm it all looks good once built and either close this ticket or follow up with me and we'll revisit. Thanks!

--------------------------------------------------------------------------------

On 2018-05-03T14:00:34Z, endo64, commented:
<https://github.com/red/red/issues/3074#issuecomment-386305579>

    Hi @greggirwin I built and tested on Win10, it works as expected, I'm closing this issue.

