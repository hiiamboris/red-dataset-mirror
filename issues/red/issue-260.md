
#260: Large test program gives unexpected compilation error
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.dismissed] [Red/System]
<https://github.com/red/red/issues/260>

A large Red/System program of 65536 tests, each declaring a variable, fails with an unexpected compilation error.

```
-= Red/System Compiler =- 
Compiling ../red/tests/source/runtime/auto-tests/unicode-auto-test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compilation Error: undefined symbol: ~~~start-file~~~ 
*** in file: %red/tests/source/runtime/auto-tests/unicode-auto-test.reds 
*** at line: 3 
*** near: [
    ~~~start-file~~~ "unicode runtime" 
    #script %../red/tests/source/runtime/auto-tests/../../../../../quick-test/quick-test.reds 
    qt-run-name: "123456789012345678901234567890" 
    qt-file-name: "123456789012345678901234567890"
]
```

Here's some additional data :

``` rebol
>> stats
== 2855800
>> do/args %rsc.r %../red/tests/source/runtime/auto-tests/unicode-auto-test.reds
.
.
.
.
>> stats
== 92361999
>> recycle
>> stats
== 89024031
>> length? next first system/words
== 2353
```



Comments:
--------------------------------------------------------------------------------

On 2012-09-26T18:38:34Z, dockimbel, commented:
<https://github.com/red/red/issues/260#issuecomment-8900349>

    We missed it at first look, but the %unicode-auto-test.r is invalid, at line 3 the ~~~start-file~~~ function is called before it is defined. Even after fixing that, other issues appear:
    
    ```
    *** Compilation Error: invalid definition for function unicode/latin1-to-UCS2: [series!]
    *** in file: %red/runtime/unicode.reds
    *** at line: 30
    *** near: [func [...
    ```
    
    The problem is that the %unicode.reds file requires Red memory allocator to be included first (and maybe other Red runtime files). Even if the compilation can be achieved, the resulting program will not work properly as it puts a huge burden on the memory allocator, while this one is not yet complete (e.g. no GC).
    
    So I think we can safely close this ticket now without taking any action.

