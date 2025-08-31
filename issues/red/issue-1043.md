
#1043: Compiler cannot handle complex return 
================================================================================
Issue is closed, was reported by iArnold and has 6 comment(s).
<https://github.com/red/red/issues/1043>

Red []

test-return: function [
    return: [logic!]
    /local times-check [integer!]
][
    times-check: 1000
    return if 0 < times-check [false][true]
]

print test-return

Leads also to a compile error

> > do/args %red.r "-c % .. /test/test-return.red"

-=== Red Compiler 0.5.0 ===-

Compiling /C/ .. /test/test-return.red ...
...compilation time : 510 ms



Comments:
--------------------------------------------------------------------------------

On 2015-02-25T19:42:56Z, iArnold, commented:
<https://github.com/red/red/issues/1043#issuecomment-76039772>

    Compiling to native code...
    **\* Compilation Error: undefined symbol: ts610
    **\* in file: %/C/ .. /test/test-return.red
    **\* in function: exec/f_modulo
    **\* at line: 1
    **\* near: [ts610 0 stack/arguments
        ~b: type-check ts610 1 ~a
    ]

--------------------------------------------------------------------------------

On 2015-02-25T20:48:22Z, iArnold, commented:
<https://github.com/red/red/issues/1043#issuecomment-76053145>

    Sorry, the IF makes no sense here. Need to retest this with either or no extra [true] block at the end.

--------------------------------------------------------------------------------

On 2015-02-25T20:51:36Z, iArnold, commented:
<https://github.com/red/red/issues/1043#issuecomment-76053886>

    Works ok issue closed.

