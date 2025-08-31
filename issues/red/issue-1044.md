
#1044: Compiler error for xor
================================================================================
Issue is closed, was reported by iArnold and has 4 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/1044>

Red []

BLACK: 1
color: 1

val1: 0
val1: color xor BLACK
print val1

comment {

> > do/args %red.r "-c % .. /test/test-xor.red"

-=== Red Compiler 0.5.0 ===-

Compiling /C/ .. /test/test-xor.red ...
...compilation time : 505 ms

Compiling to native code...
**\* Compilation Error: undefined symbol: ts610
**\* in file: %/C/ .. /test/test-xor.red
**\* in function: exec/f_modulo
**\* at line: 1
**\* near: [ts610 0 stack/arguments
    ~b: type-check ts610 1 ~a
]
}



Comments:
--------------------------------------------------------------------------------

On 2015-02-26T08:34:01Z, iArnold, commented:
<https://github.com/red/red/issues/1044#issuecomment-76140286>

    Compiling a program twice in same Rebol console is not possible
    (the -d is not of any influence on the result)
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    > > cd red
    > > == %/C/ .. /red/
    > > do/args %red.r "-c -d %../ .. /test/moves-test.red"
    
    -=== Red Compiler 0.5.0 ===-
    
    Compiling /C/ .. /test/moves-test.red ...
    ...compilation time : 756 ms
    
    Compiling to native code...
    ...compilation time : 30796 ms
    ...linking time     : 5778 ms
    ...output file size : 2036736 bytes
    ...output file      : C:\ .. \red\moves-test.exe
    
    > > do/args %red.r "-c -d %../ .. /test/moves-test.red"
    
    -=== Red Compiler 0.5.0 ===-
    
    Compiling /C/ .. /test/moves-test.red ...
    ...compilation time : 786 ms
    
    Compiling to native code...
    **\* Compilation Error: undefined symbol: ts615
    **\* in file: %/C/ .. /test/moves-test.red
    **\* in function: exec/f_modulo
    **\* at line: 1
    **\* near: [ts615 0 stack/arguments
        ~b: type-check ts615 1 ~a
    ]
    

--------------------------------------------------------------------------------

On 2015-02-26T09:07:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1044#issuecomment-76144276>

    Duplicate with #1042.

