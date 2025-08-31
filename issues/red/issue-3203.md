
#3203: Compilation Error: undefined symbol: red/natives/enbase
================================================================================
Issue is closed, was reported by kermitaner and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3203>

compiling 
```
Red []
probe enbase "abc"
```
produces an error: 
> Compiling D:\save\red\rosetta\vignere\t1.red ...
...using libRedRT built on 18-Jan-2018/23:40:21+1:00
...compilation time : 31 ms

Target: MSDOS

Compiling to native code...
Compilation Error: undefined symbol: red/natives/enbase
* in file: %/D/save/red/rosetta/vignere/t1.red
at line: 332 near: [
natives/enbase* true -1
stack/unwind
f_probe
stack/unwind #user-code
]
Gregg already found out:
It looks like red/natives/enbase* needs to be added to https://github.com/red/red/blob/master/system/utils/libRedRT-exports.r. 


