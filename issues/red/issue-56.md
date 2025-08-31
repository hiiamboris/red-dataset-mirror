
#56: length? could be made more efficient
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.waiting]
<https://github.com/red/red/issues/56>

The current definition of length? in common.reds could be replaced by:

```
#import [
 "msvcrt.dll" cdecl [
  length?: "strlen" [  ; Return string length.
   command [c-string!]
   return: [integer!]
 ]
]
```

at the cost of placing it in win32.r instead of common.reds. The equivalent libraries for the other OSs are `libc.so.6` forGNU (Linux) and `libc.dylib` for Mac (courtesy of C-library binding by Kaj de Vos, http://red.esperconsultancy.nl/Red-C-library).



Comments:
--------------------------------------------------------------------------------

On 2011-05-26T22:53:06Z, dockimbel, commented:
<https://github.com/red/red/issues/56#issuecomment-1246053>

    Well, as expressed briefly on the mailing-list, I am not ready to remove working Red/System code to replace it by C calls (at least not at this alpha stage, where we have so little real-world Red/System code).
    
    Let's examine the strlen() case:
    
    1) Function's source code:
    
    Red/System version ([source](https://github.com/dockimbel/Red/blob/master/red-system/runtime/common.reds))
    
    ```
    length?: func [s [c-string!] return: [integer!] /local base [c-string!]][
        base: s
        while [s/1 <> 0][s: s + 1]
        as-integer s - base
    ]
    ```
    
    FreeBSD C version ([wikipedia](http://en.wikipedia.org/wiki/Strlen))
    
    ```
    size_t strlen(const char * str)
    {
        const char *s;
        for (s = str; *s; ++s);
        return(s - str);
    }
    ```
    
    If you do not count the function header, it is 3 lines of code in both cases. So at the source level, it should be fair to say that the Red/System version is on par with the C one.
    
    2) Performances
    
    Red/System currently generates non-optimized code, so any decent C compiler with optimizations turned on will generate faster code. But:
    - Your proposition looks like a premature optimization to me, we have no need for best performing code currently.
    - The speed difference might not be very significant for the general case (small strings) and even less when considering a whole program execution time.
    - If required, the algorithm used by the Red/System version can be optimized the same way [as in C](http://www.freebsd.org/cgi/cvsweb.cgi/src/lib/libc/string/strlen.c?rev=1.10), using word accesses (instead of byte)
    - Red/System will be reimplemented in Red with support for generating optimized code.
    - Standard C strlen() implementation is not the best way to get optimal performances, writing hand-optimized ASM code, using modern CPU features like SIMD, would give even better results, like in this [implementation](http://www.opensource.apple.com/source/Libc/Libc-583/i386/string/strlen.s) from Apple (I am not sure that Windows or Linux do use such level of optimization in their LibC implementation)
    
    3) Dependency
    
    I want to keep the core of Red/System (and Red) as free as possible from external library dependencies and as long as possible. I want to avoid dealing with "other's" mess, like REBOL does for Linux, providing [two different versions](http://www.rebol.com/download-core.html) depending on the Linux flavor (seems caused by different LibC versions).
    
    Considering all this, and while writing it, I came to the conclusion that both approaches could co-exist, it would be possible to have a compile-time or run-time flag that would redirect every core support functions either to the Red/System implementation or to an external library...best of both worlds. I need to check if it can be done simply and efficiently before implementing that solution.

--------------------------------------------------------------------------------

On 2011-05-27T08:02:59Z, meijeru, commented:
<https://github.com/red/red/issues/56#issuecomment-1247787>

    Staying as free as possible from dependencies is of course a good policy, and your case is impeccably argued. However, as you will see from my new proposals for string functions (soon to be put on gist) even for basic things like substringing (copy/part) and concatenation (join) one cannot do without calloc and free. Once these are imported, strlen comes for free.

--------------------------------------------------------------------------------

On 2011-06-08T11:58:19Z, meijeru, commented:
<https://github.com/red/red/issues/56#issuecomment-1326159>

    Now that redefinition of functions is forbidden generally, and since length? is defined in common.reds, the question has become irrelevant.

