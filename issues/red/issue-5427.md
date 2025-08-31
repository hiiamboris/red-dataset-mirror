
#5427: request-file changes current path of the process
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5427>

**Describe the bug**
`request-file` changes the current path of the process silently and doesn't update `system/options/path`, hence `pwd`,0 `ls`, `what-dir` etc. still access the old path but `read`, `write` uses the process' path.


**To reproduce**
Steps to reproduce the behavior:

```red
>> pwd
%/C/Users/test/
>> get-current-dir
== "C:\Users\test\"

>>  request-file
== %/C/Users/test/Downloads/file.txt

>> pwd
%/C/Users/test/

>> get-current-dir
== "C:\Users\test\Downloads\"  ; <<<<<
```

**Expected behavior**
`request-file` should not change process' path or restore it back.

**Platform version**
```red
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4949 date: 1-Sep-2023/16:17:00 commit: #8fa47cf440b0af7eaf1c35fcf1903f7f1c074aa3 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


