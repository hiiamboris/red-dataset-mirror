# Issue #5648: Compiler output executable file's name is incomplete
<https://github.com/red/red/issues/5648>

**Describe the bug**

When the red source file's name is like "a.something.red", the compiler will output "a.exe" instead of "a.something.exe".

**To reproduce**
Steps to reproduce the behavior:
```
D:\Projects\tests>..\red-toolchain.exe 002.series-manip.red

-=== Red Compiler 0.6.6 ===-

Compiling D:\Projects\tests\002.series-manip.red ...
...using libRedRT built on 18-Sep-2025/13:55:23
...compilation time : 39 ms

Target: MSDOS

Compiling to native code...
...compilation time : 1163 ms
...global words     : 12053 (36.64%)
...linking time     : 459 ms
...output file size : 100864 bytes
...output file      : D:\Projects\tests\002.exe
```

**Expected behavior**

Should output "002.series-manip.exe".

**Platform version**
```
RED: [ branch: "master" tag: #v0.6.6 ahead: 0 date: 19-Mar-2025/13:09:25 commit: #6942c7a021253150c3e3cf90428305892340db03 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
```



<no comments>
