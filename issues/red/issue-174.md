
#174: type-function! broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/174>

After the change in #172, type-function! still returns 8 in a larger program, just like larger programs don't pass alias IDs in typed functions. It does return the new value 7 in a small test program.

There must be multiple definitions in the compiler for type and alias codes, and they're out of sync.



Comments:
--------------------------------------------------------------------------------

On 2011-09-09T16:28:17Z, dockimbel, commented:
<https://github.com/red/red/issues/174#issuecomment-2052957>

    You are right, it was out of sync between the runtime definition (%common.reds) and the compiler internal values.
    Type-struct! value has been fixed too.

