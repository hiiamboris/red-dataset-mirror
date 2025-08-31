
#4040: Cannot compile float32 value 2147483647.0
================================================================================
Issue is closed, was reported by qtxie and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/4040>

**Describe the bug**
Compiles the following code:
```
Red/System []
probe as float32! 2147483647.0
````
Got error:
```
*** Red/System Compiler Internal Error: Math Error : Math or number overflow 
*** Where: to-binary32 
*** Near:  [forall list [
expr: list/1 
if block? unbox expr [comp-expression expr yes] 
if object? expr [cast expr] 
if type <> 'inline [
either all [types not tag? expr block? types/1 'value = last types/1] [
emitter/push-struct expr resolve-aliased types/1
] [
emitter/target/emit-argument expr fspec
]
] 
if types [types: skip types -2]
]] 
```

**Platform version (please complete the following information)**
```
Latest Red on Windows.
```



Comments:
--------------------------------------------------------------------------------

On 2019-09-21T10:39:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/4040#issuecomment-533787441>

    @qtxie It works correctly for me on both Windows 7 and macOS.
    
    MacOS:
    ```
    Compiling /Users/peter/VMShare/Red/red/bug-test.reds ...
    
    Target: Darwin 
    
    Compiling to native code...
    ...compilation time : 225 ms
    ...linking time     : 7 ms
    ...output file size : 20480 bytes
    ...output file      : /Users/peter/VMShare/Red/red/bug-test 
    
    
    mbp:red peter$ ./bug-test
    2.14748e+09
    mbp:red peter$ cat bug-test.reds
    Red/System []
    probe 2147483647.0
    mbp:red peter$ git log
    commit fa7eb3d6677fb0c21bb7c99ea58c4835848f7e98 (HEAD -> master, upstream/master)
    Author: PeterWAWood <PeterWAWood@gmail.com>
    Date:   Sat Sep 21 08:11:58 2019 +0800
    ```
    
    Windows 7
    ```
    -=== Red Compiler 0.6.4 ===-
    
    Compiling e:\Red\red\bug-test.reds ...
    
    Target: MSDOS
    
    Compiling to native code...
    Script: "Red/System PE/COFF format emitter" (none)
    ...compilation time : 297 ms
    ...linking time     : 62 ms
    ...output file size : 25088 bytes
    ...output file      : e:\Red\red\bug-test.exe
    
    == none
    >> o: make string! 100
    == ""
    >> call/output "bug-test" o
    == 0
    >> o
    == "2.14748e+009^/"
    >> probe read %bug-test.reds
    "Red/System []^/probe 2147483647.0^/"
    == "Red/System []^/probe 2147483647.0^/"
    ```

--------------------------------------------------------------------------------

On 2019-09-21T10:46:01Z, qtxie, commented:
<https://github.com/red/red/issues/4040#issuecomment-533787871>

    @PeterWAWood Sorry, the code snippet was wrong. I updated it.

--------------------------------------------------------------------------------

On 2019-09-21T23:49:48Z, PeterWAWood, commented:
<https://github.com/red/red/issues/4040#issuecomment-533837923>

    @qtxie With `as float32!`added, I also get the compilation error. Interestingly, I don't get a compilation error if I assign the value to a float! variable and then convert that:
    ```
    -=== Red Compiler 0.6.4 ===- 
    
    Compiling /Users/peter/VMShare/Red/red/bug-test.reds ...
    
    Target: Darwin 
    
    Compiling to native code...
    ...compilation time : 243 ms
    ...linking time     : 9 ms
    ...output file size : 20480 bytes
    ...output file      : /Users/peter/VMShare/Red/red/bug-test 
    
    
    mbp:red peter$ ./bug-test
    2.14748e+09.0
    mbp:red peter$ cat bug-test.reds
    Red/System []
    max-int-as-float: 2147483647.0
    probe as float32! max-int-as-float
    ``` 

