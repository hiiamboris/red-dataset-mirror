
#2916: `red build libRed` fails on Arch Linux x86-64
================================================================================
Issue is closed, was reported by AntonMeep and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2916>

I installed 32-bit libraries and everything works fine (at least simple Hello World program), but compilation of libRed fails:
```
$ ./red-22jul17-eb871f8 build libRed

-=== Red Compiler 0.6.3 ===- 

Compiling /home/me/dev/libRed/libRed.red ...
Compiling compression library...
...compilation time : 3383 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: invalid path value: OS-image/make-image 
*** in file: %/home/me/dev/libRed/libRed.red 
*** in function: exec/redImage
*** at line: 1 
*** near: [[rgb: src] 
    img/node: OS-image/make-image width height rgb null null
]
```

I tried with both 0.6.3 and latest build (eb871f8).

Looks like it fails on [this](https://github.com/red/red/blob/master/libRed/libRed.red#L534) line. 


Comments:
--------------------------------------------------------------------------------

On 2017-07-22T22:56:21Z, qtxie, commented:
<https://github.com/red/red/issues/2916#issuecomment-317215723>

    Fixed by this commit: 6a7e2baff4f84cb065bf5e3a56d2f396b25576a9

