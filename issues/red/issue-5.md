
#5: Red/System compiler has to be "re-booted" after it finds a compilation error
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.tested] [type.bug]
<https://github.com/red/red/issues/5>

After compiling a Red/System source file which has compilation errors, the compiler won't compile correct source. The REBOL/View session has to be quit and restarted.

I ran the following test with two different source files: `good.reds` (`print "hello"`) and `bad.reds` (`print not-defined`):

```
-= Red/System Compiler =-
Compiling tests/good.reds ...
Script: "Red/System IA32 code emitter" (none)

...compilation time:     10 ms
...linking time:         30 ms
...output file size:     2048 bytes
>> do/args %rsc.r "%tests/bad.reds"
Script: "Red/System compiler wrapper" (none)

-= Red/System Compiler =-
Compiling tests/bad.reds ...
Script: "Red/System IA32 code emitter" (none)
*** undefined symbol
at:  [not-defined]
>> do/args %rsc.r "%tests/good.reds"
Script: "Red/System compiler wrapper" (none)

-= Red/System Compiler =-
Compiling tests/good.reds ...
Script: "Red/System IA32 code emitter" (none)
** Script Error: Invalid path value: stdout
** Where: emit-variable
** Near: emit-reloc-addr emitter/symbols/:name
>>
```



Comments:
--------------------------------------------------------------------------------

On 2011-04-04T17:26:26Z, dockimbel, commented:
<https://github.com/red/red/issues/5#issuecomment-954961>

    Agreed.

--------------------------------------------------------------------------------

On 2011-04-06T14:49:41Z, dockimbel, commented:
<https://github.com/red/red/issues/5#issuecomment-964286>

    FIX: compiler state is now reset if a compilation error occurs. Closed by 9ed37d7cd495e89674ac7b93c840fd048ba61dce.

--------------------------------------------------------------------------------

On 2011-04-06T15:36:34Z, PeterWAWood, commented:
<https://github.com/red/red/issues/5#issuecomment-964539>

    Thanks. I have successfully tested the change.

