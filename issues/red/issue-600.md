
#600: Local words limited to 13
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/600>

I have two projects that don't compile anymore:

```
Red []

f: function [
    p q r s t u v
][
    a: b: c: d: e: f: g: none
]
```

Compiling to native code...
**\* Compilation Error: #code generation error: overflow in emit-variable 
**\* in function: exec/f_f
**\* at line: 1 
**\* near: [
    _function/init-locals 8 
    stack/mark-native exec/~f 
    stack/reset 
    stack/mark-native ~set 
    stack/mark-native
]



Comments:
--------------------------------------------------------------------------------

On 2013-12-11T00:13:14Z, dockimbel, commented:
<https://github.com/red/red/issues/600#issuecomment-30282330>

    Actually, the limit is 16 for the compiler (2 are reserved for internal use). The object branch added one more, and your code was using 14 already, so the limit is reached. The compiler maps each local word to a Red/System local word for simplicity and maximum efficiency. As the type is not provided, each Red/System local word takes 8 bytes by default (stack slot size for a float64!), so that the limit translates to 128 bytes on stack. This limit is currently imposed by the IA-32 backend, which use 8-bit displacements instructions relative to EBP (the stack frame pointer register), so effectively limiting the reach to a [-128, +127] bytes range.
    
    Removing this limit can be done by using wider displacements, but resulting in more generated code and slower stack data accesses. So, in order to preserve the current speed, such wider displacements code generation should be done only when stack usage exceeds the range of 8-bit relative displacements. Such change is quite important in the IA-32 backend and might be needed also for the ARM backend (I haven't checked yet). Such upgrade was meant since the beginning but time was never found for it, although, it's an important one to have when Red will get ready for production usage. So, that change won't be done at once, but probably when enough spare time will be found for it, which could be as far as later in Q1 2014.
    
    For the record, the interpreter has no such limit though.

--------------------------------------------------------------------------------

On 2013-12-11T01:42:43Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/600#issuecomment-30286876>

    Hm, IA-32 sucks again. I had that displacement range on my 6502 machines.
    
    Thanks for the explanation.

--------------------------------------------------------------------------------

On 2014-02-14T13:27:38Z, dockimbel, commented:
<https://github.com/red/red/issues/600#issuecomment-35082895>

    The new hard limitations for locals and arguments on stack are target-specific:
    - IA-32: 32KB max
    - ARMv5: 4KB max
    
    So, for safe crossplatform apps, locals + arguments shouldn't take more than 4KB on stack, which translates to about 1000 32-bit slots or 512 64-bit slots (default is 64-bit slots if no type is specified in Red/System functions).

--------------------------------------------------------------------------------

On 2014-02-14T14:56:19Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/600#issuecomment-35090209>

    That's a welcome improvement. Is that per function?

--------------------------------------------------------------------------------

On 2014-02-14T15:02:00Z, dockimbel, commented:
<https://github.com/red/red/issues/600#issuecomment-35090718>

    Yes, per function.

