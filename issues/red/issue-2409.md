
#2409: `sqrt`function works in REPL, but does not compile
================================================================================
Issue is closed, was reported by DideC and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2409>

`sqrt` function does not compile (but, `square-root` compile without any problem).
 The following code:
```
Red []
sqrt 4
```
...give this error:
```
-=== Red Compiler 0.6.1 ===- 

Compiling E:\REBOL\RED\Tests\tmp.red ...
...using libRedRT built on 10-Jan-2017/14:51:18+1:00
...compilation time : 18 ms

Target: MSDOS 

Compiling to native code...
*** Compilation Error: undefined symbol: red/natives/sqrt* 
*** in file: %/E/REBOL/RED/Tests/tmp.red 
*** at line: 326 
*** near: [
    natives/sqrt* true 
    stack/unwind #user-code
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-02-14T11:49:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2409#issuecomment-279687166>

    Good catch.

