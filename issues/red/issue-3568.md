
#3568: Compile (-c) error using query action
================================================================================
Issue is closed, was reported by amreus and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3568>

Given this Red file `q.red`:

```red
Red [ file: "q.red" ]

foreach file read %. [
   q: query file
   ; print [file query file]
]
```

Generates the following error when using the command line: `red -c q.red` using `Red 0.6.3 for Windows built 16-Oct-2018/14:40:36-04:00 commit #7f4ed96` on Windows 10 Home x64.

```
-=== Red Compiler 0.6.3 ===- 

Compiling C:\Users\Amreus\Code\Red\red-lang-sandbox\utils\q.red ...
...using libRedRT built on 16-Oct-2018/22:23:02
...compilation time : 63 ms

Target: MSDOS 

Compiling to native code...
*** Compilation Error: undefined symbol: red/actions/query* 
*** in file: %/C/Users/Amreus/Code/Red/red-lang-sandbox/utils/q.red 
*** at line: 332 
*** near: [
    actions/query* 
    stack/unwind 
    word/set 
    stack/unwind
]
```



Comments:
--------------------------------------------------------------------------------

On 2018-10-17T02:42:45Z, dockimbel, commented:
<https://github.com/red/red/issues/3568#issuecomment-430469711>

    `query` action is not yet supported. It will be implemented in 0.7.0, with the rest of the missing I/O features.
    
    The current `query` is a limited and temporary implementation, that seems to be not supported when compiling in dev mode. Though, that should be an easy fix.

--------------------------------------------------------------------------------

On 2018-10-17T21:02:02Z, dockimbel, commented:
<https://github.com/red/red/issues/3568#issuecomment-430788497>

    I have cherry picked a [commit](https://github.com/red/red/commit/d11e5eb6cbda5cd83405011cbad1a60a9a326113) from `port-type` branch to enable libRedRT support for those I/O actions. So now your code should compile fine in dev mode.

