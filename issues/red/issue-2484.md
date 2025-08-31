
#2484: Compiler: `#include file` with absolute path of file including other files, wont find included files
================================================================================
Issue is open, was reported by x8x and has 6 comment(s).
[type.compiler]
<https://github.com/red/red/issues/2484>

Let's work in path `/dev/`.
Let's have file `%test.red` with content:
```
Red []

#include %/git/red/red/environment/console/console.red
```
now try to compile it:
```
  % red -r -c test.red

-=== Red Compiler 0.6.1 ===- 

Compiling /dev/test.red ...
*** Compilation Error: include file not found: input.red 
*** in file: /dev/test.red
*** near: [
    #include %input.red 
    #include %help.red 
    #include %engine.red 
    system/console/launch #pop-path
]
```
Now the same with a relative path:
```
Red []

#include %../git/red/red/environment/console/console.red
```
compile:
```
  % red -r -c test.red

-=== Red Compiler 0.6.1 ===- 

Compiling /dev/test.red ...
...compilation time : 226 ms

Target: Darwin 

Compiling to native code...
...compilation time : 2480 ms
...linking time     : 98 ms
...output file size : 163840 bytes
...output file      : /dev/test 
```
No problem :-)
(tested on macOS and Linux)


Comments:
--------------------------------------------------------------------------------

On 2017-03-18T05:58:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2484#issuecomment-287519225>

    Does it work if you compile with `-r` instead of `-c`? Current console code contains a lot of R/S code, so it can't be properly compiled with just `-c`.

--------------------------------------------------------------------------------

On 2017-03-18T06:12:23Z, x8x, commented:
<https://github.com/red/red/issues/2484#issuecomment-287519755>

    It doesn't. BTW I did a `red -u ..` before and LibRT really makes debugging faster! Kudos! 👍 

--------------------------------------------------------------------------------

On 2017-03-18T06:39:42Z, x8x, commented:
<https://github.com/red/red/issues/2484#issuecomment-287520807>

    Same issue on Linux

