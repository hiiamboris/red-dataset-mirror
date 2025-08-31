
#716: Regression: compilation of any Red program crashes for ARM targets
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/716>

```
$ r2 -sw ~/Red/Red/red.r -t Android  -o Android/Red/empty ~/Red/common/examples/empty.red

-=== Red Compiler 0.4.1 ===- 

Compiling /home/kaj/Red/common/examples/empty.red ...
...compilation time:     357 ms

Compiling to native code...
*** Red/System Compiler Internal Error: Math Error : Math or number overflow 
*** Where: emit-prolog 
*** Near:  [emit-i32 join #{E24DD0} 
to char!
]
```



Comments:
--------------------------------------------------------------------------------

On 2014-03-07T08:52:27Z, qtxie, commented:
<https://github.com/red/red/issues/716#issuecomment-36978153>

    This issue occurred since this commit 55702456b1d7f7e13dcb5f30e8338c10a92c2e5f "FEAT: replaced old ASCII tokenizer by the new Unicode runtime lexer. "
    I think the error is caused by function `transcode` use too many local variables and the ARM backend can't handle it.

--------------------------------------------------------------------------------

On 2014-03-07T18:47:36Z, dockimbel, commented:
<https://github.com/red/red/issues/716#issuecomment-37054541>

    Right, it's a local variables size on stack limitation in the ARM backend, I am looking into ways to work around it.

--------------------------------------------------------------------------------

On 2014-03-08T17:52:37Z, dockimbel, commented:
<https://github.com/red/red/issues/716#issuecomment-37104341>

    Locals can now take up to 2^32 bytes of stack space.

