
#2673: macOS: Console compilation with LibRedRT fails
================================================================================
Issue is closed, was reported by x8x and has 4 comment(s).
<https://github.com/red/red/issues/2673>

Not a recent regression.
```
  % red -c console.red
-=== Red Compiler 0.6.2 ===- 

Compiling /red/environment/console/console.red ...
Compiling libRedRT...
...compilation time : 1343 ms

Compiling to native code...
...compilation time : 35861 ms
...linking time     : 429 ms
...output file size : 872448 bytes
...output file      : /red/environment/console/libRedRT.dylib 


...compilation time : 308 ms

Target: Darwin 

Compiling to native code...
*** Compilation Error: undefined symbol: red/unicode/decode-utf8-char 
*** in file: %/red/environment/console/POSIX.reds 
*** in function: exec/terminal/fd-read
*** at line: 235 
*** near: [
    unicode/decode-utf8-char utf-char :len
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-05-12T05:01:48Z, qtxie, commented:
<https://github.com/red/red/issues/2673#issuecomment-300984343>

    We always need to use `-r` to complie the console, no? 

--------------------------------------------------------------------------------

On 2017-05-12T06:54:27Z, x8x, commented:
<https://github.com/red/red/issues/2673#issuecomment-300998882>

    Ok, didn't know that. Thanks.

