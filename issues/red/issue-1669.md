
#1669: Trap integer overflow and raise error
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1669>

Currently integer overflow is not trapped and no error is raised. An overflow error should be raised when an integer overflows.

Examples of current behaviour:

``` Red
red>> add 1 2147483647
== -2147483648
red>> subtract -2 2147483647
== 2147483647
red>> negate -2147483648
== -2147483648
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-29T10:01:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1669#issuecomment-229312926>

    This feature has not been implemented yet. We need to decide on the detection method.

--------------------------------------------------------------------------------

On 2016-08-01T08:42:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1669#issuecomment-236522577>

    Fixed by commit https://github.com/red/red/commit/b4e73cd35df49dc91e58ba2e5918d3a9508dd857.

