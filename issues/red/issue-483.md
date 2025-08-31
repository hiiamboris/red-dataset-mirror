
#483: Passing byte-ptr! as a struct! member as an argument to a macro crashes the compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/483>

Code

```
Red/System []

#define LTM-MP-zero-set(digit size) [
    LTM-MP-digit-counter: size
    until [
        digit/value: null-byte
        digit: digit + 1
        LTM-MP-digit-counter: LTM-MP-digit-counter - 1
        LTM-MP-digit-counter = 0
    ]
]

LTM-mp-int!: alias struct! [
    used            [integer!]
    alloc           [integer!]
    sign            [integer!]
    mp-digit        [byte-ptr!]
]

mp-int: declare LTM-mp-int!

mp-int/used: 0
mp-int/alloc: 32
mp-int/sign: 0
mp-int/mp-digit: allocate 32

LTM-MP-zero-set(mp-int/mp-digit 32)             ;; gives compile error

;; However this works

bp: mp-int/mp-digit
LTM-MP-zero-set(bp 32)
```

Compiler Output

```
Script: "Red/System compiler wrapper" (none)
Script: "Red/System compiler" (none)
Script: "REBOL code profiling tool" (none)
Script: "REBOL 3 Forward Compatibility Functions" (23-Feb-2011)
Script: "Red/System integer! to binary! conversion library" (none)
Script: "Red/System IEEE-754 library" (none)
Script: "Red/System struct! datatype replacement library" (none)
Script: "secure-clean-path" (19-Sep-2002)
Script: "Red/System linker" (none)
Script: "Red/System code emitter" (none)
Script: "Red/System code emitter base object" (none)

-= Red/System Compiler =- 
Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compiler Internal Error: Script Error : Expected one of: word! - not: path! 
*** Where: inject 
*** Near:  [to type value] 
```



Comments:
--------------------------------------------------------------------------------

On 2013-05-30T02:17:29Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/483#issuecomment-18657950>

    Looks like paths are simply not supported as macro arguments. If they were, it would be tricky to expand digit/value to mp-int/mp-digit/value. It would still be nice if that worked, but you also have to consider that you're expanding DIGIT three times in the macro, so it's more efficient anyway to store the struct path in a temporary variable first. On the other hand, the semantics are not the same, because now you're incrementing BP instead of mp-int/mp-digit.

--------------------------------------------------------------------------------

On 2013-05-30T03:33:35Z, PeterWAWood, commented:
<https://github.com/red/red/issues/483#issuecomment-18659683>

    On the efficiency front, I think that I'm happy for the pre-processor to expand digit to mp-int/mp-digit three times as I would expect the runtime difference between accessing bp and mp-int/mp-digit three times to be little more than assigning the pointer to a temporary variable. (If not I will change to using a temporary pointer).
    
    In this case the semantics are probably not too much of a concern as it is unusual for anybody to study the expanded source.
    
    I have found that you can successfully pass a structure member as an argument to a macro but I don't know if that is by accident or design:
    
    Code
    
    ```
    Red/System []
    
    #define my-macro(i j) [
        print [i + j lf]
    ]
    
    j: 0
    
    st: declare struct! [ 
        i           [integer!]
    ]
    st/i: 4
    
    my-macro(j st/i)
    ```
    
    Output
    
    ```
    ...compilation time:     98 ms
    ...linking time:         6 ms
    ...output file size:     16384 bytes
    ...output file name:     builds/test
    4
    ```

--------------------------------------------------------------------------------

On 2013-05-30T18:45:00Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/483#issuecomment-18699818>

    Looks like injecting a path into a path is the problem, then.

