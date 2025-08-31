
#1799: insert/dup/only does not work with series! and any-type!
================================================================================
Issue is closed, was reported by fvanzeveren and has 2 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/1799>

The following test cases fail
Expected:
`>> head insert/only/dup [a b c d e] [1 2] 3`
`== [[1 2] [1 2] [1 2] a b c d e]`
Actual
`red>> head insert/only/dup [a b c d e] [1 2] 3`
`== [[1 2] b c a b c d e]`

Expected:
`>> head insert/dup [a b c d e] 123 3`
`== [123 123 123 a b c d e]`
Actual
`red>> head insert/dup [a b c d e] 123 3`
`== [123 b c a b c d e]`

A complete test set can be found [here](https://gist.github.com/fvanzeveren/1c725fa8804d67b22e982c1654a1b1f7)



Comments:
--------------------------------------------------------------------------------

On 2016-04-13T01:51:21Z, dockimbel, commented:
<https://github.com/red/red/issues/1799#issuecomment-209188441>

    Thanks for the unit tests! Could you please integrate them into the Red unit tests using our own framework? You can add them to [this file](https://github.com/red/red/blob/master/tests/source/units/append-test.red).

