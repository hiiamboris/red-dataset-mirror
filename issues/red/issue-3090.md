
#3090: CALL/INPUT crashed cli
================================================================================
Issue is closed, was reported by JiaChen-Zeng and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3090>

### Expected behavior

Report an exception in console

### Actual behavior

Crashed

### Steps to reproduce the problem

```
>> call/input %a "cd"

*** Runtime Error 1: access violation
*** at: 77E7EBD0h
```

The file `%a` doesn't exist.

### Red version and build date, operating system with version.

Red for Windows version 0.6.3 built 29-Oct-2017/2:07:07+08:00

Windows 10



Comments:
--------------------------------------------------------------------------------

On 2017-11-02T02:50:02Z, qtxie, commented:
<https://github.com/red/red/issues/3090#issuecomment-341302694>

    The CLI console works fine. Only the gui console crashes. 

