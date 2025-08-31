
#3235: Compiler crashes when using the --no-runtime option
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/3235>

### Expected behavior
The complier does not crash when the --no-runtime argument is used.
### Actual behavior
The complier crashes when the --no-runtime argument is used.
```text
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Cannot use path on none! value 
*** Where: set-image-info 
*** Near:  [set-integer-at job spec/2/2 + 4] 
```
### Steps to reproduce the problem
Compile the following program using the --no-runtime option
```text
Red/System []

a: 1
b: 2

```

### Red version and build date, operating system with version
>> system/build
== make object! [
    date: 5-Feb-2018/7:28:22+08:00
    config: make object! 

Windows 7 & macOS 10.12.6



