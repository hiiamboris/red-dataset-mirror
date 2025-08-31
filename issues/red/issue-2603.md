
#2603: remove-each breaks compilation
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2603>

The following code runs perfectly fine in interpreter, but compiler will choke up:
```
Red []

remove-each x [1 2 3] ['whatever]
```
```
-=== Red Compiler 0.6.2 ===-

Compiling c:\Users\vvv0v\Desktop\RED\bug.red ...
...using libRedRT built on 20-Apr-2017/12:58:25+5:00
...compilation time : 24 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: red/natives/remove-each-next
*** in file: %/c/Users/vvv0v/Desktop/RED/bug.red
*** at line: 332
*** near: [
    natives/remove-each-next 1
]
```


