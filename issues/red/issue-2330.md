
#2330: make any-list!/any-path! is defined for more values than is allowed by the table
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2330>

Following the order of the table, the following should error out, but they don't:
at least all from `time!` to `bitset!`, plus `any-word!` and `any-string!`


