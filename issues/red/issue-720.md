
#720: Compiling %console.red more than once does not work
================================================================================
Issue is closed, was reported by kealist and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/720>

Getting an error the second time I try to compile the console (with a vanilla fork):
The first time it compiles correctly, but the second time, I have to restart Rebol to get it to work

```
REBOL/View 2.7.8.3.1 1-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
>> do/args %red.r "%tests/console.red"    

-=== Red Compiler 0.4.1 ===-    

Compiling /C/Users/kealist/Documents/GitHub/red-1/tests/console.red ...
...compilation time:     382 ms    

Compiling to native code...
...compilation time : 14554 ms
...linking time     : 2082 ms
...output file size : 315392 bytes
...output file      : C:\Users\kealist\Documents\GitHub\red-1\console.exe
>> do/args %red.r "%tests/console.red"    

-=== Red Compiler 0.4.1 ===-    

Compiling /C/Users/kealist/Documents/GitHub/red-1/tests/console.red ...
*** Compilation Error: undefined word make
*** in file: %/C/Users/kealist/Documents/GitHub/red-1/tests/console.red
*** near: [make datatype! #get-definition TYPE_UNSET none!: make datatype! #get-definition]
>>
```



Comments:
--------------------------------------------------------------------------------

On 2014-03-07T18:33:27Z, dockimbel, commented:
<https://github.com/red/red/issues/720#issuecomment-37053171>

    This is a regression caused by improper placing of recently added COMMENT mezz definition in boot script.

