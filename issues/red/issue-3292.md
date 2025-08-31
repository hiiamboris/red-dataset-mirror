
#3292: Recursively defined paths are crashing
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3292>

### Expected behavior
Return a value.

### Actual behavior
Crashes the process.

### Steps to reproduce the problem
```
>> z: to-path []  append/only z z
<crash>
```
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 27-Mar-2018/11:52:41+08:00


