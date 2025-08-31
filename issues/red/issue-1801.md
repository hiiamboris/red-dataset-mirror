
#1801: write does not work with block! argument
================================================================================
Issue is closed, was reported by fvanzeveren and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1801>

When trying to write a block of string, the command returns the following error:
`red>> write/lines %test.txt ["a" "b" "c" "d"]`
`*** Script error: write does not allow block! for its data argument`
`*** Where: write`

This does not look right, considering that it is supposed to accept any-type! and the same command works fine with REBOL2.

regards



Comments:
--------------------------------------------------------------------------------

On 2016-04-11T11:51:10Z, ghost, commented:
<https://github.com/red/red/issues/1801#issuecomment-208306690>

    It is not implemented yet and is a planned feature. See qtxie's reply here - https://groups.google.com/forum/m/?hl=en#!topic/red-lang/h36_IeGmHH4

--------------------------------------------------------------------------------

On 2016-04-12T21:51:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1801#issuecomment-209117775>

    Yes, this is a to-be-implemented future, so I'm closing the ticket.

