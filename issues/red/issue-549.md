
#549: Compiler can't use function names as path selectors
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.resolved]
<https://github.com/red/red/issues/549>

I'd like this fixed in the objects branch:

```
Red []

f: does []
b: []
b/f
```

-=== Red Compiler 0.4.0 ===- 

Feature not yet implemented!



Comments:
--------------------------------------------------------------------------------

On 2013-10-08T22:46:02Z, dockimbel, commented:
<https://github.com/red/red/issues/549#issuecomment-25934175>

    The error message is right, the support for functions in path is not implemented in the compiler. The issue lies in statically determining what the path is supposed to represent, this require some significant additions to the compiler in order to make it able to resolve such cases accurately. This `Feature not implemented` message was put in the compiler to prevent the use of a function name in paths on purpose, until the compiler is completed. This is a work in progress in the `objects` branch, so as the message is valid, I will dismiss this ticket as an issue that needs fixing.

--------------------------------------------------------------------------------

On 2013-10-08T23:14:50Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/549#issuecomment-25935649>

    That's a serious limitation. I will have to significantly change my program.
    
    Is it really that hard to interpret a path as pure symbols, without resolving them? There's no reason that SELECT words should be resolved to functions, except when selecting in objects. The interpreter has no problem with it.

--------------------------------------------------------------------------------

On 2013-10-09T08:47:20Z, dockimbel, commented:
<https://github.com/red/red/issues/549#issuecomment-25955360>

    _That's a serious limitation._ As said above, it's a **work in progress** in the objects branch.
    
    _Is it really that hard to interpret a path as pure symbols, without resolving them?_ Such option should only be the ultimate fallback for the compiler, as it means putting the path and everything after it in a big DO [...], so that the interpreter processes it. This shouldn't be the general option else, it would defeat the purpose of a compiler.
    
    _There's no reason that SELECT words should be resolved to functions, except when selecting in objects._ The problem is determining the type of `b` accurately and in a general way so that the compiler generates the correct actions (SELECT if it is a series, a function call if it is an object, etc...). 
    
    _The interpreter has no problem with it._ Sure, it resolves it at runtime, so can easily determine the type of words in path and do the right action. The compiler needs to solve all that at compilation time.

--------------------------------------------------------------------------------

On 2013-10-09T09:12:22Z, dockimbel, commented:
<https://github.com/red/red/issues/549#issuecomment-25956655>

    It seems that disabling the protection code in the compiler for that case does not do any harm, so I will disable it for now, but will put it back if any regression or new issue is caused because of that.

--------------------------------------------------------------------------------

On 2013-10-09T18:58:35Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/549#issuecomment-25998367>

    Thanks. I understand that objects aren't implemented yet in the compiler. I just want it to work for the case that doesn't use objects at all.
    
    Could you merge this fix with the objects branch? Otherwise it becomes hard for me to test the objects branch.

--------------------------------------------------------------------------------

On 2013-10-10T10:17:00Z, dockimbel, commented:
<https://github.com/red/red/issues/549#issuecomment-26042315>

    Done.

