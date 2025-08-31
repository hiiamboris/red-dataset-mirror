
#3489: Inconsistency between reduce and compose on any-function! values
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/3489>

### Expected behavior

`reduce` and `compose` should behave equally on non-block values
### Actual behavior
`reduce` and `compose` may both be applied to a non-block argument (BTW one could ask oneself why allow this at all)
for arguments *not* of type `any-function!` they just yield the result of evaluation
BUT `reduce :add` gives the `action!` value, `compose :add` gives an error, since it tries to *apply* the action
### Steps to reproduce the problem
execute above examples (with any native, action, function or routine -- `compose <op>` gives: not yet implemented)

### Red and platform version
all


Comments:
--------------------------------------------------------------------------------

On 2018-08-04T17:02:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3489#issuecomment-410463187>

    I have this change made for function types, but haven't found `compose` tests to update yet. In addition, `Compose` evaluates in Red, but not in Rebol. That seems more consistent with `reduce` in Red, so I'll leave it as is.
    ```
    >> compose quote (1 + 1)
    == 2
    >> compose 'system/words
    == make object! [
        datatype!: datatype!
        ...
    ```
    Rebol:
    ```
    >> compose quote (1 + 1)
    == (1 + 1)
    >> compose 'system/catalog
    == system/catalog
    ```
    `Reduce` checks for function types and does not evaluate them. 

--------------------------------------------------------------------------------

On 2018-08-04T17:04:42Z, greggirwin, commented:
<https://github.com/red/red/issues/3489#issuecomment-410463388>

    Found the tests in %evaluation-test.red.

