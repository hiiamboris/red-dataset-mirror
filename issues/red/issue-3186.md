
#3186: DOC: utility of stdcall is not explained
================================================================================
Issue is open, was reported by meijeru and has 2 comment(s).
[type.documentation]
<https://github.com/red/red/issues/3186>

The official Red/System specification says (emphasis added by me):
(6.3.2)
The `stdcall` attribute is **also** accepted (it is already the **default** calling convention in Red/System), but will have **no effect for internal functions**. Imported functions with such attribute will be compiled as callbacks, but in such case, the more explicit callback attribute **should be used**.
6.3.3 Callback
The purpose of the callback attribute is to manually force a callback compilation mode for a function that the compiler failed to infer as a callback. It can be used as a more meaningful replacement for stdcall when used on Windows.
The compiler can correctly infer callbacks when a function pointer is passed as a get-word to an imported function call. Other cases of passing a Red/System function pointer cannot be properly detected as external callbacks.
For example, if Red/System function pointers are passed to an external API in an indirect way (filling an array or a structure), and those functions will be later called by the external code (OS or a library), the callback attribute must be used in order for correct code to be generated. Moreover, if the external caller is using C calling convention, then the **additional cdecl** is required.

I conclude: `stdcall` either means nothing or the same as `callback`, thus it is not at all needed. If there **is** a utility to it, this should be explained.


Comments:
--------------------------------------------------------------------------------

On 2018-01-04T15:44:23Z, dockimbel, commented:
<https://github.com/red/red/issues/3186#issuecomment-355315743>

    Those defintions need to be updated indeed.

