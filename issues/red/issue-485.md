
#485: PRINT sucks up new words
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/485>

```
Red []

print [x: 1]
x
```

-= Red Compiler =- 
**\* Compilation Error: undefined word x 
**\* near: [x]

Probably in all branches, but I currently need it in master.



Comments:
--------------------------------------------------------------------------------

On 2013-07-08T13:06:13Z, dockimbel, commented:
<https://github.com/red/red/issues/485#issuecomment-20603660>

    Actually, the compiler does its job correctly. As `print` is not a language keyword, the block following it, is just data for the compiler, he has no way to guess that the content might generated the creation of a variable. I won't add `print` and `prin` as a keywords, because it would make an exception, that users could see a flaw, because their own functions would not be able to be processed the same way.
    
    Basically, the compiler can produce working code for such use-case, but that would require disabling the `undefined word` error totally, which is not desirable. I have made some provision to deal with such cases, I wanted to have objects and modules done first to deal with them globally, but I guess I need to start it now anyway, so this is the solution I propose:
    
    A new `red-strict-check?` compilation flag will be added to instruct the compiler how to check validity of variables:
    - if set to `yes`: current behavior, variables needs to be declared statically, not dynamically (default)
    - if set to `no`: compiler will let the runtime code report undefined words, no checking will be done at compile-time.
    
    Such language-level option should go into modules definitions, as we don't have them, in the meantime, they will go into the config file.

