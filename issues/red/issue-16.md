
#16: prin/print with non-string argument crashes compiler
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.tested]
<https://github.com/red/red/issues/16>

A program which contains `print 1` is compiled without protest, but when run produces a crash with Windows exception code 0xc0000005.



Comments:
--------------------------------------------------------------------------------

On 2011-04-25T11:33:56Z, dockimbel, commented:
<https://github.com/red/red/issues/16#issuecomment-1052585>

    Argument type checking is not implemented yet. Setting the status to "waiting" until the feature gets added.

--------------------------------------------------------------------------------

On 2011-05-17T15:48:12Z, dockimbel, commented:
<https://github.com/red/red/issues/16#issuecomment-1191171>

    Fixed by commit: https://github.com/dockimbel/Red/commit/3707275b141376e1e3aff01d2919a6ad95743ec8
    
    Now `print 1` will generate the following compilation error:
    `*** Compilation Error: type mismatch, expected: [c-string!] , found: [integer!]
    *** in: %tests/test.reds
    *** at:  [1]`

