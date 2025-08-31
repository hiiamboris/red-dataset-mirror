
#453: FIND with a refinement value as search value won't compile
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/453>

I haven't tried to reduce the test case, but building a Red console with mezz funcs, in WHAT, I have the following line:

```
clear find words /local
```

If I comment that out, it compiles fine, otherwise I get this:

...compilation time:     205 ms

Compiling to native code...

**\* Compilation Error: undefined symbol: red/refinement/push-local
**\* in file: %<filename here>
**\* at line: 126
**\* near: [
   refinement/push-local ctx479 1
   block/append*
   stack/keep
   word/push ~mold
   block/append*
]



Comments:
--------------------------------------------------------------------------------

On 2013-03-30T23:30:57Z, dockimbel, commented:
<https://github.com/red/red/issues/453#issuecomment-15683817>

    This case only fails when `words` is bound to a local context, in the global context, it works as expected.

